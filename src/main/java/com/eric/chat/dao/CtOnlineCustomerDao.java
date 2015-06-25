package com.eric.chat.dao;

import java.util.List;

import com.eric.chat.model.CtOnlineCustomer;

public interface CtOnlineCustomerDao {
    int deleteByPrimaryKey(Long customerId);

    int insert(CtOnlineCustomer record);

    int insertSelective(CtOnlineCustomer record);

    CtOnlineCustomer selectByPrimaryKey(Long customerId);

    int updateByPrimaryKeySelective(CtOnlineCustomer record);

    int updateByPrimaryKey(CtOnlineCustomer record);

	List<CtOnlineCustomer> selectAll();

	CtOnlineCustomer getCustomerRandOne();
	
	//根据inboundId删除在线客服人员
	int deleteByInboundId(String inboundId);
}