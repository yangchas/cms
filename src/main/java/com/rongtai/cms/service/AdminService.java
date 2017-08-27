package com.rongtai.cms.service;

import com.google.common.collect.Maps;
import com.rongtai.cms.ShiroDbRealm;
import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.common.log.BusinessLogger;
import com.rongtai.cms.entity.Admin;
import com.rongtai.cms.repository.AdminDao;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Encodes;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Service - 管理员
 *
 * Created by xiang.
 */
@Service("adminService")
public class AdminService {
    public static final String HASH_ALGORITHM = "SHA-1";
    public static final int HASH_INTERATIONS = 1024;
    private static final int SALT_SIZE = 8;

    private static Logger logger = LoggerFactory.getLogger(AdminService.class);
    @Autowired
    protected AdminDao adminDao;

    @Autowired
    private BusinessLogger businessLogger;

    public Admin getByLoginName(String loginName) {
        return this.adminDao.findByUsernameAndDeleteFlag(loginName, TOFEnum.F);
    }

    public Page<Admin> getPage(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortName, String sortOrder) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortName, sortOrder);
        Specification<Admin> spec = buildSpecification(searchParams);
        return adminDao.findAll(spec, pageRequest);
    }

    public void save(Admin admin) throws ServiceException {
        if (this.adminDao.findByUsernameAndDeleteFlag(admin.getUsername(), TOFEnum.F) != null) {
            throw new ServiceException("该用户名已存在！");
        }

        // 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
        if (StringUtils.isNotBlank(admin.getPlainPassword())) {
            entryptPassword(admin);
        }
        adminDao.save(admin);

        // 业务日志演示
        Map logData = Maps.newHashMap();
        logData.put("userId", admin.getId());
//		businessLogger.log("USER", "UPDATE", getCurrentUser().getName(), logData);
    }

    public void update(Admin admin) throws ServiceException {

//        if (isSupervisor(admin)) {
//            logger.warn("操作员{}尝试修改超级管理员用户", getCurrentUser().getUsername());
//            throw new ServiceException("不能修改超级管理员用户");
//        }

        // 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
        if (StringUtils.isNotBlank(admin.getPlainPassword())) {
            entryptPassword(admin);
        }
        adminDao.save(admin);

        // 业务日志演示
        Map logData = Maps.newHashMap();
        logData.put("userId", admin.getId());
        businessLogger.log("USER", "UPDATE", getCurrentUser().getUsername(), logData);
    }

    public void delete(Long id) {
        Admin admin = adminDao.findOne(id);
        admin.setDeleteFlag(TOFEnum.T);
        adminDao.save(admin);
    }

    /**
     * 按Id获得用户.
     */
    public Admin get(Long id) {
        return adminDao.findOne(id);
    }

    /**
     * 获取当前用户数量.
     */
    public Long getAdminCount() {
        return adminDao.count();
    }

    /**
     * 判断是否超级管理员.
     */
    private boolean isSupervisor(Admin admin) {
        return ((admin.getId() != null) && (admin.getId() == 1L));
    }

    /**
     * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
     */
    private void entryptPassword(Admin admin) {
        byte[] salt = Digests.generateSalt(SALT_SIZE);
        admin.setSalt(Encodes.encodeHex(salt));

        byte[] hashPassword = Digests.sha1(admin.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);
        admin.setPassword(Encodes.encodeHex(hashPassword));
    }

    /**
     * 取出Shiro中的当前用户.
     */
    public Admin getCurrentUser() {
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return adminDao.findOne(user.id);
    }

    /**
     * 根据id查找权限
     * @param id
     * @return
     */
    public List<String> findAuthorities(Long id) {
        List<String> authorities = new ArrayList<String>();
        Admin admin = adminDao.findOne(id);
        if (admin != null && admin.getRole() != null) {
            if (admin.getRole() != null && admin.getRole().getAuthorities() != null) {
                String[] authoritiess = null;
                authoritiess = admin.getRole().getAuthorities().split(",");
                authorities = Arrays.asList(authoritiess);
            }
        }
        return authorities;
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
    private Specification<Admin> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        filters.put("EQ_deleteFlag", new SearchFilter("deleteFlag", SearchFilter.Operator.EQ, TOFEnum.F));
        Specification<Admin> spec = DynamicSpecifications.bySearchFilter(filters.values(), Admin.class);
        return spec;
    }

}
