package com.eric.chat.dao;

import java.util.List;

import com.eric.chat.model.CtOnlineGuest;

public interface CtOnlineGuestDao {
    int deleteByPrimaryKey(Long guestId);

    int insert(CtOnlineGuest record);

    int insertSelective(CtOnlineGuest record);

    CtOnlineGuest selectByPrimaryKey(Long guestId);

    int updateByPrimaryKeySelective(CtOnlineGuest record);

    int updateByPrimaryKey(CtOnlineGuest record);
    
    List<CtOnlineGuest> selectAll();
    
    int deleteByInboundId(String inboundId);
}