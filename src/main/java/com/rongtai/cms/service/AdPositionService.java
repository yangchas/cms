package com.rongtai.cms.service;

import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.AdPosition;
import com.rongtai.cms.repository.AdPositionDao;
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
 * 广告位管理service
 */
@Service("adPositionService")
public class AdPositionService {

    @Autowired
    protected AdPositionDao adPositionDao;

    public AdPosition get(Long id) {
        return this.adPositionDao.findOne(id);
    }

    public Page<AdPosition> getPage(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortName, String sortOrder) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortName, sortOrder);
        Specification<AdPosition> spec = buildSpecification(searchParams);
        return adPositionDao.findAll(spec, pageRequest);
    }

    public void save(AdPosition entity) {
        adPositionDao.save(entity);
    }

    public void update(AdPosition entity) {
        adPositionDao.save(entity);
    }

    public void delete(Long id) {
        AdPosition adPosition = adPositionDao.findOne(id);
        adPosition.setDeleteFlag(TOFEnum.T);
        adPositionDao.save(adPosition);
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
    private Specification<AdPosition> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        filters.put("EQ_deleteFlag", new SearchFilter("deleteFlag", SearchFilter.Operator.EQ, TOFEnum.F));
        Specification<AdPosition> spec = DynamicSpecifications.bySearchFilter(filters.values(), AdPosition.class);
        return spec;
    }

    public List<AdPosition> getAll() {
        return this.adPositionDao.findByDeleteFlag(TOFEnum.F);
    }
}
