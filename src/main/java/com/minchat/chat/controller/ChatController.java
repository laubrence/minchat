package com.minchat.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/chat/")
public class ChatController {

    /**
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("customer")
    public String customChat(HttpServletRequest request, Model model) {
        return "chat/customer";
    }

    @RequestMapping("guest")
    public String guestChat(HttpServletRequest request, Model model) {
        return "chat/guest";
    }
}
