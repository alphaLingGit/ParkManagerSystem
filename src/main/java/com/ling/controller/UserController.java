package com.ling.controller;

import com.github.pagehelper.PageInfo;
import com.ling.model.Message;
import com.ling.model.User;
import com.ling.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by LING on 2019/3/2.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/users")
    @ResponseBody
    public Message getUsers(Integer pageNum,User param) {
        if(null == pageNum) {
            pageNum = 1;
        }
        PageInfo<User> list = userService.queryPageListByWhere(param,pageNum,8);
        return Message.success().add("users",list);
    }

    @GetMapping("/users")
    public ModelAndView getUsersPage(HttpSession session) {
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
        return new ModelAndView("users");
    }
    @PostMapping("/addUser")
    @ResponseBody
    public Message addUser(User user) {
        Integer result = userService.saveSelect(user);
        if(result > 0) {
            return Message.success();
        }
        return Message.fail();
    }

    @PostMapping("/login")
    @ResponseBody
    public Message login(User user,HttpSession session) {
        User one = userService.queryOne(user);
        if(null != one) {
            session.setAttribute("user",one);
            session.setAttribute("userType",one.getType());
            return Message.success().add("user", one);
        }
        return Message.fail();
    }


    @GetMapping("/log-out")
    public void logout(HttpServletRequest request,HttpServletResponse response, HttpSession session) {
        session.invalidate();
        String url = request.getContextPath();
        try {
            response.sendRedirect("index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @GetMapping("/login")
    public ModelAndView test() {
        return new ModelAndView("login");
    }

    @ResponseBody
    @GetMapping("/getUsersById")
    public Message getUserById(Integer userId) {
        User user = userService.queryById((long) userId);
        return Message.success().add("user",user);
    }
    @ResponseBody
    @PostMapping("/updateUser")
    public Message updateUser(User user) {
        Integer result = userService.updateSelective(user);
        if(result > 0) {
            return Message.success();
        }else{
            return Message.fail();
        }
    }
    @ResponseBody
    @GetMapping("/deleteUser")
    public void deleteUser(Long userId) {
        userService.deleteById(userId);
    }
}
