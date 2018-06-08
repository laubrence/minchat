package com.minchat.chat.service;

import com.minchat.chat.model.CtCustomerGuest;
import com.minchat.chat.model.CtOnlineCustomer;
import com.minchat.chat.model.CtOnlineGuest;

import java.util.List;

public interface ChatService {
    public int addOnlineCustomer(String inboundId, String userId);

    public int addOnlineGuest(String inboundId, String guestName);

    public int addOnlineGuestUser(String inboundId, String guestName);

    public int addCustomerGuest(String cInboundId, String gInboundId);

    public List<CtOnlineGuest> getOnlineGuestList();

    public List<CtOnlineCustomer> getOnlineCustomerList();

    public CtOnlineCustomer getCustomerRandOne();

    public CtCustomerGuest selectCusGusBygInboundId(String gInboundId);

    public int delCustomerByInboundId(String inboundId);

    public int delGuestByInboundId(String inboundId);

    int delCusGusByGinboundId(String gInboundId);

    int delCusGusByCinboundId(String cInboundId);

    public int addCtUserMsg(int sendType, String sendUser, String receiveUser, String msg);
}
