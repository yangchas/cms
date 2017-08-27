package com.rongtai.cms.service;

import com.rongtai.cms.entity.Setting;
import freemarker.template.Configuration;
import freemarker.template.TemplateModelException;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.annotation.Resource;

/**
 * Service - 配置
 * <p/>
 * Created by tan on 2017/5/17.
 */
@Service("configService")
public class ConfigService {

    @Resource(name = "freeMarkerConfigurer")
    private FreeMarkerConfigurer freeMarkerConfigurer;

    @Resource(name = "settingService")
    private SettingService settingService;

    public void init() {
        Setting setting = this.settingService.get();
        Configuration configuration = freeMarkerConfigurer.getConfiguration();
        try {
            configuration.setSharedVariable("setting", setting);
        } catch (TemplateModelException e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }

}
