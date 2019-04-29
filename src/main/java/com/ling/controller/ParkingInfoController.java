package com.ling.controller;

import com.github.pagehelper.PageInfo;
import com.ling.model.Ezstop;
import com.ling.model.Message;
import com.ling.model.ParkingInfo;
import com.ling.model.User;
import com.ling.service.ParkingInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by LING on 2019/3/5.
 */
@Controller
public class ParkingInfoController {

    @Autowired
    private ParkingInfoService parkingInfoService;

    @GetMapping("/parking_info")
    public ModelAndView getParkingInfoPage(HttpSession session) {
        Object user = session.getAttribute("user");
        User user1 = null;
        if(user == null) {
            return new ModelAndView("noAuth");
        }else {
            user1 = (User)user;
            if(user1.getType() == 0) {
                return new ModelAndView("noAuth");
            }
        }
        return new ModelAndView("parking_info");
    }

    @ResponseBody
    @PostMapping("/parking_info")
    public Message getParingInfo(Integer pageNum, ParkingInfo param) {
        if(pageNum == null) {
            pageNum = 1;
        }
        PageInfo<ParkingInfo> parkingInfos = parkingInfoService.queryPageListByWhere(param, pageNum, 8);
        return Message.success().add("parkingInfos", parkingInfos);
    }
    @ResponseBody
    @PostMapping("/addParkingInfo")
    public Message addParkingInfo(ParkingInfo parkingInfo) {
        Integer result = parkingInfoService.saveSelect(parkingInfo);
        if(result > 0) {
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @ResponseBody
    @PostMapping("/updateParkingInfo")
    public Message updateParkingInfo(ParkingInfo parkingInfo) {
        Integer result = parkingInfoService.updateSelective(parkingInfo);
        if(result > 0) {
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @ResponseBody
    @PostMapping("/getParkingInfo")
    public Message getParkingInfoById(Integer parkingNum) {
        ParkingInfo parkingInfo = parkingInfoService.queryById((long) parkingNum);
        return Message.success().add("parkingInfo", parkingInfo);
    }

    @ResponseBody
    @GetMapping("/deletePark")
    public void deletePark(Long parkNum) {
        parkingInfoService.deleteById(parkNum);
    }

}
