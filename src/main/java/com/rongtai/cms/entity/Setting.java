/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.rongtai.cms.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

/**
 * 系统设置
 *
 * @author tan
 */
@Entity
@Table(name = "tbl_setting", schema = "", catalog = "cms")
public class Setting extends BaseEntity<Long> {

    private static final long serialVersionUID = -7382966225972194353L;

    /**
     * 站点名称
     */
    private String siteName;

    /**
     * 网站地址
     */
    private String siteUrl;

    /**
     * logo
     */
    private String logo;

    /**
     * 热门搜索
     */
    private String hotSearch;

    /**
     * 联系地址
     */
    private String address;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 邮政编码
     */
    private String zipCode;

    /**
     * E-mail
     */
    private String email;

    /**
     * 备案编号
     */
    private String certtext;

    /**
     * 文件上传路径
     */
    private String fileUploadPath;

    /**
     * 是否开启CNZZ统计
     */
    private Boolean isCnzzEnabled;

    /**
     * CNZZ统计站点ID
     */
    private String cnzzSiteId;

    /**
     * CNZZ统计密码
     */
    private String cnzzPassword;

    public Setting() {
    }

    public Setting(Long id) {
        setId(id);
    }

    /**
     * 获取站点名称
     *
     * @return 站点名称
     */
    @NotEmpty
    @Length(max = 200)
    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    /**
     * 获取网站地址
     *
     * @return 网站地址
     */
    @NotEmpty
    @Length(max = 200)
    @Pattern(regexp = "^(?i)(http:\\/\\/|https:\\/\\/).*$")
    public String getSiteUrl() {
        return siteUrl;
    }

    public void setSiteUrl(String siteUrl) {
        this.siteUrl = siteUrl;
    }

    /**
     * 获取logo
     *
     * @return logo
     */
    @NotEmpty
    @Length(max = 200)
    @Pattern(regexp = "^(?i)(http:\\/\\/|https:\\/\\/|\\/).*$")
    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    /**
     * 获取热门搜索
     *
     * @return 热门搜索
     */
    @Length(max = 200)
    public String getHotSearch() {
        return hotSearch;
    }

    public void setHotSearch(String hotSearch) {
        this.hotSearch = hotSearch;
    }

    /**
     * 获取联系地址
     *
     * @return 联系地址
     */
    @Length(max = 200)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取联系电话
     *
     * @return 联系电话
     */
    @Length(max = 200)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取邮政编码
     *
     * @return 邮政编码
     */
    @Length(max = 200)
    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    /**
     * 获取email
     *
     * @return email
     */
    @Email
    @Length(max = 200)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取备案编号
     *
     * @return 备案编号
     */
    @Length(max = 200)
    public String getCerttext() {
        return certtext;
    }

    public void setCerttext(String certtext) {
        this.certtext = certtext;
    }

    /**
     * 获取文件上传路径
     *
     * @return 文件上传路径
     */
    @NotEmpty
    @Length(max = 200)
    public String getFileUploadPath() {
        return fileUploadPath;
    }

    public void setFileUploadPath(String fileUploadPath) {
        this.fileUploadPath = fileUploadPath;
    }

    /**
     * 获取是否启用访问统计
     *
     * @return 是否启用访问统计
     */
    public Boolean getIsCnzzEnabled() {
        return isCnzzEnabled;
    }

    public void setIsCnzzEnabled(Boolean isCnzzEnabled) {
        this.isCnzzEnabled = isCnzzEnabled;
    }

    /**
     * 获取CNZZ统计站点ID
     *
     * @return CNZZ统计站点ID
     */
    public String getCnzzSiteId() {
        return cnzzSiteId;
    }

    public void setCnzzSiteId(String cnzzSiteId) {
        this.cnzzSiteId = cnzzSiteId;
    }

    /**
     * 获取CNZZ统计密码
     *
     * @return CNZZ统计密码
     */
    public String getCnzzPassword() {
        return cnzzPassword;
    }

    public void setCnzzPassword(String cnzzPassword) {
        this.cnzzPassword = cnzzPassword;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
