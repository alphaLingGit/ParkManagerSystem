package com.ling.controller;

import com.github.pagehelper.PageInfo;
import com.ling.exception.MyException;
import com.ling.model.*;
import com.ling.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by LING on 2019/3/5.
 */

@Controller
public class EzstopController {

    @Autowired
    private EzstopService ezstopService;
    @Autowired
    private CardService cardService;
    @Autowired
    private UserService userService;

    @GetMapping("/ezstops")
    public ModelAndView getEzstopsPage(HttpSession session) {
        Object user = session.getAttribute("user");
        User user1 = null;
        if(user == null) {
            return new ModelAndView("noAuth");
        }
        return new ModelAndView("ezstop");
    }

    @PostMapping("/ezstops")
    @ResponseBody
    public Message getEzstops(HttpSession session,Integer pageNum, Ezstop parma) {
        if(null == pageNum) {
            pageNum = 1;
        }
        User user = (User)session.getAttribute("user");
        if(user.getType()==0) {
            parma.setCarNum(user.getCarNum());
        }
        PageInfo<Ezstop> cards = ezstopService.queryPageListByWhere(parma, pageNum, 8);
        return Message.success().add("cards", cards);
    }

    @ResponseBody
    @PostMapping("/addEzstop")
    public Message addEzstop(Integer cardNum,Ezstop ezstop) {
        Card card = cardService.queryById((long) cardNum);
        if(card == null) {
            throw new MyException("卡号有误！请重新输入");
        }
        if(card.getParkingNum() == 0) {
            throw new MyException("请为该卡分配停车位！");
        }
        List<Ezstop> ezstop1 = ezstopService.getOneByparkingNumAndunInPosition(card.getParkingNum());
        if(ezstop1.size() >= 1) {
            throw new MyException("正在停车中！");
        }
        ezstop.setParkingNum(card.getParkingNum());
        User user = userService.queryById((long) card.getUserId());
        ezstop.setCarNum(user.getCarNum());
        ezstop.setStartTime(new Date());
        Integer result = ezstopService.saveSelect(ezstop);
        if(result > 0) {
            return Message.success();
        }
        return Message.fail();
    }

    @ResponseBody
    @PostMapping("/updateEzstop")
    public Message updateEzstop(Integer cardNum) {
        return ezstopService.returnCar(cardNum);
    }

    @ResponseBody
    @PostMapping("/getEzstopById")
    public Message getEzstopById(Integer parkingNum) {
        Ezstop ezstop = ezstopService.queryById((long) parkingNum);
        return Message.success().add("ezstop", ezstop);
    }

}
