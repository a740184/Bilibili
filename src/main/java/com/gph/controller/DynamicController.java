package com.gph.controller;

import com.gph.dao.DyCommentMapper;
import com.gph.dao.DynamicMapper;
import com.gph.model.DyComment;
import com.gph.model.Dynamic;
import com.gph.model.Follow;
import com.gph.model.User;
import com.gph.service.*;
import com.gph.service.Impl.FileSerivceImpl;
import com.gph.util.CookieUtil;
import com.mysql.cj.Session;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DynamicController {

    @Autowired
    private UserSerivce userSerivce;
    @Autowired
    private FileService fileSerivce;
    @Autowired
    private DynamicService dynamicService;
    @Autowired
    private FollowService followService;
    @Autowired
    private DyCommentService dyCommentService;

    //动态页面
    @RequestMapping("toDynamic")
    public String toDynamic(HttpServletRequest request, Model model,@RequestParam(value="userid",required = false) Integer userid){
        User login_user=null;
        //获取用户信息
        System.out.println(userid);
        //是否传有userid
        if(userid!=null){
            login_user = userSerivce.selectByPrimaryKey(userid);
        }else{
            login_user=userSerivce.selectInfoByUserName(CookieUtil.getCookieName(request,"loginName"));
            if(login_user==null){
                userid=0;
            }else{userid=login_user.getUserid();}
        }

        //获取粉丝数
        List<User> fans_list=userSerivce.fans_list(userid);
        int fans_cout=fans_list.size();

        //获取关注总数
        List<User> follows=userSerivce.follow_list(userid);
        int follow_count=follows.size();

        //获取动态数
        List<Dynamic> dynamics=dynamicService.SelectAll();
        //查询该用户动态
        List<Dynamic> dynamics1=dynamicService.SelectDynamicById(userid);
        //当前用户关注集合
       List<Follow> follows1=followService.select_follow_id(userid);
       //评论数
        List<DyComment> dyComments=dyCommentService.selectDyCommentS();


//       for(Follow follow:follows1){
//           System.out.println("follow:"+follow.getFollowId());
//           if(follow.getFollowId()==userid){
//               model.addAttribute("isfollow","ok");
//           }
//       }


        model.addAttribute("u",login_user);
        model.addAttribute("fans_count",fans_cout);
        model.addAttribute("follow_count",follow_count);
        model.addAttribute("dynamic_count",dynamics1.size());
        model.addAttribute("dynamics",dynamics);
        model.addAttribute("follows",follows1);
        model.addAttribute("dyComment_count",dyComments.size());
        return "/dynamic";
    }

    //发布动态
    @RequestMapping("dynamic")
    public String insertDynamic(Dynamic dynamic, @RequestParam(value = "fileImg",required = false)MultipartFile[] multipartFiles,HttpServletRequest request,Model model){
        String imgName="";
        if(multipartFiles!=null) {
            for (int i = 0; i < multipartFiles.length; i++) {
                fileSerivce.fileuploadFile(multipartFiles[i], request);
                String name=multipartFiles[i].getOriginalFilename();
                if (i + 1 == multipartFiles.length) {
                    imgName += name;
                } else {
                    imgName += name + ";";
                }
            }
        }
            dynamic.setImage(imgName);
            int i= dynamicService.insertDynamic(dynamic);
            if(i>0){
                model.addAttribute("result","success");
            }else{
                model.addAttribute("result","failed");
            }
        return "redirect:toDynamic";
    }
    //获取评论
    @ResponseBody
    @RequestMapping("/querycomment")
    public List<DyComment> queryComment(Integer dy_id){
        List<DyComment> dyComments=dyCommentService.selectCommentByDyId(dy_id);
        return dyComments;
    }

    //关注
    @RequestMapping(value = "newfollow",method = RequestMethod.POST)
    @ResponseBody
    public String follow(@RequestParam("userid")Integer userid,@RequestParam("follow_id")Integer follow_id){
        int i=followService.follow_user(userid,follow_id);
        if(i>0){
            return "success";
        }
        return "failed";
    }

    //取消关注
    @RequestMapping(value = "removefollow",method = RequestMethod.POST)
    @ResponseBody
    public String cancelfollow(Integer userid,Integer follow_id){
        int i =followService.cancel_follow(userid,follow_id);
        if(i>0){
            return "success";
        }
        return "failed";
    }

    //发表评论
    @ResponseBody
    @RequestMapping("comment")
    public DyComment insetComment(DyComment comment,HttpServletRequest request){
        int i=dyCommentService.Insert(comment);
        DyComment dyComment=dyCommentService.selectCommentByCid(comment.getCid());
        return dyComment;
    }
    //是否关注
    @RequestMapping("followOrNot")
    @ResponseBody
    public String followOrNot(Integer userid,Integer follow_id){
        int i=followService.select_if_follow(userid,follow_id);
        System.out.println("userid:"+userid);
        System.out.println("follow_id:"+follow_id);
        if(i>0){
            return "yes";
        }
        return "no";
    }
}
