package com.minchat.chat.dao;

import com.minchat.chat.model.CtCustomerGuest;


public interface CtCustomerGuestDao {
    int deleteByPrimaryKey(Long customerGuestId);

    int insert(CtCustomerGuest record);

    int insertSelective(CtCustomerGuest record);

    CtCustomerGuest selectByPrimaryKey(Long customerGuestId);

    int updateByPrimaryKeySelective(CtCustomerGuest record);

    int updateByPrimaryKey(CtCustomerGuest record);

    CtCustomerGuest selectBygInboundId(String gInboundId);

    int deleteByGinboundId(String gInboundId);

    int deleteByCinboundId(String cInboundId);
}