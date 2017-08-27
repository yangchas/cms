/*
 * Copyright 2005-2016 yunnonggongshe.com All rights reserved.
 * 

 */
package com.rongtai.cms.template.directive;

import com.rongtai.cms.Filter;
import com.rongtai.cms.Order;
import com.rongtai.cms.common.utils.FreeMarkerUtils;
import com.rongtai.cms.entity.Article;
import com.rongtai.cms.service.ArticleService;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 模板指令 - 文章列表
 *
 * @author rongtai
 * @version 1.0
 */
@Component("articleListDirective")
public class ArticleListDirective extends BaseDirective {

    /**
     * "文章分类ID"参数名称
     */
    private static final String ARTICLE_CATEGORY_ID_PARAMETER_NAME = "articleCategoryId";

    /**
     * "标签"参数名称
     */
    private static final String TAG_PARAMETER_NAME = "tag";

    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "articles";

    @Resource(name = "articleService")
    private ArticleService articleService;

    /**
     * 执行
     *
     * @param env      环境变量
     * @param params   参数
     * @param loopVars 循环变量
     * @param body     模板内容
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        Long articleCategoryId = FreeMarkerUtils.getParameter(ARTICLE_CATEGORY_ID_PARAMETER_NAME, Long.class, params);
        String tag = FreeMarkerUtils.getParameter(TAG_PARAMETER_NAME, String.class, params);
        Integer count = getCount(params);
        List<Filter> filters = getFilters(params, Article.class);
        List<Order> orders = getOrders(params);
        List<Article> articles = articleService.getList(articleCategoryId, tag, true, count, filters, orders);
        setLocalVariable(VARIABLE_NAME, articles, env, body);
    }

}