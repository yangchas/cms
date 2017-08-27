package com.rongtai.cms.web.admin;

import com.rongtai.cms.Message;
import com.rongtai.cms.service.FileService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * Created by tan on 2017/5/23.
 */
@Controller
@RequestMapping(value = "/admin/file")
public class FileController {

    @Resource(name = "fileService")
    private FileService fileService;

    /**
     * 上传
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public
    @ResponseBody
    Message upload(MultipartFile file) {
        try {
            String url = fileService.upload(file);
            return Message.success("上传文件成功", url);
        } catch (Exception e) {
            return Message.error("上传文件成功", "");
        }
    }
}
