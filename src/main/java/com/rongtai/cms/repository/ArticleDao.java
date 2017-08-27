package com.rongtai.cms.repository;


import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.Article;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created by dell on 2016/9/9.
 */
public interface ArticleDao extends PagingAndSortingRepository<Article, Long>, JpaSpecificationExecutor<Article> {

    List<Article> findByArticleCategory_Id(Long articleTreeId);

    List<Article> findByArticleCategory_IdAndIsPublicationAndDeleteFlag(Long articleTreeId, Boolean isPublication, TOFEnum tofEnum);
}

