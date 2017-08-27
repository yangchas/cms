package com.rongtai.cms.common.enumeration;

import com.fasterxml.jackson.annotation.JsonValue;

/**
 * 系统数据 枚举
 */
public enum ArticleReleaseEnum {
    YES("设置"),
    NO("不设置");

    private String value;

    ArticleReleaseEnum(String value) {
        this.value = value;
    }

    /**
     * 获取显示的名字
     *
     * @return
     */
    @JsonValue
    public String getValue() {
        return this.value;
    }

    @Override
    public String toString() {
        return this.value;
    }
}
