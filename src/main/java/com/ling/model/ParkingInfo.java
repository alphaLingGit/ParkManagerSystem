package com.ling.model;

import javax.persistence.*;

@Table(name = "parking_info")
public class ParkingInfo {
    /**
     * 车位编号
     */
    @Id
    @Column(name = "parking_num")
    private Integer parkingNum;

    /**
     * 车位位置
     */
    private String location;

    /**
     * 车位类型（固定车位/自由车位）
     */
    @Column(name = "parking_type")
    private String parkingType;

    /**
     * 收费费率（0.5/1.0）
     */
    private Double rate;

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
     * 获取车位位置
     *
     * @return location - 车位位置
     */
    public String getLocation() {
        return location;
    }

    /**
     * 设置车位位置
     *
     * @param location 车位位置
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * 获取车位类型（固定车位/自由车位）
     *
     * @return parking_type - 车位类型（固定车位/自由车位）
     */
    public String getParkingType() {
        return parkingType;
    }

    /**
     * 设置车位类型（固定车位/自由车位）
     *
     * @param parkingType 车位类型（固定车位/自由车位）
     */
    public void setParkingType(String parkingType) {
        this.parkingType = parkingType;
    }

    /**
     * 获取收费费率（0.5/1.0）
     *
     * @return rate - 收费费率（0.5/1.0）
     */
    public Double getRate() {
        return rate;
    }

    /**
     * 设置收费费率（0.5/1.0）
     *
     * @param rate 收费费率（0.5/1.0）
     */
    public void setRate(Double rate) {
        this.rate = rate;
    }
}