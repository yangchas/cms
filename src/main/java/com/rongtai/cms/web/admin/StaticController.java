package com.rongtai.cms.web.admin;

import com.fasterxml.jackson.annotation.JsonValue;
import com.rongtai.cms.Message;
import com.rongtai.cms.entity.Article;
import com.rongtai.cms.service.ArticleCategoryService;
import com.rongtai.cms.service.ArticleService;
import com.rongtai.cms.service.StaticService;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;

/**
 * Controller - 静态化
 *
 * @author rongtai
 * @version 1.0
 */
@Controller("adminStaticController")
@RequestMapping("/admin/static")
public class StaticController extends BaseController {

    @Resource(name = "staticService")
    private StaticService staticService;
    @Resource(name = "articleCategoryService")
    private ArticleCategoryService articleCategoryService;
    @Resource(name = "articleService")
    private ArticleService articleService;

    /**
     * 生成静态
     */
    @RequestMapping(value = "/generate", method = RequestMethod.GET)
    public String generate(ModelMap model) {
        model.addAttribute("generateTypes", GenerateType.values());
        model.addAttribute("articleCategoryTree", this.articleCategoryService.getAll());
        model.addAttribute("defaultBeginDate", DateUtils.addDays(new Date(), -7));
        model.addAttribute("defaultEndDate", new Date());
        return "/admin/static/generate";
    }

    /**
     * 生成静态
     */
    @RequestMapping(value = "/generate", method = RequestMethod.POST)
    public
    @ResponseBody
    Message generate(GenerateType generateType, Long articleCategoryId, Date beginDate, Date endDate, Integer count) {
        long startTime = System.currentTimeMillis();
        Calendar calendar = Calendar.getInstance();
        if (beginDate != null) {
            calendar.setTime(beginDate);
            calendar.set(Calendar.HOUR_OF_DAY, calendar.getActualMinimum(Calendar.HOUR_OF_DAY));
            calendar.set(Calendar.MINUTE, calendar.getActualMinimum(Calendar.MINUTE));
            calendar.set(Calendar.SECOND, calendar.getActualMinimum(Calendar.SECOND));
            beginDate = calendar.getTime();
        }
        if (endDate != null) {
            calendar.setTime(endDate);
            calendar.set(Calendar.HOUR_OF_DAY, calendar.getActualMaximum(Calendar.HOUR_OF_DAY));
            calendar.set(Calendar.MINUTE, calendar.getActualMaximum(Calendar.MINUTE));
            calendar.set(Calendar.SECOND, calendar.getActualMaximum(Calendar.SECOND));
            endDate = calendar.getTime();
        }
        if (count == null || count <= 0) {
            count = 100;
        }
        int generateCount = 0;
        switch (generateType) {
            case index:
                generateCount = staticService.generateIndex();
                break;
            case article:
                Map<String, Object> searchParams = new HashMap<>();
                searchParams.put("EQ_articleCategory.id", articleCategoryId);
                searchParams.put("GTE_pubDate", beginDate);
                searchParams.put("LTE_pubDate", endDate);
                List<Article> articles = articleService.getPage(searchParams, 1, count).getContent();
                for (Article article : articles) {
                    generateCount += staticService.generate(article);
                }
                break;
        }
        long endTime = System.currentTimeMillis();
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("generateCount", generateCount);
        data.put("generateTime", endTime - startTime);
        return Message.success("静态化成功", generateCount);
    }

    /**
     * 生成类型
     */
    public enum GenerateType {
        index("首页"),
        article("文章"),
        other("其他");

        private String value;

        GenerateType(String value) {
            this.value = value;
        }

        /**
         * 获取显示的名字
         *
         * @return
         */
        @JsonValue
        public String getValue() {
            return this.value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }


}