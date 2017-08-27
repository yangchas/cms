/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.rongtai.cms.entity;

import javax.persistence.*;

/**
 * 角色.
 *
 * @author tan
 */
@Entity
@Table(name = "tbl_join", schema = "", catalog = "cms")
public class JoinUs extends BaseEntity<Long> {

    private static final long serialVersionUID = -5357160308204599911L;


    private String position;    //职位
    private String region;    //地区
    private String type;    //类型
    private String name;    //姓名
    private Boolean sex;     //性别
    private String phone;    //电话
    private String qq;      //qq
    private String mail;    //E-mail
    private String annexe;    //附件
    private String remark;    //备注

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getAnnexe() {
        return annexe;
    }

    public void setAnnexe(String annexe) {
        this.annexe = annexe;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
