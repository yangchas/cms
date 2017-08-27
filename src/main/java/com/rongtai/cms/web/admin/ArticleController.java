package com.rongtai.cms.web.admin;


import com.rongtai.cms.BootstrapTableResponse;
import com.rongtai.cms.Message;
import com.rongtai.cms.ShiroDbRealm;
import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.Article;
import com.rongtai.cms.entity.ArticleCategory;
import com.rongtai.cms.service.ArticleCategoryService;
import com.rongtai.cms.service.ArticleService;
import com.rongtai.cms.service.ServiceException;
import org.apache.shiro.SecurityUtils;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;


/**
 * 文章管理
 */
@Controller("adminArticleController")
@RequestMapping(value = "admin/article")
public class ArticleController extends BaseController {

    /** 默认页码 */
    private static final String DEFAULT_PAGE_NUMBER = "1";

    /** 默认每页记录数 */
    private static final String DEFAULT_PAGE_SIZE = "10";

    @Resource(name = "articleCategoryService")
    private ArticleCategoryService articleCategoryService;
    @Resource(name = "articleService")
    private ArticleService articleService;

    @RequestMapping(method = RequestMethod.GET)
    public String list() {
        return "admin/article/list";
    }


    @RequestMapping(value = "getPage")
    public @ResponseBody
    BootstrapTableResponse<Article> getPage(@RequestParam(value = "pageNumber", defaultValue = DEFAULT_PAGE_NUMBER) int pageNumber,
                                         @RequestParam(value = "pageSize", defaultValue = DEFAULT_PAGE_SIZE) int pageSize,
                                         @RequestParam(value = "sortName", required = false) String sortName,
                                         @RequestParam(value = "sortOrder", required = false) String sortOrder, ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        Page<Article> page = this.articleService.getPage(searchParams, pageNumber, pageSize, sortName, sortOrder);
        return new BootstrapTableResponse<Article>(page.getTotalElements(), page.getContent());
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String add(Model model) {
        Article article = new Article();
        ShiroDbRealm.ShiroUser curuser = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        List<ArticleCategory> articleCategoryList = articleCategoryService.getAll();
        article.setAuthor(curuser.getName());
        model.addAttribute("articleCategoryList",articleCategoryList);
        model.addAttribute("article", article);
        model.addAttribute("action", "save");
        return "admin/article/edit";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@Valid Article article, BindingResult result, RedirectAttributes redirectAttributes, Long parentId) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("message", Message.error("添加失败！", ""));
            return "redirect:/admin/article.jhtml";
        }
        article.setArticleCategory(this.articleCategoryService.get(parentId));
        articleService.save(article);
        redirectAttributes.addFlashAttribute("message", Message.success("添加成功！", ""));
        return "redirect:/admin/article.jhtml";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Long id, Model model) {
        model.addAttribute("article", this.articleService.get(id));
        List<ArticleCategory> articleCategoryList = articleCategoryService.getAll();
        model.addAttribute("articleCategoryList",articleCategoryList);
        model.addAttribute("TOFEnums", TOFEnum.values());
        model.addAttribute("action", "update");
        return "admin/article/edit";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("article") Article article, BindingResult result, RedirectAttributes redirectAttributes, Long parentId) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("message", Message.error("修改失败！", ""));
            return "redirect:/admin/article.jhtml";
        }
        article.setArticleCategory(this.articleCategoryService.get(parentId));
        articleService.update(article);
        redirectAttributes.addFlashAttribute("message", Message.success("修改成功！", ""));
        return "redirect:/admin/article.jhtml";

    }

    @ResponseBody
    @RequestMapping(value = "delete/{id}", method = RequestMethod.POST)
    public Message delete(@PathVariable("id") Long id) {
        try {
            articleService.delete(id);
        } catch (ServiceException e) {
            return Message.error(e.getMessage(), "");
        }
        return Message.success("删除成功", id);
    }

    @ModelAttribute
    public void getUser(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
        if (id != -1) {
            model.addAttribute("article", articleService.get(id));
        }
    }

}
