package com.minchat.chat.model;

import java.util.Date;

public class CtOnlineCustomer {
    private Long customerId;

    private String inboundId;

    private Long userId;

    private String sessionId;

    private String remark;

    private Date createtime;

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getInboundId() {
        return inboundId;
    }

    public void setInboundId(String inboundId) {
        this.inboundId = inboundId == null ? null : inboundId.trim();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId == null ? null : sessionId.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}