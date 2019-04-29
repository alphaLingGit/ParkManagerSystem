package com.ling.controller;

import com.github.pagehelper.PageInfo;
import com.ling.model.Message;
import com.ling.model.Record;
import com.ling.model.User;
import com.ling.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by LING on 2019/3/5.
 */
@Controller
public class RecordController {

    @Autowired
    private RecordService recordService;

    @GetMapping("/records")
    public ModelAndView getRecordPage(HttpSession session) {
        Object user = session.getAttribute("user");
        User user1 = null;
        if(user == null) {
            return new ModelAndView("noAuth");
        }
        return new ModelAndView("record");
    }

    @ResponseBody
    @PostMapping("/records")
    public Message getRecords(HttpSession session, Integer pageNum, Record parma) {
        if(pageNum == null) {
            pageNum = 1;
        }
        User user = (User)session.getAttribute("user");
        if(user.getType()==0) {
            parma.setCarNum(user.getCarNum());
        }
        PageInfo<Record> records = recordService.queryPageListByWhere(parma, pageNum, 8);
        return Message.success().add("cards",records);
    }
    @ResponseBody
    @PostMapping("/addRecord")
    public Message addRecord(Record record) {
        Integer result = recordService.saveSelect(record);
        if(result > 0) {
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @ResponseBody
    @PostMapping("/updateRecord")
    public Message updateRecord(Record record) {
        Integer result = recordService.updateSelective(record);
        if(result > 0) {
            return Message.success();
        }else{
            return Message.fail();
        }
    }

}
