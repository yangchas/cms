package com.rongtai.cms.template.directive;

import com.rongtai.cms.common.utils.FreeMarkerUtils;
import com.rongtai.cms.entity.Seo;
import com.rongtai.cms.service.SeoService;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Map;

/**
 * 模板指令 - SEO设置
 *
 * @author rongtai
 * @version 1.0
 */
@Component("seoDirective")
public class SeoDirective extends BaseDirective {

    /**
     * "类型"参数名称
     */
    private static final String TYPE_PARAMETER_NAME = "type";

    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "seo";

    @Resource(name = "seoService")
    private SeoService seoService;

    /**
     * 执行
     *
     * @param env      环境变量
     * @param params   参数
     * @param loopVars 循环变量
     * @param body     模板内容
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        Seo.Type type = FreeMarkerUtils.getParameter(TYPE_PARAMETER_NAME, Seo.Type.class, params);
        Seo seo = seoService.getByType(type);
        setLocalVariable(VARIABLE_NAME, seo, env, body);
    }

}