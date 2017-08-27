package com.rongtai.cms.common.enumeration;

import com.fasterxml.jackson.annotation.JsonValue;

/**
 * 导航位置枚举
 */
public enum NavLocationEnum {
    HEADER("顶部导航"),
    FOOTER("底部导航");

    private String value;

    NavLocationEnum(String value) {
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
