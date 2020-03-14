package com.gph.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gph.model.User;
import com.gph.service.UserSerivce;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class UserManagerController {
    @Autowired
    private  UserSerivce userSerivce;

    @RequestMapping("/userMan")
    public String toUserManger(Model model, @RequestParam(value="pageNum",defaultValue="1")int pageNum){
        PageHelper.startPage(pageNum,2);
        List<User> users=userSerivce.showUsers();
        PageInfo pageInfo=new PageInfo(users,5);
        model.addAttribute("pageInfo",pageInfo);
        return "/admin/user-manager";
    }

    @RequestMapping("/userSearch")
    public String LikeSearch(Model model,@RequestParam("keyword") String keyword,@RequestParam(value="pageNum",defaultValue="1")int pageNum){
        PageHelper.startPage(pageNum,5);
        List<User> users=userSerivce.LikeSearch(keyword);
        PageInfo pageInfo=new PageInfo(users,5);
        model.addAttribute("pageInfo",pageInfo);
        return "/admin/user-manager";
    }
}
