/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.rongtai.cms.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 * 角色.
 *
 * @author tan
 */
@Entity
@Table(name = "tbl_role", schema = "", catalog = "cms")
public class Role extends BaseEntity<Long> {

    private static final long serialVersionUID = -5357160308204599911L;

    /**
     * 名称
     */
    private String name;

    /**
     * 是否内置
     */
    private Boolean isSystem;

    /**
     * 权限
     */
    private String authorities;

    public Role() {
    }

    public Role(Long id) {
        setId(id);
    }

    /**
     * 获取角色名称
     * @return 角色名称
     */
    @Length(max = 200)
    @NotNull(message = "角色名称不能为空")
    @Column(nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * 是否内置
     * @return 是否内置
     */
    @Column(nullable = false, updatable = false)
    public Boolean getIsSystem() {
        return isSystem;
    }

    public void setIsSystem(Boolean isSystem) {
        this.isSystem = isSystem;
    }

    /**
     * 获取权限
     *
     * @return 权限
     */
    @Basic
    @Column(name = "authorities", length = 4000)
    public String getAuthorities() {
        return authorities;
    }

    public void setAuthorities(String authorities) {
        this.authorities = authorities;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
