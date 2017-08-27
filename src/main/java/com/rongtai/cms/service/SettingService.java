package com.rongtai.cms.service;

import com.rongtai.cms.entity.Setting;
import com.rongtai.cms.repository.SettingDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Service - 系统设置
 * <p/>
 * Created by tan on 2017/5/17.
 */
@Service("settingService")
public class SettingService {

    @Autowired
    protected SettingDao settingDao;

    @Resource(name = "configService")
    private ConfigService configService;

    public Setting get() {
        List<Setting> settings = (List<Setting>) this.settingDao.findAll();
        return settings.size() == 0 ? null : settings.get(0);
    }

    public void update(Setting entity) {
        configService.init();
        settingDao.save(entity);
    }

}
