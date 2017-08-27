package com.rongtai.cms.listener;

import com.rongtai.cms.service.ConfigService;
import com.rongtai.cms.service.StaticService;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

/**
 * Created by tan on 2017/5/17.
 */
@Component("initListener")
public class InitListener implements ServletContextAware, ApplicationListener<ContextRefreshedEvent> {

    /**
     * ServletContext
     */
    private ServletContext servletContext;

    @Resource(name = "staticService")
    private StaticService staticService;
    @Resource(name = "configService")
    private ConfigService configService;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        if (contextRefreshedEvent.getApplicationContext().getParent() == null) {
            configService.init();
            staticService.generateAll();
        }
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
}
