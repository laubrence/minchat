package com.eric.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.eric.core.util.SystemInfoUtil;
import com.eric.core.util.UniqueIdUtil;


@Controller
@RequestMapping("/chat/")
public class ChatController {

	/**
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("customer")
	public String customChat(HttpServletRequest request,Model model){
	    return "chat/customer";       
	}
	
	@RequestMapping("guest")
	public String guestChat(HttpServletRequest request,Model model){
	    return "chat/guest";       
	}
}
