/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.rongtai.cms.entity;

import com.fasterxml.jackson.annotation.JsonValue;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * 导航.
 *
 * @author tan
 */
@Entity
@Table(name = "tbl_navigation", schema = "", catalog = "cms")
public class Navigation extends BaseEntity<Long> {

    private static final long serialVersionUID = -7295319160451739279L;
    /**
     * 名称
     */
    private String name;
    /**
     * 位置
     */
    private Navigation.Position position;
    /**
     * 链接地址
     */
    private String url;
    /**
     * 是否新窗口打开
     */
    private Boolean isBlankTarget;
    /**
     * 排序
     */
    private Integer sort;

    public Navigation() {
    }

    public Navigation(Long id) {
        setId(id);
    }

    /**
     * 获取名称
     *
     * @return 名称
     */
    @NotEmpty
    @Length(max = 200)
    @Column(nullable = false)
    public String getName() {
        return name;
    }

    /**
     * 设置名称
     *
     * @param name 名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取位置
     *
     * @return 位置
     */
    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    public Navigation.Position getPosition() {
        return position;
    }

    /**
     * 设置位置
     *
     * @param position 位置
     */
    public void setPosition(Navigation.Position position) {
        this.position = position;
    }

    /**
     * 获取链接地址
     *
     * @return 链接地址
     */
    @NotEmpty
    @Length(max = 200)
    @Pattern(regexp = "^(?i)(http:\\/\\/|https:\\/\\/|ftp:\\/\\/|mailto:|\\/|#).*$")
    @Column(nullable = false)
    public String getUrl() {
        return url;
    }

    /**
     * 设置链接地址
     *
     * @param url 链接地址
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * 获取是否新窗口打开
     *
     * @return 是否新窗口打开
     */
    @NotNull
    @Column(nullable = false)
    public Boolean getIsBlankTarget() {
        return isBlankTarget;
    }

    /**
     * 设置是否新窗口打开
     *
     * @param isBlankTarget 是否新窗口打开
     */
    public void setIsBlankTarget(Boolean isBlankTarget) {
        this.isBlankTarget = isBlankTarget;
    }

    @Min(0)
    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

    /**
     * 位置
     */
    public enum Position {

        /**
         * 顶部
         */
        top("顶部"),

        /**
         * 中间
         */
        middle("中间"),

        /**
         * 底部
         */
        bottom("底部");

        private String value;

        Position(String value) {
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
