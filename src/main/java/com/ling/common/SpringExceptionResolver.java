package com.ling.common;

import com.ling.exception.MyException;
import com.ling.model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.annotation.Annotation;

/**
 * Created by LING on 2019/3/11.
 */
public class SpringExceptionResolver implements HandlerExceptionResolver , Ordered {

    private int order = Ordered.HIGHEST_PRECEDENCE;

    /*private FastJsonConfig fastJsonConfig;

    @Autowired
    public SpringExceptionResolver(FastJsonConfig fastJsonConfig) {
        this.fastJsonConfig = fastJsonConfig;
    }*/
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) {
        Message result;
        String defaultMsg = "System Error!";
        System.out.println(e.getMessage());
        if(e instanceof MyException) {
            result = Message.fail().add("errMsg",e.getMessage()).add("code",200);
        } else {
            result = Message.fail().add("errMsg",defaultMsg).add("code",200);
        }
        /*PrintWriter writer = null;
        try {
            writer = response.getWriter();
            writer.print(result);
            writer.flush();
        } catch (IOException e1) {
            e1.printStackTrace();
        }finally {
            writer.close();
        }*/

        return new ModelAndView("jsonView",result.getExtend());
//        return null;
    }

    @Override
    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }
}
