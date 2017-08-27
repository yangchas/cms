package com.rongtai.cms.common.utils;

import com.rongtai.cms.CommonAttributes;
import com.rongtai.cms.EnumConverter;
import com.rongtai.cms.TemplateConfig;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.ConvertUtilsBean;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.beanutils.converters.ArrayConverter;
import org.apache.commons.beanutils.converters.DateConverter;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.ClassPathResource;
import org.springframework.util.Assert;

import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Utils - 系统
 *
 * @author rongtai
 * @version 1.0
 */
public final class SystemUtils {

    /**
     * BeanUtilsBean
     */
    private static final BeanUtilsBean BEAN_UTILS;

    static {
        ConvertUtilsBean convertUtilsBean = new ConvertUtilsBean() {
            @Override
            public String convert(Object value) {
                if (value != null) {
                    Class<?> type = value.getClass();
                    if (type.isEnum() && super.lookup(type) == null) {
                        super.register(new EnumConverter(type), type);
                    } else if (type.isArray() && type.getComponentType().isEnum()) {
                        if (super.lookup(type) == null) {
                            ArrayConverter arrayConverter = new ArrayConverter(type, new EnumConverter(type.getComponentType()), 0);
                            arrayConverter.setOnlyFirstToString(false);
                            super.register(arrayConverter, type);
                        }
                        Converter converter = super.lookup(type);
                        return ((String) converter.convert(String.class, value));
                    }
                }
                return super.convert(value);
            }

            @SuppressWarnings("rawtypes")
            @Override
            public Object convert(String value, Class clazz) {
                if (clazz.isEnum() && super.lookup(clazz) == null) {
                    super.register(new EnumConverter(clazz), clazz);
                }
                return super.convert(value, clazz);
            }

            @SuppressWarnings("rawtypes")
            @Override
            public Object convert(String[] values, Class clazz) {
                if (clazz.isArray() && clazz.getComponentType().isEnum() && super.lookup(clazz.getComponentType()) == null) {
                    super.register(new EnumConverter(clazz.getComponentType()), clazz.getComponentType());
                }
                return super.convert(values, clazz);
            }

            @SuppressWarnings("rawtypes")
            @Override
            public Object convert(Object value, Class targetType) {
                if (super.lookup(targetType) == null) {
                    if (targetType.isEnum()) {
                        super.register(new EnumConverter(targetType), targetType);
                    } else if (targetType.isArray() && targetType.getComponentType().isEnum()) {
                        ArrayConverter arrayConverter = new ArrayConverter(targetType, new EnumConverter(targetType.getComponentType()), 0);
                        arrayConverter.setOnlyFirstToString(false);
                        super.register(arrayConverter, targetType);
                    }
                }
                return super.convert(value, targetType);
            }
        };

        DateConverter dateConverter = new DateConverter();
        dateConverter.setPatterns(CommonAttributes.DATE_PATTERNS);
        convertUtilsBean.register(dateConverter, Date.class);
        BEAN_UTILS = new BeanUtilsBean(convertUtilsBean);
    }

    /**
     * 不可实例化
     */
    private SystemUtils() {
    }

    /**
     * 获取模板配置
     *
     * @param id ID
     * @return 模板配置
     */
    public static TemplateConfig getTemplateConfig(String id) {
        Assert.hasText(id);
        TemplateConfig templateConfig = null;
        try {
            File shopxxXmlFile = new ClassPathResource(CommonAttributes.SHOPXX_XML_PATH).getFile();
            Document document = new SAXReader().read(shopxxXmlFile);
            org.dom4j.Element element = (org.dom4j.Element) document.selectSingleNode("/cms/templateConfig[@id='" + id + "']");
            if (element != null) {
                templateConfig = getTemplateConfig(element);
            }
        } catch (IOException | DocumentException e) {
            throw new RuntimeException(e.getMessage(), e);
        }
        return templateConfig;
    }

    /**
     * 获取模板配置
     *
     * @param element 元素
     * @return 模板配置
     */
    private static TemplateConfig getTemplateConfig(org.dom4j.Element element) {
        Assert.notNull(element);

        String id = element.attributeValue("id");
        String name = element.attributeValue("name");
        String templatePath = element.attributeValue("templatePath");
        String staticPath = element.attributeValue("staticPath");

        TemplateConfig templateConfig = new TemplateConfig();
        templateConfig.setId(id);
        templateConfig.setName(name);
        templateConfig.setTemplatePath(templatePath);
        templateConfig.setStaticPath(staticPath);
        return templateConfig;
    }

}