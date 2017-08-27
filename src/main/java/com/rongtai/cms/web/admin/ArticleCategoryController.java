package com.rongtai.cms.web.admin;


import com.rongtai.cms.BootstrapTableResponse;
import com.rongtai.cms.Message;
import com.rongtai.cms.entity.ArticleCategory;
import com.rongtai.cms.service.ArticleCategoryService;
import com.rongtai.cms.service.ServiceException;
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
 * 文章分类-文章树
 * Created by ycc
 */
@Controller
@RequestMapping(value = "admin/articleCategory")
public class ArticleCategoryController extends BaseController {

    /** 默认页码 */
    private static final String DEFAULT_PAGE_NUMBER = "1";

    /** 默认每页记录数 */
    private static final String DEFAULT_PAGE_SIZE = "10";

    @Resource(name = "articleCategoryService")
    private ArticleCategoryService articleCategoryService;

    @RequestMapping(method = RequestMethod.GET)
    public String list() {
        return "admin/articleCategory/list";
    }

    @RequestMapping(value = "getPage")
    public @ResponseBody
    BootstrapTableResponse<ArticleCategory> getPage(@RequestParam(value = "pageNumber", defaultValue = DEFAULT_PAGE_NUMBER) int pageNumber,
                                            @RequestParam(value = "pageSize", defaultValue = DEFAULT_PAGE_SIZE) int pageSize,
                                            @RequestParam(value = "sortName", defaultValue = "auto") String sortName,
                                            @RequestParam(value = "sortOrder", defaultValue = "asc") String sortOrder, ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        Page<ArticleCategory> page = this.articleCategoryService.getPage(searchParams, pageNumber, pageSize, sortName, sortOrder);
        return new BootstrapTableResponse<ArticleCategory>(page.getTotalElements(), page.getContent());
    }


    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String add(Model model) {
        ArticleCategory articleCategory = new ArticleCategory();
        model.addAttribute("articleCategory", articleCategory);
        List<ArticleCategory> articleCategoryList = this.articleCategoryService.getAll();
        model.addAttribute("articleCategoryList",articleCategoryList);
        model.addAttribute("action", "save");
        return "admin/articleCategory/edit";
    }


    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@Valid ArticleCategory articleCategory, BindingResult result, RedirectAttributes redirectAttributes, Long parentId) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("message", Message.error("添加失败！", ""));
            return "redirect:/admin/articleCategory.jhtml";
        }
        if(parentId != null){
            articleCategory.setParent(this.articleCategoryService.get(parentId));
        } else {
            articleCategory.setParent(null);
        }
        try {
            articleCategoryService.save(articleCategory);
        }catch (ServiceException e) {
            redirectAttributes.addFlashAttribute("message", Message.error(e.getMessage(), ""));
            return "redirect:/admin/articleCategory.jhtml";
        }

        redirectAttributes.addFlashAttribute("message", Message.success("添加成功！", ""));
        return "redirect:/admin/articleCategory.jhtml";

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("articleCategory") ArticleCategory articleCategory, Long parentId,
                        BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("message", Message.error("修改失败！", ""));
            return "redirect:/admin/articleCategory.jhtml";
        }
        if (parentId != null) {
            articleCategory.setParent(this.articleCategoryService.get(parentId));
        }
        articleCategoryService.update(articleCategory);
        redirectAttributes.addFlashAttribute("message", Message.success("修改成功！", ""));
        return "redirect:/admin/articleCategory.jhtml";

    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Long id, Model model) {
        ArticleCategory articleCategory = this.articleCategoryService.get(id);
        model.addAttribute("articleCategory", articleCategory);
        List<ArticleCategory> articleCategoryList = this.articleCategoryService.getAll();
        model.addAttribute("articleCategoryList",articleCategoryList);
        model.addAttribute("action", "update");
        return "admin/articleCategory/edit";
    }


    @ResponseBody
    @RequestMapping(value = "delete/{id}", method = RequestMethod.POST)
    public Message delete(@PathVariable("id") Long id) {
        try {
            articleCategoryService.delete(id);
        } catch (ServiceException e) {
            return Message.error(e.getMessage(), "");
        }
        return Message.success("删除成功", id);
    }

    @ModelAttribute
    public void getUser(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
        if (id != -1) {
            model.addAttribute("articleCategory", articleCategoryService.get(id));
        }
    }

}
