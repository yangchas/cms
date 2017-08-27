package com.rongtai.cms.template.directive;

import com.rongtai.cms.entity.AdPosition;
import com.rongtai.cms.service.AdPositionService;
import freemarker.core.Environment;
import freemarker.template.Template;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.StringReader;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

/**
 * 模板指令 - 广告位
 *
 * @author rongtai
 * @version 1.0
 */
@Component("adPositionDirective")
public class AdPositionDirective extends BaseDirective {

    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "adPosition";

    @Resource(name = "freeMarkerConfigurer")
    private FreeMarkerConfigurer freeMarkerConfigurer;
    @Resource(name = "adPositionService")
    private AdPositionService adPositionService;

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
        Long id = getId(params);
        AdPosition adPosition = adPositionService.get(id);
        if (body != null) {
            setLocalVariable(VARIABLE_NAME, adPosition, env, body);
        } else {
            if (adPosition != null && adPosition.getTemplate() != null) {
                try {
                    Map<String, Object> model = new HashMap<String, Object>();
                    model.put(VARIABLE_NAME, adPosition);
                    Writer out = env.getOut();
                    new Template("adTemplate", new StringReader(adPosition.getTemplate()), freeMarkerConfigurer.getConfiguration()).process(model, out);
                } catch (TemplateException | IOException e) {
                    throw new RuntimeException(e.getMessage(), e);
                }
            }
        }
    }

}