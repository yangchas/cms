package com.rongtai.cms.service;

import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.Ad;
import com.rongtai.cms.repository.AdDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import java.util.Map;

/**
 * 广告管理Service
 */
@Service("adService")
public class AdService {
    @Autowired
    protected AdDao adDao;

    public Ad get(Long id) {
        return this.adDao.findOne(id);
    }

    public Page<Ad> getPage(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortName, String sortOrder) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortName, sortOrder);
        Specification<Ad> spec = buildSpecification(searchParams);
        return adDao.findAll(spec, pageRequest);
    }

    public void save(Ad entity) {

        adDao.save(entity);
    }

    public void update(Ad entity) {
        adDao.save(entity);
    }

    public void delete(Long id) {
        Ad ad = adDao.findOne(id);
        ad.setDeleteFlag(TOFEnum.T);
        adDao.save(ad);
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
    private Specification<Ad> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        filters.put("EQ_deleteFlag", new SearchFilter("deleteFlag", SearchFilter.Operator.EQ, TOFEnum.F));
        Specification<Ad> spec = DynamicSpecifications.bySearchFilter(filters.values(), Ad.class);
        return spec;
    }

}
