package com.rongtai.cms.service;

import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.Role;
import com.rongtai.cms.repository.RoleDao;
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
 * Service - 角色
 *
 * Created by tan on 2017/5/17.
 */
@Service("roleService")
public class RoleService {

    @Autowired
    protected RoleDao roleDao;

    public Role get(Long id) {
        return this.roleDao.findOne(id);
    }

    public List<Role> getAll() {
        return this.roleDao.findByDeleteFlag(TOFEnum.F);
    }

    public Page<Role> getPage(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortName, String sortOrder) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortName, sortOrder);
        Specification<Role> spec = buildSpecification(searchParams);
        return roleDao.findAll(spec, pageRequest);
    }

    public void save(Role entity) {
        entity.setIsSystem(Boolean.FALSE);
        roleDao.save(entity);
    }

    public void update(Role entity) {
        roleDao.save(entity);
    }

    public void delete(Long id) {
        Role role = roleDao.findOne(id);
        if (role.getIsSystem()) {
            throw new ServiceException("系统数据不可删除！");
        }
        role.setDeleteFlag(TOFEnum.T);
        roleDao.save(role);
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
    private Specification<Role> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        filters.put("EQ_deleteFlag", new SearchFilter("deleteFlag", SearchFilter.Operator.EQ, TOFEnum.F));
        Specification<Role> spec = DynamicSpecifications.bySearchFilter(filters.values(), Role.class);
        return spec;
    }

}
