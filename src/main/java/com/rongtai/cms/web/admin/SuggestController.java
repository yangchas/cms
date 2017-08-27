package com.rongtai.cms.web.admin;

import com.rongtai.cms.BootstrapTableResponse;
import com.rongtai.cms.entity.Suggest;
import com.rongtai.cms.service.SuggestService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springside.modules.web.Servlets;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import java.util.Map;


@Controller
@RequestMapping(value = "/admin/suggest")
public class SuggestController extends BaseController {

    /**
     * 默认页码
     */
    private static final String DEFAULT_PAGE_NUMBER = "1";

    /**
     * 默认每页记录数
     */
    private static final String DEFAULT_PAGE_SIZE = "10";

    @Resource(name = "suggestService")
    private SuggestService suggestService;

    @RequestMapping(method = RequestMethod.GET)
    public String list() {
        return "admin/suggest/list";
    }

    @RequestMapping(value = "getPage")
    public
    @ResponseBody
    BootstrapTableResponse<Suggest> getPage(@RequestParam(value = "pageNumber", defaultValue = DEFAULT_PAGE_NUMBER) int pageNumber,
                                            @RequestParam(value = "pageSize", defaultValue = DEFAULT_PAGE_SIZE) int pageSize,
                                            @RequestParam(value = "sortName", defaultValue = "auto") String sortName,
                                            @RequestParam(value = "sortOrder", defaultValue = "asc") String sortOrder, ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        Page<Suggest> page = this.suggestService.getPage(searchParams, pageNumber, pageSize, sortName, sortOrder);
        return new BootstrapTableResponse<Suggest>(page.getTotalElements(), page.getContent());
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Long id, Model model) {
        model.addAttribute("suggest", this.suggestService.get(id));
        model.addAttribute("action", "update");
        return "admin/suggest/edit";
    }

    /**
     * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
     * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
     */
    @ModelAttribute
    public void getUser(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
        if (id != -1) {
            model.addAttribute("suggest", suggestService.get(id));
        }
    }

}