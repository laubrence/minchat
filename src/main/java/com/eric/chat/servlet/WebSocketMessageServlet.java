package com.eric.chat.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;

@WebServlet(urlPatterns = { "/message"})
//如果要接收浏览器的ws://协议的请求就必须实现WebSocketServlet这个类
public class WebSocketMessageServlet extends WebSocketServlet {
	
	private static final long serialVersionUID = 1L;

	public String getCUserId(HttpServletRequest request){
		if(request.getParameter("usertype")!=null && "customer".equals(String.valueOf(request.getParameter("usertype")))){
			if(request.getSession().getAttribute("userId")!=null){
				return  String.valueOf(request.getSession().getAttribute("userId"));
			}
		}
		return null;
	}
	
	public String getGUserId(HttpServletRequest request){
		if(request.getParameter("guserId")!=null ){
			return  String.valueOf(request.getParameter("guserId"));
		}
		return null;
	}
	
	public String getSessionId(HttpServletRequest request){
		if(request.getSession().getId()!=null){
			return  String.valueOf(request.getSession().getId());
		}
		return null;
	}
	
	//跟平常Servlet不同的是，需要实现createWebSocketInbound，在这里初始化自定义的WebSocket连接对象
    @Override
    protected StreamInbound createWebSocketInbound(String subProtocol,HttpServletRequest request) {
        return new WebSocketMessageInbound(this.getCUserId(request),this.getGUserId(request),this.getSessionId(request));
    }
}
