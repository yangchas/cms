package com.rongtai.cms.service;

import com.rongtai.cms.DynamicSpecifications;
import com.rongtai.cms.Filter;
import com.rongtai.cms.Order;
import com.rongtai.cms.SearchFilter;
import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.Article;
import com.rongtai.cms.repository.ArticleDao;
import org.apache.commons.lang3.StringUtils;
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

@Service("articleService")
public class ArticleService {

    @Autowired
    private ArticleDao articleDao;


    public Page<Article> getPage(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortName, String sortOrder) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortName, sortOrder);
        Specification<Article> spec = buildSpecification(searchParams);
        return articleDao.findAll(spec, pageRequest);
    }

    public Page<Article> getPage(Map<String, Object> searchParams, int pageNumber, int pageSize) {
        Specification<Article> spec = buildSpecification(searchParams);
        return articleDao.findAll(spec, new PageRequest(pageNumber - 1, pageSize));
    }

    public List<Article> getList(Long articleCategoryId, Boolean isPublication) {
        return articleDao.findByArticleCategory_IdAndIsPublicationAndDeleteFlag(articleCategoryId, isPublication, TOFEnum.F);
    }

    public List<Article> getList(Long articleCategoryId, String tag, Boolean isPublication, Integer count, List<Filter> filters, List<Order> orders) {
        List<Sort.Order> orderList = new ArrayList<>();
        for (Order order : orders) {
            orderList.add(new Sort.Order(Sort.Direction.fromString(order.getDirection().name()), order.getProperty()));
        }
        if (orderList.size() == 0) {
            orderList.add(new Sort.Order(Sort.Direction.DESC, "isTop"));
            orderList.add(new Sort.Order(Sort.Direction.DESC, "id"));
        }
        Sort sort = new Sort(orderList);
        Map<String, Object> searchParams = new HashMap<>();
        if (articleCategoryId != null) {
            searchParams.put("EQ_articleCategory.id", articleCategoryId);
        }
        if (tag != null) {
            searchParams.put("LIKE_tags", tag);
        }
        if (isPublication != null) {
            searchParams.put("EQ_isPublication", isPublication);
        }
        for (Filter filter : filters) {
            searchParams.put(filter.getOperator().name().toUpperCase() + "_" + filter.getProperty(), filter.getValue());
        }
        Specification<Article> spec = buildSpecification(searchParams);
        return articleDao.findAll(spec, new PageRequest(0, count, sort)).getContent();
    }

    private Specification<Article> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        filters.put("EQ_deleteFlag", new SearchFilter("deleteFlag", SearchFilter.Operator.EQ, TOFEnum.F));
        Specification<Article> spec = DynamicSpecifications.bySearchFilter(filters.values(), Article.class);
        return spec;
    }


    public void save(Article article) throws ServiceException {
        article.setHit(0L);
        articleDao.save(article);
    }

    public Article get(Long id) {
        return this.articleDao.findOne(id);
    }


    public void update(Article article) throws ServiceException {
        articleDao.save(article);
    }

    /*
    * 删除
    * */
    public Article delete(Long id) throws ServiceException {
        Article article = this.articleDao.findOne(id);
        article.setDeleteFlag(TOFEnum.T);
        return this.articleDao.save(article);
    }


    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pageSize, String sortName, String sortOrder) {
        List<Sort.Order> orderList = new ArrayList<>();
        if (StringUtils.isNotEmpty(sortName)) {
            orderList.add(new Sort.Order(Sort.Direction.fromString(sortOrder), sortName));
        }
        orderList.add(new Sort.Order(Sort.Direction.DESC, "id"));
        Sort sort = new Sort(orderList);
        return new PageRequest(pageNumber - 1, pageSize, sort);
    }


    /**
     * 更新点击量，并保存在数据库中
     *
     * @param id
     */
    public long viewHits(Long id) {
        Long hits;
        Article article = this.articleDao.findOne(id);
        if (article == null) {
            return 0L;
        }
        hits = article.getHit() + 1;
        article.setHit(hits);
        this.articleDao.save(article);
        return hits;
    }

}
