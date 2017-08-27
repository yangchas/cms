package com.rongtai.cms.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.Where;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/**
 * 广告位管理
 */
@Entity
@Table(name = "tbl_ad_position", schema = "", catalog = "cms")
public class AdPosition extends BaseEntity<Long> {

    private static final long serialVersionUID = -6167699287635636052L;
    /**
     * 广告
     */
    List<Ad> ads = new ArrayList<>();
    private String name;              //名称
    private Integer width;            //宽度
    private Integer height;           //高度
    private String description;      //描述
    private String template;         //模板

    /**
     * 获取名称
     */
    @NotEmpty
    @Length(max = 255)
    @Column(nullable = false)
    public String getName() {
        return name;
    }

    /**
     * 设置名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取宽度
     */
    @NotNull
    @Min(1)
    @Column(nullable = false)
    public Integer getWidth() {
        return width;
    }

    /**
     * 设置宽度
     */
    public void setWidth(Integer width) {
        this.width = width;
    }

    /**
     * 获取高度
     */

    @NotNull
    @Min(1)
    @Column(nullable = false)
    public Integer getHeight() {
        return height;
    }

    /**
     * 设置高度
     */
    public void setHeight(Integer height) {
        this.height = height;
    }

    /**
     * 获取描述
     */
    @Length(max = 255)
    public String getDescription() {
        return description;
    }

    /**
     * 设置描述
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * 获取模板
     */
    @NotEmpty
    @Lob
    @Column(nullable = false)
    public String getTemplate() {
        return template;
    }

    /**
     * 设置模板
     */
    public void setTemplate(String template) {
        this.template = template;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "adPosition")
    @Where(clause = "delete_flag='F'")
    @OrderBy("sort asc")
    @JsonIgnore
    public List<Ad> getAds() {
        return ads;
    }

    public void setAds(List<Ad> ads) {
        this.ads = ads;
    }
}
