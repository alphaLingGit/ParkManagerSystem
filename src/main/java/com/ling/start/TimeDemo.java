package com.ling.start;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by LING on 2019/4/22.
 */
public class TimeDemo {

    public static void main(String[] args) {
        long start = new Date().getTime();
        long end = start + 1000*60*3 ;
        long time = end - start;
        //1000*60*60
        double l = (double)time / (1000 * 60 * 60);
        DecimalFormat decimalFormat = new DecimalFormat("##0.0");
        System.out.println(decimalFormat.format(l));
    }

}
