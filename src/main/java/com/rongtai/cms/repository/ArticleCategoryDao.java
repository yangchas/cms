package com.rongtai.cms.repository;

import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.ArticleCategory;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created by ycc
 */
public interface ArticleCategoryDao extends PagingAndSortingRepository<ArticleCategory, Long>, JpaSpecificationExecutor<ArticleCategory> {
    List<ArticleCategory> findByParent_id(Long parentId);

    List<ArticleCategory> findByDeleteFlag(TOFEnum deleteFlag);

    ArticleCategory findByDeleteFlagAndName(TOFEnum deleteFlag, String typeName);

    List<ArticleCategory> findByGradeAndDeleteFlagOrderBySortAsc(int grade, TOFEnum deleteFlag);

    List<ArticleCategory> findByGrade(int grade);


}
