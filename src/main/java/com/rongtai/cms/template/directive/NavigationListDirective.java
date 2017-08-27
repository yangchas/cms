package com.rongtai.cms.template.directive;

import com.rongtai.cms.Filter;
import com.rongtai.cms.Order;
import com.rongtai.cms.entity.Navigation;
import com.rongtai.cms.service.NavigationService;
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
 * 模板指令 - 导航列表
 *
 * @author rongtai
 * @version 1.0
 */
@Component("navigationListDirective")
public class NavigationListDirective extends BaseDirective {

    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "navigations";

    @Resource(name = "navigationService")
    private NavigationService navigationService;

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
        Integer count = getCount(params);
        List<Filter> filters = getFilters(params, Navigation.class);
        List<Order> orders = getOrders(params);
        List<Navigation> navigations = navigationService.getList(count == null ? 10 : count, filters, orders);
        setLocalVariable(VARIABLE_NAME, navigations, env, body);
    }

}