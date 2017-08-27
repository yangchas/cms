package com.rongtai.cms.common.enumeration;

import com.fasterxml.jackson.annotation.JsonValue;

/**
 * 状态 枚举
 */
public enum RoleTypeEnum {
    ADMIN("管理员"),
    SERVANT_SINGLE("单集公务员"),
    SERVANT_MULTI("多集公务员"),
    USER_SINGLE("单集用户"),
    USER_MULTI("多集用户");

    private String value;

    RoleTypeEnum(String value) {
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
