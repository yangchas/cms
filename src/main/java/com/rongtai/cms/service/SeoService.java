package com.rongtai.cms.service;

import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.Seo;
import com.rongtai.cms.repository.SeoDao;
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
 * Service - 角色
 *
 * Created by tan on 2017/5/17.
 */
@Service("seoService")
public class SeoService {

    @Autowired
    protected SeoDao seoDao;

    public Seo get(Long id) {
        return this.seoDao.findOne(id);
    }

    public Seo getByType(Seo.Type type) {
        return this.seoDao.findByTypeAndDeleteFlag(type, TOFEnum.F);
    }

    public Page<Seo> getPage(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortName, String sortOrder) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortName, sortOrder);
        Specification<Seo> spec = buildSpecification(searchParams);
        return seoDao.findAll(spec, pageRequest);
    }

    public void save(Seo entity) {
        seoDao.save(entity);
    }

    public void update(Seo entity) {
        seoDao.save(entity);
    }

    public void delete(Long id) {
        Seo seo = seoDao.findOne(id);
        seo.setDeleteFlag(TOFEnum.T);
        seoDao.save(seo);
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
    private Specification<Seo> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        filters.put("EQ_deleteFlag", new SearchFilter("deleteFlag", SearchFilter.Operator.EQ, TOFEnum.F));
        Specification<Seo> spec = DynamicSpecifications.bySearchFilter(filters.values(), Seo.class);
        return spec;
    }

}
