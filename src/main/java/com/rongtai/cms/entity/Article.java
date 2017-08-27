package com.rongtai.cms.entity;

import com.rongtai.cms.TemplateConfig;
import com.rongtai.cms.common.utils.SystemUtils;
import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;

import javax.persistence.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * 文章
 */
@Entity
@Table(name = "tbl_article", schema = "", catalog = "cms")
public class Article extends BaseEntity<Long> {
    private static final long serialVersionUID = -220074989251725542L;
    private String title;   //标题
    private String author;   //作者

    private Boolean isPublication; //是否发布
    private Boolean isTop;     //是否置顶
    private String tags;        //标签 ——推荐（rec）；热点（hot）

    private String pageTitle;   //页面标题
    private String pageKey;   //页面关键字
    private String content; //文章内容
    private String digest;//截取前200字 描述
    private Long hit;    //点击量
    private Date pubDate;   //发布时间
    private String pictureUrl;  //文章封面图片路径

    private ArticleCategory articleCategory;    //所属文章树-文章分类


    @ManyToOne
    @JoinColumn(name = "article_category_id")
    public ArticleCategory getArticleCategory() {
        return articleCategory;
    }

    public void setArticleCategory(ArticleCategory articleCategory) {
        this.articleCategory = articleCategory;
    }

    @Basic
    @Column(name = "title", length = 100)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Boolean getIsPublication() {
        return isPublication;
    }

    public void setIsPublication(Boolean isPublication) {
        this.isPublication = isPublication;
    }

    public Boolean getIsTop() {
        return isTop;
    }

    public void setIsTop(Boolean isTop) {
        this.isTop = isTop;
    }

    @Basic
    @Column(name = "tags", length = 7)
    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    @Basic
    @Column(name = "page_title", length = 50)
    public String getPageTitle() {
        return pageTitle;
    }

    public void setPageTitle(String pageTitle) {
        this.pageTitle = pageTitle;
    }

    @Basic
    @Column(name = "page_key", length = 255)
    public String getPageKey() {
        return pageKey;
    }

    public void setPageKey(String pageKey) {
        this.pageKey = pageKey;
    }

    @Lob
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取文本内容
     *
     * @return 文本内容
     */
    @Transient
    public String getText() {
        if (StringUtils.isEmpty(getContent())) {
            return StringUtils.EMPTY;
        }
        return Jsoup.parse(getContent()).text();
    }

    @Basic
    @Column(name = "digest", length = 255)
    public String getDigest() {
        return digest;
    }

    public void setDigest(String digest) {
        this.digest = digest;
    }

    @Basic
    @Column(name = "hit", length = 5)
    public Long getHit() {
        return hit;
    }

    public void setHit(Long hit) {
        this.hit = hit;
    }

    @Temporal(TemporalType.DATE)
    public Date getPubDate() {
        return pubDate;
    }

    public void setPubDate(Date pubDate) {
        this.pubDate = pubDate;
    }


    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    /**
     * 获取路径
     *
     * @return 路径
     */
    @Transient
    public String getPath() {
        TemplateConfig templateConfig = SystemUtils.getTemplateConfig("articleContent");
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("article", this);
        return templateConfig.getRealStaticPath(model);
    }
}
