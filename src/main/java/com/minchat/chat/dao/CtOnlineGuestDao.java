package com.minchat.chat.dao;

import com.minchat.chat.model.CtOnlineGuest;

import java.util.List;

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