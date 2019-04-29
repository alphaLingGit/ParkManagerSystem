package com.ling.model;

import javax.persistence.*;

@Table(name = "card")
public class Card {
    /**
     * 卡号
     */
    @Id
    @Column(name = "card_num")
    private Integer cardNum;

    /**
     * 用户ID
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 卡型（年卡/临时卡）
     */
    @Column(name = "card_type")
    private String cardType;

    /**
     * 车位编号
     */
    @Column(name = "parking_num")
    private Integer parkingNum;

    /**
     * 卡余额
     */
    private String balance;

    /**
     * 获取卡号
     *
     * @return card_num - 卡号
     */
    public Integer getCardNum() {
        return cardNum;
    }

    /**
     * 设置卡号
     *
     * @param cardNum 卡号
     */
    public void setCardNum(Integer cardNum) {
        this.cardNum = cardNum;
    }

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
     * 获取卡型（年卡/临时卡）
     *
     * @return card_type - 卡型（年卡/临时卡）
     */
    public String getCardType() {
        return cardType;
    }

    /**
     * 设置卡型（年卡/临时卡）
     *
     * @param cardType 卡型（年卡/临时卡）
     */
    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

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
     * 获取卡余额
     *
     * @return balance - 卡余额
     */
    public String getBalance() {
        return balance;
    }

    /**
     * 设置卡余额
     *
     * @param balance 卡余额
     */
    public void setBalance(String balance) {
        this.balance = balance;
    }
}