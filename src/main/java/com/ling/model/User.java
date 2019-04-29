package com.ling.model;

import javax.persistence.*;

@Table(name = "user")
public class User {
    /**
     * 用户ID
     */
    @Id
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 身份证号
     */
    private String idnum;

    /**
     * 车牌号
     */
    @Column(name = "car_num")
    private String carNum;

    /**
     * 联系地址
     */
    private String addr;

    /**
     * 联系方式
     */
    private String phone;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 用户类型（1为管理员/0为普通用户）
     */
    private Integer type;

    /**
     * 获取用户ID
     *
     * @return user_id - 用户ID
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置用户ID
     *
     * @param userId 用户ID
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取用户名
     *
     * @return username - 用户名
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置用户名
     *
     * @param username 用户名
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 获取身份证号
     *
     * @return idnum - 身份证号
     */
    public String getIdnum() {
        return idnum;
    }

    /**
     * 设置身份证号
     *
     * @param idnum 身份证号
     */
    public void setIdnum(String idnum) {
        this.idnum = idnum;
    }

    /**
     * 获取车牌号
     *
     * @return car_num - 车牌号
     */
    public String getCarNum() {
        return carNum;
    }

    /**
     * 设置车牌号
     *
     * @param carNum 车牌号
     */
    public void setCarNum(String carNum) {
        this.carNum = carNum;
    }

    /**
     * 获取联系地址
     *
     * @return addr - 联系地址
     */
    public String getAddr() {
        return addr;
    }

    /**
     * 设置联系地址
     *
     * @param addr 联系地址
     */
    public void setAddr(String addr) {
        this.addr = addr;
    }

    /**
     * 获取联系方式
     *
     * @return phone - 联系方式
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置联系方式
     *
     * @param phone 联系方式
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取用户密码
     *
     * @return password - 用户密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置用户密码
     *
     * @param password 用户密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取用户类型（1为管理员/0为普通用户）
     *
     * @return type - 用户类型（1为管理员/0为普通用户）
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置用户类型（1为管理员/0为普通用户）
     *
     * @param type 用户类型（1为管理员/0为普通用户）
     */
    public void setType(Integer type) {
        this.type = type;
    }
}