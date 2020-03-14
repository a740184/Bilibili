package com.gph.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gph.dao.VideoTypeMapper;
import com.gph.model.Video;
import com.gph.model.VideoType;
import com.gph.service.FileService;
import com.gph.service.VideoService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/")
public class ConManagerController {
    @Autowired
    private VideoService videoService;

    @Autowired
    private VideoTypeMapper videoTypeMapper;

    @Autowired
    private   FileService fileuploadFile;

    @RequestMapping("conMan")
    public String toConMan(Model model, @RequestParam(value="pageNum",defaultValue="1")int pageNum){
        PageHelper.startPage(pageNum,5);
       List<Video> videoList=videoService.selectVideoList();
        PageInfo pageInfo=new PageInfo(videoList,5);
        model.addAttribute("pageInfo",pageInfo);
        List<VideoType> videoTypes=videoTypeMapper.selectAll();
        model.addAttribute("videoTypes",videoTypes);
        return "/admin/con-manager";
    }

    @ResponseBody
    @GetMapping(value="queryVideo/{id}")
    public  Map<String,Object> queryVideo(@PathVariable("id") int id){
        Map<String,Object> maps=new HashMap<>();
        Video video = videoService.selectByPrimaryKey(id);
        if(video!=null){
            maps.put("result","success");
        }
        maps.put("video",video);
        return maps;
    }

    @RequestMapping(value = "video",method = RequestMethod.POST)
    public String putVideo(@RequestParam(value = "file",required = false) MultipartFile multipartFile, RedirectAttributes model, Video video, HttpServletRequest request, int pageNum){
        if(multipartFile!=null){
           fileuploadFile.fileuploadFile(multipartFile,request);
           if(multipartFile.getOriginalFilename()!=null&&!"".equals(multipartFile.getOriginalFilename()))
           video.setvImage(multipartFile.getOriginalFilename());
       }
        int i = videoService.updateByPrimaryKeySelective(video);
            if(i>0){
                model.addFlashAttribute("result","success");
            }else{
                model.addFlashAttribute("result","failed");
            }
        return "redirect:/admin/conMan?pageNum="+pageNum;
    }

    @RequestMapping(value = "delete/{id}/{pageNum}",method = RequestMethod.GET)
   public String deleteVideo(@PathVariable("id")int id,@PathVariable("pageNum") int pageNum,RedirectAttributes model){
        int i=videoService.deleteByPrimaryKey(id);
        if(i>0){
            model.addFlashAttribute("result","success");
        }else{
            model.addFlashAttribute("result","failed");
        }
        return "redirect:/admin/conMan?pageNum="+pageNum;
    }
}
