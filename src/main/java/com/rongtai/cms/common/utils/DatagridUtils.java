package com.rongtai.cms.common.utils;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public class DatagridUtils {

    /**
     * 根据liger ui中datagrid提交的request解析出jpa需要的分页参数
     *
     * @param request
     * @return
     */
    public static PageRequest parsePage(HttpServletRequest request) {
        int page = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("pagesize"));
        String sortName = request.getParameter("sortname");
        String sortOrder = request.getParameter("sortorder");

        Sort sort = new Sort(Sort.Direction.DESC, "id");
        if (StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
            sort = new Sort(Sort.Direction.valueOf(sortOrder.toUpperCase()), sortName);
        }
        return new PageRequest(page - 1, pageSize, sort);
    }

    public static PageRequest parsePage(HttpServletRequest request, Sort sort) {
        int page = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("pagesize"));
        String sortName = request.getParameter("sortname");
        String sortOrder = request.getParameter("sortorder");

        if (StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
            sort = new Sort(Sort.Direction.valueOf(sortOrder.toUpperCase()), sortName);
        }
        return new PageRequest(page - 1, pageSize, sort);
    }

    /**
     * 根据liger ui中datagrid提交的request解析出jpa需要的搜索参数
     *
     * @param request
     * @return
     */
    public static Map<String, Object> parseSearch(HttpServletRequest request) {
        Map<String, Object> searchParams = new HashMap<>();
        Map<String, String[]> params = request.getParameterMap();
        String prefix = "SK_";
        for (Map.Entry<String, String[]> param : (params).entrySet()) {
            if (param.getValue() != null && param.getValue().length > 0 && param.getKey().indexOf(prefix) == 0) {
                String key = param.getKey().replace(prefix, "");
                searchParams.put(key, param.getValue()[0]);
            }
        }
        return searchParams;
    }
}
