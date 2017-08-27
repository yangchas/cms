package com.rongtai.cms.web.admin;

import com.rongtai.cms.BootstrapTableResponse;
import com.rongtai.cms.Message;
import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.Ad;
import com.rongtai.cms.entity.AdPosition;
import com.rongtai.cms.service.AdPositionService;
import com.rongtai.cms.service.AdService;
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
 * 广告管理控制器
 */
@Controller
@RequestMapping(value = "admin/ad")
public class AdController extends BaseController {

    /**
     * 默认页码
     */
    private static final String DEFAULT_PAGE_NUMBER = "1";

    /**
     * 默认每页记录数
     */
    private static final String DEFAULT_PAGE_SIZE = "10";

    @Resource(name = "adService")
    private AdService adService;
    @Resource(name = "adPositionService")
    private AdPositionService adPositionService;


    /**
     * 列表
     */
    @RequestMapping(method = RequestMethod.GET)
    public String list() {
        return "admin/ad/list";
    }

    /**
     * 分页
     */
    @RequestMapping(value = "getPage")
    public
    @ResponseBody
    BootstrapTableResponse<Ad> getPage(@RequestParam(value = "pageNumber", defaultValue = DEFAULT_PAGE_NUMBER) int pageNumber,
                                       @RequestParam(value = "pageSize", defaultValue = DEFAULT_PAGE_SIZE) int pageSize,
                                       @RequestParam(value = "sortName", defaultValue = "auto") String sortName,
                                       @RequestParam(value = "sortOrder", defaultValue = "asc") String sortOrder, ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        Page<Ad> page = this.adService.getPage(searchParams, pageNumber, pageSize, sortName, sortOrder);
        return new BootstrapTableResponse<Ad>(page.getTotalElements(), page.getContent());
    }

    /**
     * 添加
     */
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String add(Model model) {
        Ad ad = new Ad();
        List<AdPosition> adPositionList = adPositionService.getAll();
        ad.setSort(0);
        model.addAttribute("adPositionList", adPositionList);
        model.addAttribute("types", Ad.Type.values());
        model.addAttribute("ad", ad);
        model.addAttribute("action", "save");
        return "/admin/ad/edit";
    }


    /**
     * 保存
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@Valid Ad ad, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("message", Message.error("添加失败！", ""));
            return "redirect:/admin/ad.jhtml";
        }
        adService.save(ad);
        redirectAttributes.addFlashAttribute("message", Message.success("添加成功！", ""));
        return "redirect:/admin/ad.jhtml";
    }

    /**
     * 编辑
     */
    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Long id, Model model) {
        List<AdPosition> adPositionList = adPositionService.getAll();
        model.addAttribute("adPositionList", adPositionList);
        model.addAttribute("TOFEnums", TOFEnum.values());
        model.addAttribute("ad", this.adService.get(id));
        model.addAttribute("types", Ad.Type.values());
        model.addAttribute("action", "update");
        return "/admin/ad/edit";
    }


    /**
     * 更新
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("ad") Ad ad, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("message", Message.error("修改失败！", ""));
            return "redirect:/admin/ad.jhtml";
        }
        adService.update(ad);
        redirectAttributes.addFlashAttribute("message", Message.success("修改成功！", ""));
        return "redirect:/admin/ad.jhtml";
    }


    /**
     * 删除
     */
    @RequestMapping(value = "delete/{id}", method = RequestMethod.POST)
    public
    @ResponseBody
    Message delete(@PathVariable("id") Long id) {
        try {
            adService.delete(id);
        } catch (ServiceException e) {
            return Message.error(e.getMessage(), "");
        }
        return Message.success("删除成功", id);
    }

    /**
     * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
     * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
     */
    @ModelAttribute
    public void getUser(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
        if (id != -1) {
            Ad ad = this.adService.get(id);
            ad.setAdPosition(null);
            model.addAttribute("ad", ad);
        }
    }

}
