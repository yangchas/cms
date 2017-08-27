package com.rongtai.cms.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 文章分类
 */
@Entity
@Table(name = "tbl_article_category", schema = "", catalog = "cms")
public class ArticleCategory extends BaseEntity<Long> {

    /**
     * 树路径分隔符
     */
    public static final String TREE_PATH_SEPARATOR = ",";
    private static final long serialVersionUID = -8578507162306950959L;

    private String name;    //分类名称
    private int grade;  //深度
    private Integer sort;    //排序
    private String pageTitle;   //页面标题
    private String pageKey;     //页面关键字
    private String pageDesc;     //页面描述
    private String treePath;    //树路径

    private ArticleCategory parent; //上级分类

    private List<ArticleCategory> children; //下级分类

    public ArticleCategory() {
    }

    public ArticleCategory(Long id) {
        setId(id);
    }

    @NotNull(message = "文章分类名称不能为空")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "grade", length = 1, nullable = false)
    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    @Basic
    @Column(name = "page_title", length = 200)
    public String getPageTitle() {
        return pageTitle;
    }

    public void setPageTitle(String pageTitle) {
        this.pageTitle = pageTitle;
    }

    @Basic
    @Column(name = "page_key", length = 200)
    public String getPageKey() {
        return pageKey;
    }

    public void setPageKey(String pageKey) {
        this.pageKey = pageKey;
    }

    @Basic
    @Column(name = "page_desc", length = 200)
    public String getPageDesc() {
        return pageDesc;
    }

    public void setPageDesc(String pageDesc) {
        this.pageDesc = pageDesc;
    }

    public String getTreePath() {
        return treePath;
    }

    public void setTreePath(String treePath) {
        this.treePath = treePath;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "parent")
    @Where(clause = "delete_flag='F'")
    public List<ArticleCategory> getChildren() {
        return children;
    }

    public void setChildren(List<ArticleCategory> children) {
        this.children = children;
    }

    @JsonIgnore
    @ManyToOne(optional = true)
    @JoinColumn(name = "parent_id")
    public ArticleCategory getParent() {
        return parent;
    }

    public void setParent(ArticleCategory parent) {
        this.parent = parent;
    }

}
