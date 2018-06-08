package com.minchat.sys.controller;

import com.minchat.sys.model.SysUser;
import com.minchat.sys.service.SysUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/user")
public class SysUserController {
    @Resource
    private SysUserService userService;

    @RequestMapping("/showUser3")
    public String showUser1(HttpServletRequest request, Model model) {
        SysUser sysUser = userService.getUserById(1L);
        model.addAttribute("user", sysUser);
        return "showUser3";
    }

    @RequestMapping("/showUser4")
    public String showUser2(HttpServletRequest request, Model model) {
        return "showUser4";
    }
}
