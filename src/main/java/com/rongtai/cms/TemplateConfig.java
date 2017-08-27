package com.rongtai.cms;

import com.rongtai.cms.common.utils.FreeMarkerUtils;
import freemarker.template.TemplateException;

import java.io.IOException;
import java.util.Map;

/**
 * Created by tan on 2017/5/19.
 */
public class TemplateConfig {

    /**
     * ID
     */
    private String id;

    /**
     * 名称
     */
    private String name;

    /**
     * 模板文件路径
     */
    private String templatePath;

    /**
     * 静态文件路径
     */
    private String staticPath;

    /**
     * 获取ID
     *
     * @return ID
     */
    public String getId() {
        return id;
    }

    /**
     * 设置ID
     *
     * @param id ID
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取名称
     *
     * @return 名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置名称
     *
     * @param name 名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取模板文件路径
     *
     * @return 模板文件路径
     */
    public String getTemplatePath() {
        return templatePath;
    }

    /**
     * 设置模板文件路径
     *
     * @param templatePath 模板文件路径
     */
    public void setTemplatePath(String templatePath) {
        this.templatePath = templatePath;
    }

    /**
     * 获取静态文件路径
     *
     * @return 静态文件路径
     */
    public String getStaticPath() {
        return staticPath;
    }

    /**
     * 设置静态文件路径
     *
     * @param staticPath 静态文件路径
     */
    public void setStaticPath(String staticPath) {
        this.staticPath = staticPath;
    }

    /**
     * 获取实际模板文件路径
     *
     * @return 实际模板文件路径
     */
    public String getRealTemplatePath() {
        return getRealTemplatePath(null);
    }

    /**
     * 获取实际模板文件路径
     *
     * @param model 数据
     * @return 实际模板文件路径
     */
    public String getRealTemplatePath(Map<String, Object> model) {
        try {
            return FreeMarkerUtils.process(getTemplatePath(), model);
        } catch (IOException e) {
            throw new RuntimeException(e.getMessage(), e);
        } catch (TemplateException e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }

    /**
     * 获取实际静态文件路径
     *
     * @return 实际静态文件路径
     */
    public String getRealStaticPath() {
        return getRealStaticPath(null);
    }

    /**
     * 获取实际静态文件路径
     *
     * @param model 数据
     * @return 实际静态文件路径
     */
    public String getRealStaticPath(Map<String, Object> model) {
        try {
            return FreeMarkerUtils.process(getStaticPath(), model);
        } catch (IOException | TemplateException e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }
}
