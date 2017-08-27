package com.rongtai.cms.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonValue;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.Date;


/**
 * 广告管理.
 */
@Entity
@Table(name = "tbl_ad", schema = "", catalog = "cms")
public class Ad extends BaseEntity<Long> {

    private static final long serialVersionUID = 5861986809660203050L;
    private String title;   //标题
    private Ad.Type type;   //类型
    private String content; //内容
    private String picture; //图片
    private Date startDate;  //起始时间
    private Date endDate; //结束时间
    private String url;  //链接地址
    private Integer sort; //排序
    private AdPosition adPosition; //广告位

    /**
     * 获取标题
     */
    @NotEmpty
    @Length(max = 200)
    @Column(nullable = false)
    public String getTitle() {
        return title;
    }

    /**
     * 设置标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取类型
     */
    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    public Ad.Type getType() {
        return type;
    }

    /**
     * 设置类型
     */
    public void setType(Ad.Type type) {
        this.type = type;
    }

    /**
     * 获取内容
     */
    @Lob
    public String getContent() {
        return content;
    }

    /**
     * 设置内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取图片
     */
    public String getPicture() {
        return picture;
    }

    /**
     * 设置图片
     */
    public void setPicture(String picture) {
        this.picture = picture;
    }

    /**
     * 获取开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
    @Temporal(TemporalType.DATE)
    public Date getStartDate() {
        return startDate;
    }

    /**
     * 设置开始时间
     */
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    /**
     * 获取结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
    @Temporal(TemporalType.DATE)
    public Date getEndDate() {
        return endDate;
    }

    /**
     * 设置结束时间
     */
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    /**
     * 获取链接地址
     */
    @Length(max = 200)
    public String getUrl() {
        return url;
    }

    /**
     * 设置链接地址
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * 获取广告位
     */
    @NotNull
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(nullable = false)
    public AdPosition getAdPosition() {
        return adPosition;
    }

    /**
     * 设置广告位
     */
    public void setAdPosition(AdPosition adPosition) {
        this.adPosition = adPosition;
    }

    /**
     * 获取排序
     */
    @Min(0)
    public Integer getSort() {
        return sort;
    }

    /**
     * 设置排序
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * 判断是否已开始
     *
     * @return 是否已开始
     */
    @Transient
    public boolean hasBegun() {
        return getStartDate() == null || !getStartDate().after(new Date());
    }

    /**
     * 判断是否已结束
     *
     * @return 是否已结束
     */
    @Transient
    public boolean hasEnded() {
        return getEndDate() != null && !getEndDate().after(new Date());
    }

    public enum Type {
        image("图片"),
        text("文本");

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
