/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.rongtai.cms.web.admin;

import com.rongtai.cms.BootstrapTableResponse;
import com.rongtai.cms.Message;
import com.rongtai.cms.entity.Admin;
import com.rongtai.cms.service.AdminService;
import com.rongtai.cms.service.RoleService;
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
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/admin")
public class AdminController extends BaseController {

    /** 默认页码 */
    private static final String DEFAULT_PAGE_NUMBER = "1";

    /** 默认每页记录数 */
    private static final String DEFAULT_PAGE_SIZE = "10";

    @Resource(name = "adminService")
    private AdminService adminService;
    @Resource(name = "roleService")
    private RoleService roleService;

    @RequestMapping(method = RequestMethod.GET)
    public String list() {
        return "admin/admin/list";
    }

    @RequestMapping(value = "getPage")
    public @ResponseBody
    BootstrapTableResponse<Admin> getPage(@RequestParam(value = "pageNumber", defaultValue = DEFAULT_PAGE_NUMBER) int pageNumber,
                                                @RequestParam(value = "pageSize", defaultValue = DEFAULT_PAGE_SIZE) int pageSize,
                                                @RequestParam(value = "sortName", defaultValue = "auto") String sortName,
                                                @RequestParam(value = "sortOrder", defaultValue = "asc") String sortOrder, ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        Page<Admin> page = this.adminService.getPage(searchParams, pageNumber, pageSize, sortName, sortOrder);
        return new BootstrapTableResponse<Admin>(page.getTotalElements(), page.getContent());
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String add(Model model) {
        Admin admin = new Admin();
        model.addAttribute("admin", admin);
        model.addAttribute("action", "save");
        model.addAttribute("roleList",roleService.getAll());
        return "admin/admin/edit";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@Valid Admin admin, BindingResult result, RedirectAttributes redirectAttributes, Long roleId) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("message", Message.error("添加失败！", ""));
            return "redirect:/admin/admin.jhtml";
        }
        admin.setRole(roleService.get(roleId));
        adminService.save(admin);
        redirectAttributes.addFlashAttribute("message", Message.success("添加成功！", ""));
        return "redirect:/admin/admin.jhtml";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Long id, Model model) {
        model.addAttribute("admin", this.adminService.get(id));
        model.addAttribute("action", "update");
        model.addAttribute("roleList",roleService.getAll());
        return "admin/admin/edit";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("admin") Admin admin, BindingResult result, RedirectAttributes redirectAttributes, Long roleId) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("message", Message.error("修改失败！", ""));
            return "redirect:/admin/admin.jhtml";
        }
        admin.setRole(roleService.get(roleId));
        adminService.update(admin);
        redirectAttributes.addFlashAttribute("message", Message.success("修改成功！", ""));
        return "redirect:/admin/admin.jhtml";
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.POST)
    public @ResponseBody
    Message delete(@PathVariable("id") Long id) {
        try {
            adminService.delete(id);
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
            model.addAttribute("admin", adminService.get(id));
        }
    }

}
