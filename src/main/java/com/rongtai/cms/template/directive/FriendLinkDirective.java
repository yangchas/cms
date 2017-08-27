package com.rongtai.cms.template.directive;

import com.rongtai.cms.entity.FriendLink;
import com.rongtai.cms.service.FriendLinkService;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 模板指令 - SEO设置
 *
 * @author rongtai
 * @version 1.0
 */
@Component("friendLinkDirective")
public class FriendLinkDirective extends BaseDirective {


    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "friendLinks";

    @Resource(name = "friendLinkService")
    private FriendLinkService friendLinkService;

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
        List<FriendLink> friendLinks = friendLinkService.getList();
        setLocalVariable(VARIABLE_NAME, friendLinks, env, body);
    }

}