package com.rongtai.cms.repository;

import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.FriendLink;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * 友情链接Dao
 */
public interface FriendLinkDao extends PagingAndSortingRepository<FriendLink, Long>, JpaSpecificationExecutor<FriendLink> {
    List<FriendLink> findByDeleteFlag(TOFEnum deleteFlag);
}
