package com.ling.mapper;

import com.ling.model.Ezstop;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

@Repository
public interface EzstopMapper extends Mapper<Ezstop> {

    @Select("select * from ezstop where is_in_position!='N' and parking_num=#{parkingNum}")
    List<Ezstop> getOneByparkingNumAndisInPosition(@Param("parkingNum") Integer parkingNum);

    @Select("select * from ezstop where (leave_time is null and parking_num=#{parkingNum})")
    List<Ezstop> getOneByparkingNumAndunInPosition(@Param("parkingNum") Integer parkingNum);

    @Update("update ezstop set leave_time=${leave_time},parking_time=${parking_time},is_in_position=N where parking_num=${parking_num} and is_in_position=Y")
    Integer returnCar(@Param("leave_time")Date leaveTime,@Param("parking_time")String parkingTime,@Param("parking_num")Integer parkingNum);
}