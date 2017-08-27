package com.rongtai.cms.service;

import com.rongtai.cms.common.utils.FreeMarkerUtils;
import com.rongtai.cms.entity.Setting;
import freemarker.template.TemplateException;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Service - 文件上传
 * <p/>
 * Created by tan on 2017/5/23.
 */
@Service("fileService")
public class FileService implements ServletContextAware {

    /**
     * ServletContext
     */
    private ServletContext servletContext;

    @Resource(name = "settingService")
    private SettingService settingService;

    /**
     * 文件上传
     *
     * @param multipartFile 上传文件
     * @return 访问URL
     */
    public String upload(MultipartFile multipartFile) {
        Setting setting = this.settingService.get();
        String uploadPath = setting.getFileUploadPath();

        try {
            Map<String, Object> model = new HashMap<String, Object>();
            model.put("uuid", UUID.randomUUID().toString());
            String path = FreeMarkerUtils.process(uploadPath, model);
            String destPath = path + UUID.randomUUID() + "." + FilenameUtils.getExtension(multipartFile.getOriginalFilename());

            File tempFile = new File(FileUtils.getTempDirectory(), UUID.randomUUID() + ".tmp");
            multipartFile.transferTo(tempFile);

            upload(destPath, tempFile);
            return setting.getSiteUrl() + destPath;
        } catch (IOException | TemplateException e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }

    /**
     * 上传文件
     *
     * @param path 上传路径
     * @param file 上传文件
     */
    private void upload(String path, File file) {
        File destFile = new File(servletContext.getRealPath(path));
        try {
            FileUtils.moveFile(file, destFile);
        } catch (IOException e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
}
