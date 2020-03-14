package com.gph.controller;

import com.gph.model.Admin;
import com.gph.service.Impl.AdminServiceImpl;
import com.gph.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminServiceImpl adminService;
    private CookieUtil cookieUtil = new CookieUtil();

    @RequestMapping("")
    public String toLogin(){
        return "/admin/page-login";
    }
    @ResponseBody
@RequestMapping("/login")
    public Map<String,Object> admin_login(HttpServletResponse response, String userName, String password) throws UnsupportedEncodingException {
    Admin admin = adminService.login(userName, password);
    Map<String, Object> map = new HashMap();
    if (admin != null) {
        Cookie cookie = new Cookie("admin_cookie", URLEncoder.encode(userName,"UTF-8"));
        cookie.setMaxAge(-1);
        cookie.setPath("/");
        response.addCookie(cookie);
        map.put("info","loginSuccess");
    }else{
        map.put("info","loginFailed");
    }
    return map;
    }

@RequestMapping("/index")
    public String toIndex( HttpServletRequest request, HttpSession session){
       Admin admin= adminService.selectInfoByAdminName(cookieUtil.getCookieName(request,"admin_cookie"));
        session.setAttribute("admin",admin);
        return "/admin/index";
}
}
