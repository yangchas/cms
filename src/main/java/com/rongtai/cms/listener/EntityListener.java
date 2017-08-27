package com.rongtai.cms.listener;

import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.BaseEntity;

import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import java.util.Date;

/**
 * Listener - 创建日期、修改日期、版本处理
 *
 * @author rongtai
 * @version 1.0
 */
public class EntityListener {

    /**
     * 保存前处理
     *
     * @param entity 实体对象
     */
    @PrePersist
    public void prePersist(BaseEntity<?> entity) {
        entity.setCreateDate(new Date());
        entity.setModifyDate(new Date());
        entity.setDeleteFlag(TOFEnum.F);
    }

    /**
     * 更新前处理
     *
     * @param entity 实体对象
     */
    @PreUpdate
    public void preUpdate(BaseEntity<?> entity) {
        entity.setModifyDate(new Date());
    }

}