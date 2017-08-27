package com.rongtai.cms.service;


import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.Article;
import com.rongtai.cms.entity.ArticleCategory;
import com.rongtai.cms.repository.ArticleCategoryDao;
import com.rongtai.cms.repository.ArticleDao;
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
 * Created by ycc
 */
@Service("articleCategoryService")
public class ArticleCategoryService {


    public static final int FIRST_LEVEL_DEPTH = 1;
    @Autowired
    private ArticleCategoryDao articleCategoryDao;
    @Autowired
    private ArticleDao articleDao;

    /**
     *
     *分页-查询
     */
    public Page<ArticleCategory> getPage(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortName, String sortOrder) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortName, sortOrder);
        Specification<ArticleCategory> spec = buildSpecification(searchParams);
        return articleCategoryDao.findAll(spec, pageRequest);
    }

    private Specification<ArticleCategory> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        filters.put("EQ_deleteFlag", new SearchFilter("deleteFlag", SearchFilter.Operator.EQ, TOFEnum.F));
        Specification<ArticleCategory> spec = DynamicSpecifications.bySearchFilter(filters.values(), ArticleCategory.class);
        return spec;
    }

    private PageRequest buildPageRequest(int pageNumber, int pageSize, String name, String sortOrder) {
        Sort sort;
        if ("auto".equals(name)) {
            sort = new Sort(Sort.Direction.fromString(sortOrder), "id");
        } else {
            sort = new Sort(Sort.Direction.fromString(sortOrder), name);
        }
        return new PageRequest(pageNumber - 1, pageSize, sort);
    }


    public ArticleCategory save(ArticleCategory articleCategory) throws ServiceException {
        setValue(articleCategory);
        return this.articleCategoryDao.save(articleCategory);
    }

    public ArticleCategory get(Long id) {
        return this.articleCategoryDao.findOne(id);
    }

    public void update(ArticleCategory articleCategory) throws ServiceException {
        setValue(articleCategory);
        articleCategoryDao.save(articleCategory);
    }

    public ArticleCategory delete(Long id) throws ServiceException {
        ArticleCategory articleCategory = this.articleCategoryDao.findOne(id);
        List<Article> article = this.articleDao.findByArticleCategory_Id(id);

        if (articleCategory.getChildren().size() != 0) {
            throw new ServiceException("存在关联分类不能删除!");
        }
        if (!article.isEmpty()) {
            throw new ServiceException("存在关联文章不能删除!");
        }
        articleCategory.setDeleteFlag(TOFEnum.T);
        return this.articleCategoryDao.save(articleCategory);
    }


    /**
     * 设置路径值
     *
     * @param articleCategory 分类
     */
    private void setValue(ArticleCategory articleCategory) {
        if (articleCategory == null) {
            return;
        }
        ArticleCategory parents =  articleCategory.getParent();
        if (parents != null) {
            articleCategory.setTreePath(parents.getTreePath() + parents.getId() + ArticleCategory.TREE_PATH_SEPARATOR);
            articleCategory.setGrade(articleCategory.getParent().getGrade() + 1);
        } else {
            articleCategory.setTreePath(ArticleCategory.TREE_PATH_SEPARATOR);
            articleCategory.setGrade(1);
        }

    }

    public List<ArticleCategory> getAll() {
        return this.articleCategoryDao.findByDeleteFlag(TOFEnum.F);
    }
}


