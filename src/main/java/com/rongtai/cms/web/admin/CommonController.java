/*
 * Copyright 2005-2016 yunnonggongshe.com All rights reserved.
 * 

 */
package com.rongtai.cms.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller - 共用
 *
 * @author rongtai
 * @version 1.0
 */
@Controller("adminCommonController")
@RequestMapping("/admin/common")
public class CommonController {

    /**
     * 主页
     */
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main() {
        return "/admin/common/main";
    }

    /**
     * 首页
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        return "/admin/common/index";
    }

}