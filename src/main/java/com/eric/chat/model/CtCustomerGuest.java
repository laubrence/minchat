package com.eric.chat.model;

import java.util.Date;

public class CtCustomerGuest {
    private Long customerGuestId;

    private String cInboundId;

    private String gInboundId;

    private Long customerId;

    private Long userId;

    private Date createtime;

    public Long getCustomerGuestId() {
        return customerGuestId;
    }

    public void setCustomerGuestId(Long customerGuestId) {
        this.customerGuestId = customerGuestId;
    }

    public String getcInboundId() {
        return cInboundId;
    }

    public void setcInboundId(String cInboundId) {
        this.cInboundId = cInboundId == null ? null : cInboundId.trim();
    }

    public String getgInboundId() {
        return gInboundId;
    }

    public void setgInboundId(String gInboundId) {
        this.gInboundId = gInboundId == null ? null : gInboundId.trim();
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}