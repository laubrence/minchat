package com.minchat.chat.service.impl;

import com.minchat.chat.dao.CtCustomerGuestDao;
import com.minchat.chat.dao.CtOnlineCustomerDao;
import com.minchat.chat.dao.CtOnlineGuestDao;
import com.minchat.chat.dao.CtUserMsgDao;
import com.minchat.chat.model.CtCustomerGuest;
import com.minchat.chat.model.CtOnlineCustomer;
import com.minchat.chat.model.CtOnlineGuest;
import com.minchat.chat.model.CtUserMsg;
import com.minchat.chat.service.ChatService;
import com.minchat.core.util.UniqueIdUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ChatServiceImpl implements ChatService {

    private static final Logger logger = LoggerFactory.getLogger(ChatServiceImpl.class);

    @Resource
    private CtOnlineCustomerDao ctOnlineCustomerDao;
    @Resource
    private CtOnlineGuestDao ctOnlineGuestDao;
    @Resource
    private CtCustomerGuestDao ctCustomerGuestDao;
    @Resource
    private CtUserMsgDao ctUserMsgDao;

    public int addOnlineCustomer(String inboundId, String userId) {
        CtOnlineCustomer ctOnlineCustomer = new CtOnlineCustomer();
        ctOnlineCustomer.setCustomerId(UniqueIdUtil.genId());
        ctOnlineCustomer.setInboundId(inboundId);
        ctOnlineCustomer.setUserId(Long.valueOf(userId));
        ctOnlineCustomer.setCreatetime(new Date());
        return ctOnlineCustomerDao.insert(ctOnlineCustomer);
    }

    public int addOnlineGuest(String inboundId, String guestName) {
        CtOnlineGuest ctOnlineGuest = new CtOnlineGuest();
        ctOnlineGuest.setGuestId(UniqueIdUtil.genId());
        ctOnlineGuest.setInboundId(inboundId);
        ctOnlineGuest.setUserName(guestName);
        ctOnlineGuest.setCreatetime(new Date());
        return ctOnlineGuestDao.insert(ctOnlineGuest);
    }

    public int addOnlineGuestUser(String inboundId, String guserId) {
        CtOnlineGuest ctOnlineGuest = new CtOnlineGuest();
        ctOnlineGuest.setGuestId(UniqueIdUtil.genId());
        ctOnlineGuest.setInboundId(inboundId);
        ctOnlineGuest.setUserId(Long.valueOf(guserId));
        ctOnlineGuest.setCreatetime(new Date());
        return ctOnlineGuestDao.insert(ctOnlineGuest);
    }

    public List<CtOnlineGuest> getOnlineGuestList() {
        return ctOnlineGuestDao.selectAll();
    }

    public List<CtOnlineCustomer> getOnlineCustomerList() {
        return ctOnlineCustomerDao.selectAll();
    }

    public int addCustomerGuest(String cInboundId, String gInboundId) {
        CtCustomerGuest ctCustomerGuest = new CtCustomerGuest();
        ctCustomerGuest.setCustomerGuestId(UniqueIdUtil.genId());
        ctCustomerGuest.setcInboundId(cInboundId);
        ctCustomerGuest.setgInboundId(gInboundId);
        ctCustomerGuest.setCreatetime(new Date());
        return ctCustomerGuestDao.insert(ctCustomerGuest);
    }

    public CtOnlineCustomer getCustomerRandOne() {
        return ctOnlineCustomerDao.getCustomerRandOne();
    }

    public CtCustomerGuest selectCusGusBygInboundId(String gInboundId) {
        return ctCustomerGuestDao.selectBygInboundId(gInboundId);
    }

    public int delCustomerByInboundId(String inboundId) {
        return ctOnlineCustomerDao.deleteByInboundId(inboundId);
    }

    public int delCusGusByGinboundId(String gInboundId) {
        return ctCustomerGuestDao.deleteByGinboundId(gInboundId);
    }

    public int delCusGusByCinboundId(String cInboundId) {
        return ctCustomerGuestDao.deleteByCinboundId(cInboundId);
    }

    public int delGuestByInboundId(String inboundId) {
        return ctOnlineGuestDao.deleteByInboundId(inboundId);
    }

    public int addCtUserMsg(int sendType, String sendUser, String receiveUser, String msg) {
        CtUserMsg ctUserMsg = new CtUserMsg();
        ctUserMsg.setMsgId(UniqueIdUtil.genId());
        ctUserMsg.setSendType(sendType);
        ctUserMsg.setSendUser(sendUser);
        ctUserMsg.setReceiveUser(receiveUser);
        ctUserMsg.setChatMsg(msg);
        ctUserMsg.setCreatetime(new Date());
        return ctUserMsgDao.insert(ctUserMsg);
    }
}
