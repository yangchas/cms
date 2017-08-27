package com.rongtai.cms.common.enumeration;

/**
 * 删除标记 枚举
 */
public enum DeleteFlagEnum {
    NOT_DELETE("未删除"),
    DELETED("标记删除");

    private String value;

    DeleteFlagEnum(String value) {
        this.value = value;
    }

    /**
     * 获取显示的名字
     *
     * @return
     */
    public String getValue() {
        return this.value;
    }

    @Override
    public String toString() {
        return this.value;
    }
}
