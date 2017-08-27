/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.rongtai.cms.entity;

import com.fasterxml.jackson.annotation.JsonValue;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 建议.
 *
 * @author tan
 */
@Entity
@Table(name = "tbl_suggest", schema = "", catalog = "cms")
public class Suggest extends BaseEntity<Long> {

    private static final long serialVersionUID = 7547094656913748477L;
    private String title;    //摘要
    private String content;    //建议内容
    private Type type;    //类型
    private String contact;    //联系方式
    private String picture;    //照片

    public Suggest() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public enum Type {
        suggest("改进建议"),
        question("问题反馈");

        private String value;


        Type(String value) {
            this.value = value;
        }

        /**
         * 获取显示的名字
         *
         * @return
         */
        @JsonValue
        public String getValue() {
            return this.value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
}
