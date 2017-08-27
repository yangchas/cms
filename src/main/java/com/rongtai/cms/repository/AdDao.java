package com.rongtai.cms.repository;

import com.rongtai.cms.entity.Ad;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * 广告管理Dao
 */
public interface AdDao extends PagingAndSortingRepository<Ad, Long>, JpaSpecificationExecutor<Ad> {
}
