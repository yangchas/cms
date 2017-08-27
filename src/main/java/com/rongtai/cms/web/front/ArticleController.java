package com.rongtai.cms.web.front;

import com.rongtai.cms.service.ArticleCategoryService;
import com.rongtai.cms.service.ArticleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springside.modules.web.Servlets;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Controller - 文章
 *
 * @author rongtai
 * @version 1.0
 */
@Controller("frontArticleController")
@RequestMapping("/article")
public class ArticleController {

    /**
     * 默认页码
     */
    private static final String DEFAULT_PAGE_NUMBER = "1";

    /**
     * 默认每页记录数
     */
    private static final String DEFAULT_PAGE_SIZE = "10";

    @Resource(name = "articleCategoryService")
    private ArticleCategoryService articleCategoryService;
    @Resource(name = "articleService")
    private ArticleService articleService;

    /**
     * 列表
     */
    @RequestMapping(value = "/list/{id}", method = RequestMethod.GET)
    public String list(@PathVariable Long id, @RequestParam(value = "pageNumber", defaultValue = DEFAULT_PAGE_NUMBER) int pageNumber,
                       @RequestParam(value = "pageSize", defaultValue = DEFAULT_PAGE_SIZE) int pageSize,
                       HttpServletRequest request, ModelMap model) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        searchParams.put("EQ_articleCategory.id", id);
        searchParams.put("EQ_isPublication", true);
        model.addAttribute("articleCategory", this.articleCategoryService.get(id));
        model.addAttribute("articleCategorys", this.articleCategoryService.getAll());
        model.addAttribute("page", this.articleService.getPage(searchParams, pageNumber, pageSize, "isTop", "desc"));
        return "/front/article/listAll";
    }

    /**
     * 点击数
     */
    @RequestMapping(value = "/hits/{id}", method = RequestMethod.GET)
    public
    @ResponseBody
    Long hits(@PathVariable Long id) {
        return articleService.viewHits(id);
    }

}