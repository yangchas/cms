package com.rongtai.cms.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Min;

/**
 * 友情链接
 */
@Entity
@Table(name = "tbl_friend_link", schema = "", catalog = "cms")
public class FriendLink extends BaseEntity<Long> {
    private static final long serialVersionUID = 6490342124367480193L;
    private String name;  //名称
    private String url;   //链接地址
    private Integer sort;  //排序
    private String logo;   //logo

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
     * 获取Url
     *
     * @return url
     */
    @NotEmpty
    @Length(max = 200)
    @Column(nullable = false)
    public String getUrl() {
        return url;
    }

    /**
     * 设置Url
     *
     * @param url
     */

    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * 获取排序
     *
     * @return 排序
     */
    @Min(0)
    public Integer getSort() {
        return sort;
    }

    /**
     * 设置排序
     *
     * @param sort
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * 获取logo
     *
     * @return
     */
    @Length(max = 200)
    public String getLogo() {
        return logo;
    }

    /**
     * 设置logo
     *
     * @param logo
     */
    public void setLogo(String logo) {
        this.logo = logo;
    }
}
