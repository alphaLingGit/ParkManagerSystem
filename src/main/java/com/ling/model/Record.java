package com.ling.model;

import javax.persistence.*;

@Table(name = "record")
public class Record {
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
     * 停车时间
     */
    @Column(name = "parking_time")
    private String parkingTime;

    /**
     * 停车费用
     */
    private Double cost;

    /**
     * 发票编号
     */
    private String invoice;

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
     * 获取停车费用
     *
     * @return cost - 停车费用
     */
    public Double getCost() {
        return cost;
    }

    /**
     * 设置停车费用
     *
     * @param cost 停车费用
     */
    public void setCost(Double cost) {
        this.cost = cost;
    }

    /**
     * 获取发票编号
     *
     * @return invoice - 发票编号
     */
    public String getInvoice() {
        return invoice;
    }

    /**
     * 设置发票编号
     *
     * @param invoice 发票编号
     */
    public void setInvoice(String invoice) {
        this.invoice = invoice;
    }
}