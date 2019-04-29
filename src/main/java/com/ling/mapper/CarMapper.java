package com.ling.mapper;

import com.ling.model.Car;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;
import tk.mybatis.mapper.common.Mapper;

public interface CarMapper extends Mapper<Car> {
    @Delete("delete from car where car_num=#{carNum}")
    void deleCarByCarNum(@Param("carNum") String carNum);

}