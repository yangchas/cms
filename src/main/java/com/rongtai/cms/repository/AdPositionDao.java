package com.rongtai.cms.repository;

import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.AdPosition;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * 广告位管理
 */
public interface AdPositionDao extends PagingAndSortingRepository<AdPosition, Long>, JpaSpecificationExecutor<AdPosition> {
    List<AdPosition> findByDeleteFlag(TOFEnum deleteFlag);
}
