package com.rongtai.cms;

/**
 * 消息
 * 
 * @author rongtai
 * @version 1.0
 */
public class Message {

	/**
	 * 类型
	 */
	public enum Type {

		/** 成功 */
		success,

        /** 信息 */
        info,

		/** 警告 */
        warning,

		/** 错误 */
        error
	}

	/** 类型 */
	private Type type;

    /** 提示信息 */
    private String message;

	/** 内容 */
	private Object content;

	/**
	 * 构造方法
	 */
	public Message() {
	}

    /**
     * 构造方法
     *
     * @param type 类型
     *
     * @param message 提示信息
     *
     * @param content 内容
     */
    public Message(Type type, String message, Object content) {
        this.type = type;
        this.message = message;
        this.content = content;
    }

    /**
     * 返回成功消息
     *
     * @param message 提示信息
     *
     * @param content 内容
     * @return
     */
	public static Message success(String message, Object content) {
		return new Message(Type.success, message, content);
	}

    /**
     * 返回信息消息
     *
     * @param message 提示信息
     *
     * @param content 内容
     * @return 警告消息
     */
    public static Message info(String message, Object content) {
        return new Message(Type.info, message, content);
    }

	/**
	 * 返回警告消息
     *
     * @param message 提示信息
     *
     * @param content 内容
	 * @return 警告消息
	 */
	public static Message warn(String message, Object content) {
		return new Message(Type.warning, message, content);
	}

	/**
	 * 返回错误消息
     *
     * @param message 提示信息
     *
     * @param content 内容
	 * @return 错误消息
	 */
	public static Message error(String message, Object content) {
		return new Message(Type.error, message, content);
	}

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getContent() {
        return content;
    }

    public void setContent(Object content) {
        this.content = content;
    }
}