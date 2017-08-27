package com.rongtai.cms.web.admin;


import com.rongtai.cms.entity.Article;
import com.rongtai.cms.service.ArticleService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springside.modules.web.Servlets;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import java.util.Map;


/**
 * 文章排行统计管理
 */
@Controller("adminArticleRankingController")
@RequestMapping(value = "admin/article_ranking")
public class ArticleRankingController extends BaseController {

    /**
     * 默认页码
     */
    private static final String DEFAULT_PAGE_NUMBER = "1";

    /**
     * 默认每页记录数
     */
    private static final String DEFAULT_PAGE_SIZE = "10";

    @Resource(name = "articleService")
    private ArticleService articleService;

    @RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "pageNumber", defaultValue = DEFAULT_PAGE_NUMBER) int pageNumber,
                       @RequestParam(value = "pageSize", defaultValue = DEFAULT_PAGE_SIZE) int pageSize,
                       ServletRequest request, ModelMap model) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        Page<Article> page = this.articleService.getPage(searchParams, pageNumber, pageSize, "hit", "desc");
        model.addAttribute("page", page);
        return "admin/article_ranking/list";
    }

}
