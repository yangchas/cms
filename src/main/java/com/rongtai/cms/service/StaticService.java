package com.rongtai.cms.service;

import com.rongtai.cms.TemplateConfig;
import com.rongtai.cms.common.utils.SystemUtils;
import com.rongtai.cms.entity.Article;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Service - 静态化
 * <p/>
 * Created by tan on 2017/5/17.
 */
@Service("staticService")
public class StaticService implements ServletContextAware {

    @Resource(name = "articleService")
    public ArticleService articleService;
    /**
     * ServletContext
     */
    private ServletContext servletContext;
    @Resource(name = "freeMarkerConfigurer")
    private FreeMarkerConfigurer freeMarkerConfigurer;

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    @Transactional(readOnly = true)
    public int generateIndex() {
        TemplateConfig templateConfig = SystemUtils.getTemplateConfig("index");
        return generate(templateConfig.getRealTemplatePath(), templateConfig.getRealStaticPath(), null);
    }

    @Transactional
    public int generateAll() {
        int generateCount = 0;
        generateCount += generateIndex();
        return generateCount;
    }

    @Transactional(readOnly = true)
    public int generate(String templatePath, String staticPath, Map<String, Object> model) {
        Assert.hasText(templatePath);
        Assert.hasText(staticPath);

        Writer writer = null;
        try {
            Template template = freeMarkerConfigurer.getConfiguration().getTemplate(templatePath);
            File staticFile = new File(servletContext.getRealPath(staticPath));
            File staticDir = staticFile.getParentFile();
            if (staticDir != null) {
                staticDir.mkdirs();
            }
            writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(staticFile), "UTF-8"));
            template.process(model, writer);
            writer.flush();
            return 1;
        } catch (IOException | TemplateException e) {
            throw new RuntimeException(e.getMessage(), e);
        } finally {
            IOUtils.closeQuietly(writer);
        }
    }

    @Transactional
    public int generate(Article article) {
        if (article == null) {
            return 0;
        }
        delete(article);
        if (!article.getIsPublication()) {
            return 0;
        }
        TemplateConfig templateConfig = SystemUtils.getTemplateConfig("articleContent");
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("article", article);
        List<Article> articleList = articleService.getList(article.getArticleCategory().getId(), true);
        int index = articleList.indexOf(article);
        if (index > 0) model.put("pre", articleList.get(index - 1));
        if (index < articleList.size() - 1) model.put("next", articleList.get(index + 1));
        return generate(templateConfig.getRealTemplatePath(), article.getPath(), model);
    }

    @Transactional(readOnly = true)
    public int delete(String staticPath) {
        if (StringUtils.isEmpty(staticPath)) {
            return 0;
        }
        File staticFile = new File(servletContext.getRealPath(staticPath));
        return FileUtils.deleteQuietly(staticFile) ? 1 : 0;
    }

    @Transactional
    public int delete(Article article) {
        if (article == null || StringUtils.isEmpty(article.getPath())) {
            return 0;
        }
        return delete(article.getPath());
    }
}
