/*
 * Copyright 2005-2016 yunnonggongshe.com All rights reserved.
 * 

 */
package com.rongtai.cms.web.admin;

import com.rongtai.cms.DateEditor;
import com.rongtai.cms.Message;
import com.rongtai.cms.service.ServiceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * Controller - 基类
 * 
 * @author rongtai
 * @version 1.0
 */
public class BaseController {

	/** Logger */
	private final Logger logger = LoggerFactory.getLogger(getClass());

	/** 错误视图 */
	protected static final String ERROR_VIEW = "/admin/common/error";

	/** 错误消息 */
	protected static final Message ERROR_MESSAGE = Message.error("操作错误", "");

	/** 成功消息 */
	protected static final Message SUCCESS_MESSAGE = Message.success("操作成功", "");

	/**
	 * 数据绑定
	 * 
	 * @param binder
	 *            WebDataBinder
	 */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new DateEditor(true));
    }

	/**
	 * 异常处理
	 * 
	 * @param exception
	 *            异常
	 * @param response
	 *            HttpServletResponse
	 * @return 数据视图
	 */
	@ExceptionHandler
	public ModelAndView exceptionHandler(Exception exception, HttpServletResponse response) {
		if (exception instanceof ServiceException) {
            logger.warn("Handler execution resulted in exception", exception);
            ModelMap model = new ModelMap();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return new ModelAndView(ERROR_VIEW, model);
		} else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return new ModelAndView("/admin/common/resource_not_found");
		}
	}

}