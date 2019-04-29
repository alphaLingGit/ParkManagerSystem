package com.ling.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "ezstop")
public class Ezstop {
    /**
     * 车位编号
     */
    @Column(name = "parking_num")
    private Integer parkingNum;

    /**
     * 车牌号码
     */
    @Column(name = "car_num")
    private String carNum;

    /**
     * 开始时间
     */
    @Column(name = "start_time")
    private Date startTime;

    /**
     * 离开时间
     */
    @Column(name = "leave_time")
    private Date leaveTime;

    /**
     * 停车时间
     */
    @Column(name = "parking_time")
    private String parkingTime;

    /**
     * 是否在位
     */
    @Column(name = "is_in_position")
    private String isInPosition;

    /**
     * 获取车位编号
     *
     * @return parking_num - 车位编号
     */
    public Integer getParkingNum() {
        return parkingNum;
    }

    /**
     * 设置车位编号
     *
     * @param parkingNum 车位编号
     */
    public void setParkingNum(Integer parkingNum) {
        this.parkingNum = parkingNum;
    }

    /**
     * 获取车牌号码
     *
     * @return car_num - 车牌号码
     */
    public String getCarNum() {
        return carNum;
    }

    /**
     * 设置车牌号码
     *
     * @param carNum 车牌号码
     */
    public void setCarNum(String carNum) {
        this.carNum = carNum;
    }

    /**
     * 获取开始时间
     *
     * @return start_time - 开始时间
     */
    public Date getStartTime() {
        return startTime;
    }

    /**
     * 设置开始时间
     *
     * @param startTime 开始时间
     */
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    /**
     * 获取离开时间
     *
     * @return leave_time - 离开时间
     */
    public Date getLeaveTime() {
        return leaveTime;
    }

    /**
     * 设置离开时间
     *
     * @param leaveTime 离开时间
     */
    public void setLeaveTime(Date leaveTime) {
        this.leaveTime = leaveTime;
    }

    /**
     * 获取停车时间
     *
     * @return parking_time - 停车时间
     */
    public String getParkingTime() {
        return parkingTime;
    }

    /**
     * 设置停车时间
     *
     * @param parkingTime 停车时间
     */
    public void setParkingTime(String parkingTime) {
        this.parkingTime = parkingTime;
    }

    /**
     * 获取是否在位
     *
     * @return is_in_position - 是否在位
     */
    public String getIsInPosition() {
        return isInPosition;
    }

    /**
     * 设置是否在位
     *
     * @param isInPosition 是否在位
     */
    public void setIsInPosition(String isInPosition) {
        this.isInPosition = isInPosition;
    }
}