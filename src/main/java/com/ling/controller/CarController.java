package com.ling.controller;

import com.github.pagehelper.PageInfo;
import com.ling.model.Car;
import com.ling.model.Message;
import com.ling.model.User;
import com.ling.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by LING on 2019/3/5.
 */
@Controller
public class CarController {

    @Autowired
    private CarService carService;

    @GetMapping("/cars")
    public ModelAndView getCarsPage(HttpSession session) {
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
        return new ModelAndView("cars");
    }

    @ResponseBody
    @PostMapping("/cars")
    public Message getCars(Integer pageNum,Car param) {
        if(null == pageNum) {
            pageNum = 1;
        }
        PageInfo<Car> list = carService.queryPageListByWhere(param,pageNum,8);
        return Message.success().add("cars",list);
    }

    @ResponseBody
    @PostMapping("/addCar")
    public Message addCar(Car car) {
        Integer result = carService.saveSelect(car);
        if(result > 0) {
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @ResponseBody
    @PostMapping("/updateCar")
    public Message updateCar(Car car) {
        Integer result = carService.updateByExampleSelective(car,car.getCarNum(),"carNum");
        if(result > 0) {
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @ResponseBody
    @PostMapping("/getCarByCarNum")
    public Message getCarByCarNum(String carNum) {
        Car car = new Car();
        car.setCarNum(carNum);
        Car one = carService.queryOne(car);
        return Message.success().add("car",one);
    }
    @ResponseBody
    @GetMapping("/deleteCar")
    public void deleteCar(String carNum) {
        carService.deleCarByCarNum(carNum);
    }
}
