package com.rongtai.cms.web.admin;

import com.rongtai.cms.ShiroDbRealm;
import com.rongtai.cms.common.log.BusinessLogger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 * 真正登录的POST请求由Filter完成,
 *
 * @author rongtai
 * @version 1.0
 */
@Controller
public class LoginController {

    @Autowired
    private BusinessLogger businessLogger;

    /**
     * 进入登录页面
     *
     * @return
     */
    @RequestMapping(value = "/admin/login", method = RequestMethod.GET)
    public String login() {
        return "admin/login/login";
    }

    /**
     * 登录
     *
     * @param userName
     * @param model
     * @return
     */
    @RequestMapping(value = "/admin/login", method = RequestMethod.POST)
    public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
        return "admin/login/login";
    }

    @RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
    public String logout() {
        if (SecurityUtils.getSubject().isAuthenticated()) {
            Subject currentUser = SecurityUtils.getSubject();
            ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) currentUser.getPrincipal();
            if (businessLogger != null) {
                businessLogger.log("USER", "LOGOUT", user.getName(), null);
            }
            currentUser.logout();
        }
        return "redirect:/admin/login.jhtml";
    }

}
