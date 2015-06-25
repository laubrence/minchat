package com.eric.chat.dao;

import com.eric.chat.model.CtUserMsg;

public interface CtUserMsgDao {
    int deleteByPrimaryKey(Long msgId);

    int insert(CtUserMsg record);

    int insertSelective(CtUserMsg record);

    CtUserMsg selectByPrimaryKey(Long msgId);

    int updateByPrimaryKeySelective(CtUserMsg record);

    int updateByPrimaryKeyWithBLOBs(CtUserMsg record);

    int updateByPrimaryKey(CtUserMsg record);
}