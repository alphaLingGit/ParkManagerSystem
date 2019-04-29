package com.ling.service;

import com.ling.exception.MyException;
import com.ling.mapper.CardMapper;
import com.ling.mapper.ParkingInfoMapper;
import com.ling.model.Card;
import com.ling.model.ParkingInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by LING on 2019/3/3.
 */
@Service
public class CardService extends BaseService<Card>{
    @Autowired
    private CardMapper cardMapper;
    @Autowired
    private ParkingInfoMapper parkingInfoMapper;
    /**
     * 检测车位号是否有重复
     * @param card
     */
    public void findParkNum(Card card) {
        Card selectByPrimaryKey = cardMapper.selectByPrimaryKey(card);
        if(selectByPrimaryKey != null) {
            if(selectByPrimaryKey.getParkingNum() == card.getParkingNum()) {
                return ;
            }
        }
        List<Card> cards = cardMapper.selectAll();
        List<Integer> list = new ArrayList<Integer>();
        for(Card card1 : cards) {
            list.add(card1.getParkingNum());
        }
//        System.out.println("list:"+list);
        int i = list.indexOf(0);
        if(i > 0) {
            list.remove(i);
        }
//        System.out.println("list:"+list+","+card.getParkingNum());
//        System.out.println(list.contains(card.getParkingNum()));
        if(list.contains(card.getParkingNum())) {
            throw new MyException("该车位已被使用，请重新分配！");
        }
    }
    public List<Integer> findParkingNumByCardType(String cardType) {
        ParkingInfo parkingInfo = new ParkingInfo();
        if(cardType.equals("临时卡")) {
            parkingInfo.setParkingType("自由车位");
        }else if(cardType.equals("年卡")){
            parkingInfo.setParkingType("固定车位");
        }
        List<ParkingInfo> list = parkingInfoMapper.select(parkingInfo);
        List<Integer> parkNums = new ArrayList<>();
        for(ParkingInfo parkNum : list) {
            parkNums.add(parkNum.getParkingNum());
        }
        int i = parkNums.indexOf(0);
        if(i > 0) {
            parkNums.remove(i);
        }
        return parkNums;
    }
}
