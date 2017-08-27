package com.rongtai.cms.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.listener.EntityListener;

import javax.persistence.*;
import javax.validation.groups.Default;
import java.io.Serializable;
import java.util.Date;


/**
 * Entity - 基类
 *
 * @author rongtai
 * @version 1.0
 */
@EntityListeners(EntityListener.class)
@MappedSuperclass
public abstract class BaseEntity<ID extends Serializable> implements Serializable {


    private static final long serialVersionUID = 6462485003712827852L;
    /**
     * ID
     */
    private ID id;
    /**
     * 创建日期
     */
    private Date createDate;
    /**
     * 修改日期
     */
    private Date modifyDate;
    /**
     * 删除标记
     */
    private TOFEnum deleteFlag;

    /**
     * 获取ID
     *
     * @return ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public ID getId() {
        return id;
    }

    /**
     * 设置ID
     *
     * @param id ID
     */
    public void setId(ID id) {
        this.id = id;
    }

    /**
     * 获取创建日期
     *
     * @return 创建日期
     */
    // 设定JSON序列化时的日期格式
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false, updatable = false)
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 设置创建日期
     *
     * @param createDate 创建日期
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取修改日期
     *
     * @return 修改日期
     */
    // 设定JSON序列化时的日期格式
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * 设置修改日期
     *
     * @param modifyDate 修改日期
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    @Basic
    @Enumerated(EnumType.STRING)
    @Column(name = "delete_flag", length = 1)
    public TOFEnum getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(TOFEnum deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    /**
     * 判断是否为新建对象
     *
     * @return 是否为新建对象
     */
    @Transient
    public boolean isNew() {
        return getId() == null;
    }

    /**
     * 重写toString方法
     *
     * @return 字符串
     */
    @Override
    public String toString() {
        return String.format("Entity of type %s with id: %s", getClass().getName(), getId());
    }

    /**
     * 重写equals方法
     *
     * @param obj
     *            对象
     * @return 是否相等
     */
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (!BaseEntity.class.isAssignableFrom(obj.getClass())) {
            return false;
        }
        BaseEntity<?> other = (BaseEntity<?>) obj;
        return getId() != null && getId().equals(other.getId());
    }

    /**
     * 重写hashCode方法
     *
     * @return HashCode
     */
    @Override
    public int hashCode() {
        int hashCode = 17;
        hashCode += getId() != null ? getId().hashCode() * 31 : 0;
        return hashCode;
    }

    /**
     * 保存验证组
     */
    public interface Save extends Default {

    }

    /**
     * 更新验证组
     */
    public interface Update extends Default {

    }

}