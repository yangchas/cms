/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.rongtai.cms.entity;

import com.fasterxml.jackson.annotation.JsonValue;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * 角色.
 *
 * @author tan
 */
@Entity
@Table(name = "tbl_seo", schema = "", catalog = "cms")
public class Seo extends BaseEntity<Long> {

    private static final long serialVersionUID = -5357160308204599911L;

    /**
     * 1.类型
     */
    private Seo.Type type;
    /**
     * 2.页面标题
     */
    private String title;
    /**
     * 3.页面关键词
     */
    private String keywords;
    /**
     * 4.页面描述
     */
    private String description;

    public Seo() {
    }

    public Seo(Long id) {
        setId(id);
    }

    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    public Seo.Type getType() {
        return type;
    }

    public void setType(Seo.Type type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public enum Type {

        /** 首页 */
        index("首页"),

        /** 文章列表 */
        articleList("文章列表"),

        /** 文章内容 */
        articleContent("文章内容");

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
