package com.rongtai.cms.service;

import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.Suggest;
import com.rongtai.cms.repository.SuggestDao;
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
 * Service - 建议
 * <p/>
 * Created by tan on 2017/5/17.
 */
@Service("suggestService")
public class SuggestService {

    @Autowired
    protected SuggestDao suggestDao;

    public Suggest get(Long id) {
        return this.suggestDao.findOne(id);
    }

    public Page<Suggest> getPage(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortName, String sortOrder) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortName, sortOrder);
        Specification<Suggest> spec = buildSpecification(searchParams);
        return suggestDao.findAll(spec, pageRequest);
    }

    public void save(Suggest entity) {
        entity.setDeleteFlag(TOFEnum.F);
        suggestDao.save(entity);
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
    private Specification<Suggest> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        filters.put("EQ_deleteFlag", new SearchFilter("deleteFlag", SearchFilter.Operator.EQ, TOFEnum.F));
        Specification<Suggest> spec = DynamicSpecifications.bySearchFilter(filters.values(), Suggest.class);
        return spec;
    }

}
