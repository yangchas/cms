package com.rongtai.cms.service;

import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.FriendLink;
import com.rongtai.cms.repository.FriendLinkDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import java.util.List;
import java.util.Map;

/**
 * 友情链接Service
 */
@Service("friendLinkService")
public class FriendLinkService {
    @Autowired
    protected FriendLinkDao friendLinkDao;

    public FriendLink get(Long id) {
        return this.friendLinkDao.findOne(id);
    }

    public Page<FriendLink> getPage(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortName, String sortOrder) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortName, sortOrder);
        Specification<FriendLink> spec = buildSpecification(searchParams);
        return friendLinkDao.findAll(spec, pageRequest);
    }

    public List<FriendLink> getList() {
        return this.friendLinkDao.findByDeleteFlag(TOFEnum.F);
    }

    public void save(FriendLink entity) {
        friendLinkDao.save(entity);
    }

    public void update(FriendLink entity) {
        friendLinkDao.save(entity);
    }

    public void delete(Long id) {
        FriendLink friendLink = friendLinkDao.findOne(id);
        friendLink.setDeleteFlag(TOFEnum.T);
        friendLinkDao.save(friendLink);
    }

    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pageSize, String sortName, String sortOrder) {
        Sort sort;
        if ("auto".equals(sortName)) {
            sort = new Sort(Sort.Direction.fromString(sortOrder), "id");
        } else {
            sort = new Sort(Sort.Direction.fromString(sortOrder), sortName);
        }
        return new PageRequest(pageNumber - 1, pageSize, sort);
    }

    /**
     * 创建动态查询条件组合.
     */
    private Specification<FriendLink> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        filters.put("EQ_deleteFlag", new SearchFilter("deleteFlag", SearchFilter.Operator.EQ, TOFEnum.F));
        Specification<FriendLink> spec = DynamicSpecifications.bySearchFilter(filters.values(), FriendLink.class);
        return spec;
    }
}
