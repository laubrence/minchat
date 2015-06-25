package com.eric.chat.servlet;

import java.io.IOException;
import java.nio.CharBuffer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import com.eric.core.util.AppUtil;
import com.eric.sys.model.SysUser;
import com.eric.sys.service.SysUserService;

public class WebSocketMessageInboundPool {
	
	//保存连接的MAP容器
	private static final Map<String,WebSocketMessageInbound > connections = new HashMap<String,WebSocketMessageInbound>();
	
	//向连接池中添加连接
	public static void addMessageInbound(WebSocketMessageInbound inbound){
		//添加连接
		System.out.println("user : " + inbound.getInboundId() + " join..");
		connections.put(inbound.getInboundId(), inbound);
	}
	
	//获取所有的在线用户
	public static Set<String> getOnlineUser(){
		return connections.keySet();
	}
	
	public static void removeMessageInbound(WebSocketMessageInbound inbound){
		//移除连接
		System.out.println("user : " + inbound.getInboundId() + " exit..");
		connections.remove(inbound.getInboundId());
	}
	
	public static void sendMessageToInboundId(String inboundId,String message){
		try {
			//向特定的用户发送数据
			System.out.println("send message to inboundId : " + inboundId + " ,message content : " + message);
			WebSocketMessageInbound inbound = connections.get(inboundId);
			if(inbound != null){
				inbound.getWsOutbound().writeTextMessage(CharBuffer.wrap(message));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//向所有的用户发送消息
	public static void sendMessage(String message){
		try {
			Set<String> keySet = connections.keySet();
			for (String key : keySet) {
				WebSocketMessageInbound inbound = connections.get(key);
				if(inbound != null){
					System.out.println("send message to user : " + key + " ,message content : " + message);
					inbound.getWsOutbound().writeTextMessage(CharBuffer.wrap(message));
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//客服人员
	public static boolean isCustomer(String inboundId){
		WebSocketMessageInbound inbound = connections.get(inboundId);
		if(inbound!=null){
			if(inbound.getCuserId()!=null && !"".equals(inbound.getCuserId()) && !"null".equals(inbound.getCuserId())){
				return true;
			}
		}
		return false;
	}
	
	//系统用户
	public static boolean isGuestUser(String inboundId){
		WebSocketMessageInbound inbound = connections.get(inboundId);
		if(inbound!=null){
			if(inbound.getGuserId()!=null && !"".equals(inbound.getGuserId()) && !"null".equals(inbound.getGuserId())){
				return true;
			}
		}
		return false;
	}
	
	public static String getInboundCuserId(String inboundId){
		WebSocketMessageInbound inbound = connections.get(inboundId);
		if(inbound != null){
			return inbound.getCuserId();
		}
		return null;
	}
	
	public static String getInboundGuserId(String inboundId){
		WebSocketMessageInbound inbound = connections.get(inboundId);
		if(inbound != null){
			return inbound.getGuserId();
		}
		return null;
	}
	
	public static String getInboundGuestName(String inboundId){
		WebSocketMessageInbound inbound = connections.get(inboundId);
		if(inbound != null){
			return inbound.getGuestName();
		}
		return null;
	}
	
	public static String getCurrentTime(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		return df.format(new Date());
	}
}
