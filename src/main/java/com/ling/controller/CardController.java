package com.ling.controller;

import com.github.pagehelper.PageInfo;
import com.ling.exception.MyException;
import com.ling.model.Card;
import com.ling.model.Message;
import com.ling.model.User;
import com.ling.service.CardService;
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
public class CardController {

    @Autowired
    private CardService cardService;

    @GetMapping("/cards")
    public ModelAndView getCardsPage(HttpSession session) {
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
        return new ModelAndView("card");
    }

    @PostMapping("/cards")
    @ResponseBody
    public Message getCards(Integer pageNum, Card parma) {
        if(null == pageNum) {
            pageNum = 1;
        }
        PageInfo<Card> cards = cardService.queryPageListByWhere(parma, pageNum, 8);
        return Message.success().add("cards", cards);
    }
    @ResponseBody
    @PostMapping("/addCard")
    public Message addCard(Card card) {

        cardService.findParkNum(card);

        Integer result = cardService.saveSelect(card);
        if(result > 0) {
            return Message.success();
        }
        return Message.fail();
    }

    @ResponseBody
    @PostMapping("/updateCard")
    public Message updateCard(Card card) {

        cardService.findParkNum(card);

        Integer result = cardService.updateSelective(card);
        if(result > 0) {
            return Message.success();
        }
        return Message.fail();
    }

    @ResponseBody
    @PostMapping("/getCardByCardNum")
    public Message getCardByCardNum(Integer cardNum) {
        Card card = cardService.queryById((long) cardNum);
        return Message.success().add("card", card);
    }

    @ResponseBody
    @PostMapping("/findParkingNumByCardType")
    public List<Integer> findParkingNumByCardType(String cardType) {
        return cardService.findParkingNumByCardType(cardType);
    }

    @ResponseBody
    @GetMapping("/deleteCard")
    public void deleteCard(Long cardNum) {
        cardService.deleteById(cardNum);
    }
}
