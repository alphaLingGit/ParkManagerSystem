package com.ling.service;

import com.ling.mapper.CarMapper;
import com.ling.mapper.CardMapper;
import com.ling.model.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by LING on 2019/3/3.
 */
@Service
public class CarService extends BaseService<Car> {
    @Autowired
    private CarMapper carMapper;

    public void deleCarByCarNum(String carNum) {
        carMapper.deleCarByCarNum(carNum);
    }
}
