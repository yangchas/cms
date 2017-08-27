package com.rongtai.cms.common.enumeration;

import com.fasterxml.jackson.annotation.JsonValue;

/**
 * 状态 枚举
 */
public enum StatusEnum {
    REGISTER("审核中"),
    ENABLE("启用"),
    DISABLE("禁用");

    private String value;

    StatusEnum(String value) {
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
