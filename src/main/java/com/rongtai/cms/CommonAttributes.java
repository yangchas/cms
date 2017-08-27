package com.rongtai.cms;

/**
 * 公共参数
 *
 * @author rongtai
 * @version 1.0
 */
public final class CommonAttributes {

    /**
     * 日期格式配比
     */
    public static final String[] DATE_PATTERNS = new String[]{"yyyy", "yyyy-MM", "yyyyMM", "yyyy/MM", "yyyy-MM-dd", "yyyyMMdd", "yyyy/MM/dd", "yyyy-MM-dd HH:mm:ss", "yyyyMMddHHmmss", "yyyy/MM/dd HH:mm:ss"};

    /**
     * shopxx.xml文件路径
     */
    public static final String SHOPXX_XML_PATH = "/freemarker-static.xml";

    /**
     * 不可实例化
     */
    private CommonAttributes() {
    }

}