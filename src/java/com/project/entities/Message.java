package com.project.entities;

public class Message {

    private String msg;
    private String msgType;
    private String cssClass;

    public Message(String msg, String msgType, String cssClass) {
        this.msg = msg;
        this.msgType = msgType;
        this.cssClass = cssClass;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getMsgType() {
        return msgType;
    }

    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }
}
