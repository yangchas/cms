package com.rongtai.cms.service;

import com.rongtai.cms.DynamicSpecifications;
import com.rongtai.cms.Filter;
import com.rongtai.cms.Order;
import com.rongtai.cms.SearchFilter;
import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.Navigation;
import com.rongtai.cms.repository.NavigationDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Service - 导航
 * <p/>
 * Created by tan on 2017/5/17.
 */
@Service("navigationService")
public class NavigationService {

    @Autowired
    protected NavigationDao navigationDao;

    public Navigation get(Long id) {
        return this.navigationDao.findOne(id);
    }

    public Page<Navigation> getPage(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortName, String sortOrder) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortName, sortOrder);
        Specification<Navigation> spec = buildSpecification(searchParams);
        return navigationDao.findAll(spec, pageRequest);
    }

    public List<Navigation> getList(Integer count, List<Filter> filters, List<Order> orders) {
        List<Sort.Order> orderList = new ArrayList<>();
        for (Order order : orders) {
            orderList.add(new Sort.Order(Sort.Direction.fromString(order.getDirection().name()), order.getProperty()));
        }
        if (orderList.size() == 0) {
            orderList.add(new Sort.Order(Sort.Direction.ASC, "sort"));
        }
        Sort sort = new Sort(orderList);
        Map<String, Object> searchParams = new HashMap<>();
        for (Filter filter : filters) {
            searchParams.put(filter.getOperator().name().toUpperCase() + "_" + filter.getProperty(), filter.getValue());
        }
        Specification<Navigation> spec = buildSpecification(searchParams);
        return navigationDao.findAll(spec, new PageRequest(0, count, sort)).getContent();
    }

    public void save(Navigation entity) {
        navigationDao.save(entity);
    }

    public void update(Navigation entity) {
        navigationDao.save(entity);
    }

    public void delete(Long id) {
        Navigation navigation = navigationDao.findOne(id);
        navigation.setDeleteFlag(TOFEnum.T);
        navigationDao.save(navigation);
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
    private Specification<Navigation> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        filters.put("EQ_deleteFlag", new SearchFilter("deleteFlag", SearchFilter.Operator.EQ, TOFEnum.F));
        Specification<Navigation> spec = DynamicSpecifications.bySearchFilter(filters.values(), Navigation.class);
        return spec;
    }

}
