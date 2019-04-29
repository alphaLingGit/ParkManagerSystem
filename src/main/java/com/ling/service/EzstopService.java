package com.ling.service;

import com.ling.exception.MyException;
import com.ling.mapper.EzstopMapper;
import com.ling.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by LING on 2019/3/3.
 */
@Service
public class EzstopService extends BaseService<Ezstop>{

    @Autowired
    private EzstopMapper ezstopMapper;
    @Autowired
    private EzstopService ezstopService;
    @Autowired
    private RecordService recordService;
    @Autowired
    private CardService cardService;
    @Autowired
    private ParkingInfoService parkingInfoService;

    public List<Ezstop> getOneByparkingNumAndisInPosition(Integer parkingNum){
        return ezstopMapper.getOneByparkingNumAndisInPosition(parkingNum);
    }

    public List<Ezstop> getOneByparkingNumAndunInPosition(Integer parkingNum){
        return ezstopMapper.getOneByparkingNumAndunInPosition(parkingNum);
    }

    @Transactional
    public Message returnCar(Integer cardNum) {
        Card card = cardService.queryById((long) cardNum);
        if(card == null) {
            throw new MyException("卡号有误！请重新输入");
        }
        Ezstop param = new Ezstop();
        param.setParkingNum(card.getParkingNum());
        param.setIsInPosition("Y");
        Ezstop ezstop = ezstopService.queryOne(param);
        if(ezstop == null) {
            throw new MyException("无存车记录！");
        }
        ParkingInfo parkingInfo = parkingInfoService.queryById((long) ezstop.getParkingNum());
        ezstop.setLeaveTime(new Date());
        long l = ezstop.getLeaveTime().getTime() - ezstop.getStartTime().getTime();
        Double rate = 0.0;
        double time = (double) l / (1000 * 60 * 60);
        time = get1PointDouble(time);
        if(time <= 0.5) {
            rate = 0.0; //半小时内免费
        } else if(time > 0.5 && time <= 24.0) {
            rate = parkingInfo.getRate(); //一天之内原价
        } else {
            rate = parkingInfo.getRate() * 0.8; //超过一天打8折
        }
        double cost = get1PointDouble(time * rate);
        double balance = get1PointDouble(Double.valueOf(card.getBalance()) - cost);
        if(balance < 0) {
            throw new MyException("余额不足,请充值！");
        }
        ezstop.setParkingTime(time+"小时");
        ezstop.setIsInPosition("N");
        Integer result = ezstopService.updateBy2ExampleSelective(ezstop, ezstop.getParkingNum(),
                "parkingNum", "Y", "isInPosition");
        if(result > 0) {
            Record record = new Record();
            record.setParkingNum(ezstop.getParkingNum());
            record.setCarNum(ezstop.getCarNum());
            record.setParkingTime(ezstop.getParkingTime());
            record.setCost(cost);
            record.setInvoice(new Date().getTime()+"");
            recordService.saveSelect(record);

            card.setBalance(balance+"");
            //临时卡每次停车完后需要重新分配停车位
            if(card.getCardType().equals("临时卡")) {
                card.setParkingNum(0);
            }
            cardService.updateSelective(card);

            return Message.success();
        }
        return Message.fail();
    }

    private double get1PointDouble(double d) {
        DecimalFormat decimalFormat = new DecimalFormat("##0.0");
        String s = decimalFormat.format(d);
        return Double.valueOf(s);
    }
}
