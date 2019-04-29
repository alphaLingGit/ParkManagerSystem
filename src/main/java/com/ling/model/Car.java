package com.ling.model;

import javax.persistence.*;

@Table(name = "car")
public class Car {
    /**
     * 车牌号码
     */
    @Column(name = "car_num")
    private String carNum;

    /**
     * 车辆品牌
     */
    @Column(name = "car_brand")
    private String carBrand;

    /**
     * 车辆颜色
     */
    @Column(name = "car_color")
    private String carColor;

    /**
     * 车辆照片
     */
    @Column(name = "car_picture")
    private String carPicture;

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
     * 获取车辆品牌
     *
     * @return car_brand - 车辆品牌
     */
    public String getCarBrand() {
        return carBrand;
    }

    /**
     * 设置车辆品牌
     *
     * @param carBrand 车辆品牌
     */
    public void setCarBrand(String carBrand) {
        this.carBrand = carBrand;
    }

    /**
     * 获取车辆颜色
     *
     * @return car_color - 车辆颜色
     */
    public String getCarColor() {
        return carColor;
    }

    /**
     * 设置车辆颜色
     *
     * @param carColor 车辆颜色
     */
    public void setCarColor(String carColor) {
        this.carColor = carColor;
    }

    /**
     * 获取车辆照片
     *
     * @return car_picture - 车辆照片
     */
    public String getCarPicture() {
        return carPicture;
    }

    /**
     * 设置车辆照片
     *
     * @param carPicture 车辆照片
     */
    public void setCarPicture(String carPicture) {
        this.carPicture = carPicture;
    }
}