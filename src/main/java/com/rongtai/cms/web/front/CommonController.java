package com.rongtai.cms.web.front;

import com.rongtai.cms.Message;
import com.rongtai.cms.entity.JoinUs;
import com.rongtai.cms.entity.Suggest;
import com.rongtai.cms.service.JoinUsService;
import com.rongtai.cms.service.SuggestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * Controller - 共用
 * <p/>
 * Created by tan on 2017/5/31.
 */
@Controller("commonController")
public class CommonController {

    @Resource(name = "joinUsService")
    private JoinUsService joinUsService;

    @Resource(name = "suggestService")
    private SuggestService suggestService;
    /**
     * 教育安全综合治理平台
     */
    @RequestMapping("/safe")
    public String safe() {
        return "/front/safe";
    }

    /**
     * APP客户端
     */
    @RequestMapping("/app")
    public String app() {
        return "/front/app";
    }
    /**
     * 中小学安全保障
     */
    @RequestMapping("/student")
    public String student() {
        return "/front/student";
    }

    /**
     * 运营综合服务
     */
    @RequestMapping("/operation")
    public String operation() {
        return "/front/operation";
    }
    /**
     * 机房建设
     */
    @RequestMapping("/computer")
    public String computer() {
        return "/front/computer";
    }

    /**
     * 便捷办公
     */
    @RequestMapping("/office")
    public String office() {
        return "/front/office";
    }
    /**
     * 实验实训
     */
    @RequestMapping("/experiment")
    public String experiment() {
        return "/front/experiment";
    }
    /**
     * 多媒体
     */
    @RequestMapping("/media")
    public String media() {
        return "/front/media";
    }
    /**
     * 关于众云
     */
    @RequestMapping("/company")
    public String company() {
        return "/front/company";
    }

    /**
     * 加入众云
     */
    @RequestMapping("/joinUS")
    public String joinUS() {
        return "/front/joinUS";
    }

    @RequestMapping(value = "/joinUS/save",method = RequestMethod.POST)
    public String joinSave(@Valid JoinUs joinUs, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("message", Message.error("提交申请失败！", ""));
            return "redirect:/front/joinUS.jhtml";
        }
        joinUsService.save(joinUs);
        redirectAttributes.addFlashAttribute("message", Message.success("提交申请成功！", ""));
        return "redirect:/front/joinUS.jhtml";
    }

    /**
     * 联系我们
     */
    @RequestMapping("/contact")
    public String contact(Model model) {
        model.addAttribute("types", Suggest.Type.values());
        return "/front/contact";
    }

    @RequestMapping(value = "/suggest/save", method = RequestMethod.POST)
    public String suggest(Suggest suggest) {
        suggestService.save(suggest);
        return "redirect:/contact.jhtml";
    }

    /**
     * 文章列表页
     */
    @RequestMapping("/listAll")
    public String listAll() {
        return "/front/articlelist";
    }

    /**
     * 文章详情页
     */
    @RequestMapping("/detail")
    public String detail() {
        return "/front/articledetail";
    }
}