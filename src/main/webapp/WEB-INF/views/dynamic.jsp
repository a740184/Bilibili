<!DOCTYPE html>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="javafx.scene.control.Alert" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="webpath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
    <title>bilibili</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="../../bootstrap/js/jquery-1.9.1.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <link href="../../easyui/css/dynamic.css" rel="stylesheet" />
    <link href="../../easyui/css/blibili.css" rel="stylesheet" />
    <script type="text/javascript" src="../../easyui/js/bili.js"></script>
</head>
<style>
    #loading{
        width: 160px;
        height: 56px;
        position: absolute;
        top: 45%;
        left: 45%;
        line-height: 56px;
        color: #fff;
        padding-left: 60px;
        font-size: 15px;
        background: #000 url(../../easyui/img/loading.gif) no-repeat 10px 50%;
        opacity: 0.7;
        z-index: 9999;
        -moz-border-radius: 20px;
        -webkit-border-radius: 20px;
        border-radius: 20px;
        filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70);
    }
</style>
<body>
<!-- 等待中 -->
<div id="myModal" class="modal fade" data-keyboard="false"
     data-backdrop="static" data-role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div id="loading" class="loading">请求发送中...</div>
</div>
<%
    Cookie[] coooklist = request.getCookies();
    String str ="";
    if(coooklist.length>0&&coooklist!=null) {
        for (Cookie c : coooklist) {
            if (c.getName().equals("loginName")) {
                str = URLDecoder.decode(c.getValue(), "UTF-8");
                break;
            }
        }
    }
    request.setAttribute("myname",str);
%>
<nav  class="navbar navbar-default navbar-fixed-top" id="navs" style="opacity: 1;">
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-left">
            <li><div id="left_img"><img width="100%" src="../../easyui/img/tv_black.png"></div></li>
            <li><a href="/bilibili.do" ><i class="glyphicon glyphicon-home"></i>首页</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">

        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#" id="tg" data-toggle="modal" data-target="#ContributionModal" data-whatever="@mdo" >投稿</a></li>
        </ul>

        <!--用户信息显示栏-->
        <ul class="nav navbar-nav navbar-right">
            <li>
                <c:if test="${myname != null && myname!='' }">
                    <div id="head_imgs" onclick="window.location.href='userInfo.do?userid=${u.userid}' ">
                        <img width="100%" height="100%" src="${pageContext.request.contextPath}/img/${u.headImg}">
                    </div>
                </c:if>

                <c:if test="${myname=='' || myname==null}">
                    <div id="head_imgs">
                        <img width="100%" height="100%" src="../../easyui/img/tv_black.png">
                    </div>
                </c:if>

            </li>

            <li>
                <c:if test="${myname!='' && myname!=null}"><a href="/userInfo.do?userid=${u.userid}">${myname}</a></c:if>
                <c:if test="${myname=='' || myname==null}"><a>请登录</a></c:if>
            </li>

            <li>
                <c:if test="${myname=='' || myname==null}">
                    <button style="height: 52px;width:60px;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#LoginModal" data-whatever="@mdo">登录</button>
                </c:if>
                <c:if test="${myname!='' && myname!=null}">
                    <button style="height: 52px;width:60px;" type="button" class="btn btn-primary" onclick="window.location.href='exit_login.do'" >注销</button>
                </c:if>
            </li>
        </ul>
        <!--搜索栏-->
        <form class="navbar-form navbar-right">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-success"><i class="glyphicon glyphicon-search"></i>&nbsp;搜索</button>
        </form>

    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="content-page">
    <c:if test="${myname!=null&&myname!=''}">
        <div class="content-start">
            <div class="info">
                <div class="info_head">
                    <img src="${webpath}/easyui/img/info_head.png"/>
                </div>
                <div class="info_middle">
                    <img src="${webpath}/img/${u.headImg}" class="img-circle">
                    <a>${u.username}</a>
                </div>
                <div class="info_foot">
                    <ul>
                        <li>
                            <a href="${webpath}/userInfo.do?userid=${u.userid}"><span>${follow_count}</span></a>
                        </li>
                        <li>
                            <a href="${webpath}/userInfo.do?userid=${u.userid}"><span>${fans_count}</span></a>
                        </li>
                        <li>
                            <a href="${webpath}/userInfo.do?userid=${u.userid}"><span>${dynamic_count}</span></a>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <a href="${webpath}/userInfo.do?userid=${u.userid}">关注</a>
                        </li>
                        <li>
                            <a href="${webpath}/userInfo.do?userid=${u.userid}">粉丝</a>
                        </li>
                        <li>
                            <a href="${webpath}/userInfo.do?userid=${u.userid}">动态</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </c:if>
        <div class="content-middle">
            <c:if test="${myname!=null&&myname!=''}">
                <div class="dynamic">
                    <form action="${webpath}/dynamic" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="userid" value="${u.userid}"/>
                        <textarea class="form-control" rows="3" placeholder="有什么想和大家分享的？" name="content"></textarea>
                        <img src="${webpath}/easyui/img/pic_upload.svg" alt="" title="上传图片"
                             class="up_logo dropdown-toggle"
                             data-toggle="dropdown">
                        <div class="upload-box dropdown-menu">
                            <div class="up-title">
                                <span>图片上传</span><span>0&nbsp;/&nbsp;9</span>
                                <span id="close">×</span>
                            </div>
                            <div class="in_upload">
                                <div class="fileImg">
                                    <input type="file" id="u-file" multiple name="fileImg" accept=".jpg, .png, .jepg, .gif, .bmp, .svg" onchange="Imgupload(this);"
                                           title="添加图片"/>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="bf_btn">发布</button>
                    </form>
                </div>
            </c:if>
        <div class="content">
            <div class="head">
                <span>热门动态</span>
            </div>
            <c:forEach items="${dynamics}" var="dynamic">
            <div class="content-main">
                <div class="content-left">
                    <div class="head-img">
                        <a href="${webpath}/userInfo.do?userid=${u.userid}"><img src="${webpath}/img/${dynamic.user.headImg}" class="img-circle"></a>
                    </div>
                </div>
                <div class="content-right">
                    <div class="head-box" onmouseover="showfollow('${u.userid}','${dynamic.userid}','${dynamic.id}');" onmouseout="hidefollow('${dynamic.id}');">
                        <%-- 用户--%>
                        <div class="box">
                            <a class="title" href="${webpath}/userInfo.do?userid=${dynamic.userid}">${dynamic.user.username}</a>
                            <a class="time" href="${webpath}/userInfo.do?userid=${dynamic.userid}"><fmt:formatDate value="${dynamic.createtime}" pattern="MM-dd HH:mm"/></a>
                        </div>
                        <div class="box1">
                            <%--    关注--%>
                            <div class="follow">
                                <c:if test="${myname!=null&&myname!=''}">
                                    <a class="btn" onclick="addFollow('${u.userid}','${dynamic.userid}','${dynamic.id}');"   href="javascript:void(0);" style="display: none;" id="follow${dynamic.id}" >+&nbsp;关注</a>
                                    <a class="btn" onclick="canelFollow('${u.userid}','${dynamic.userid}','${dynamic.id}');" href="javascript:void(0);" style="display: none;width: 85px;"  id="follow-1${dynamic.id}" >+&nbsp;取消关注</a>
                                </c:if>
                                    <%--未登录--%>
                                <c:if test="${myname==null||myname==''}">
                                    <a class="btn" href="#" data-toggle="modal" data-target="#LoginModal">+&nbsp;关注</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <%--    内容--%>
                    <div class="text">
                        <a><p>${dynamic.content}</p></a>
                    </div>
                    <%--    图片--%>
                    <c:if test="${dynamic.image!=null}">
                            <div class="img">
                                <img src="${webpath}/img/${dynamic.image}"/>
                            </div>
                    </c:if>
                    <div class="bo_btn">
                            <%--                        //已登录--%>
                                <c:if test="${u.userid!=null}">
                                    <a href="javascript:void(0);" onclick="queryCom('${dynamic.id}');">
                                        <span><img src="${webpath}/easyui/img/pinglun.svg"
                                                   alt=""/>${dynamic.count}</span>
                                    </a>
                                    <a href="javascript:void(0);">
                                        <span><img src="${webpath}/easyui/img/dianzan.png"/>${dynamic.praise}</span>
                                    </a>
                                </c:if>
                                    <%--    未登录--%>
                                <c:if test="${u.userid==null}">
                                    <a href="#LoginModal" data-toggle="modal">
                                        <span><img src="${webpath}/easyui/img/pinglun.svg"
                                                   alt=""/>${dynamic.count}</span>
                                    </a>
                                    <a href="#LoginModal" data-toggle="modal">
                                        <span><img src="${webpath}/easyui/img/dianzan.png"/>${dynamic.praise}</span>
                                    </a>
                                </c:if>
                    </div>
                    <%--            评论区--%>
                    <div class="plBox comment-area${dynamic.id}">
                        <span class="plq">评论区</span>
                        <span class="hr"></span>
                        <img class="img-circle myImg" src="${pageContext.request.contextPath}/img/${u.headImg}">
                        <form class="form" onsubmit="Insertcomment();">
                            <input type="hidden" name="publicId" value="${u.userid}"/>
                            <input type="hidden" name="dyId" value="${dynamic.id}"/>
                            <textarea class="form-control" rows="3" name="comment"
                                      placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。"></textarea>
                            <button type="submit" class="btn btn-primary">发表评论</button>
                        </form>
                        <div class="content-area">
                        </div>
                    </div>
                    <hr>
                </div>
                <%--   end content-right--%>
            </div>
            </c:forEach>
        </div>
    </div>
        <div class="content-final">
            <c:if test="${myname == null||myname ==''}">
            <div class="login">
                <div class="img"><img src="${webpath}/easyui/img/right_login.png"></div>
                <div class="login_text"><span>属于你的新世界</span><span>赶快探索登陆吧！</span></div>
                <div class="button">
                    <a data-toggle="modal" data-target="#RegisterModal">注册</a>
                    <a href="#" data-toggle="modal" data-target="#LoginModal">登陆</a>
                </div>
            </div>
            </c:if>
            <div class="gg">
                <span>公告栏</span><img src="${webpath}/easyui/img/gg.jpg">
            </div>
        </div>
</div>
<%--登陆--%>
<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="LoginModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel"><i id="login_icon"></i>登录</h4>
            </div>
            <div class="modal-body">

                    <div class="form-group">

                        <label for="username" class="control-label">用户名</label>
                        <input type="text" class="form-control" id="username" name="username"  />
                        <span id="checkNamePwd"></span>
                    </div>

                    <div class="form-group">
                        <label for="pwd" class="control-label">密码</label>
                        <input class="form-control" id="pwd" type="password" name="password" />
                    </div>

                     <div class="modal-footer">
                        <button id="cancel" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary" id="register" >注册</button>
                        <button  class="btn btn-primary" onclick="login()">登录</button>
                    </div>
            </div>
        </div>
    </div>
</div>
<%--注册--%>
<div class="modal fade" id="RegisterModal" tabindex="-1" role="dialog" aria-labelledby="RegisterModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="RegisterModalLabel"><i id="register_icon"></i>注册</h4>
            </div>

            <div class="modal-body">
                <form action="register.do" method="post" enctype="multipart/form-data"><!-- 注册功能 -->
                    <div class="form-group">
                        <label for="setusername" class="control-label">设置你的用户名</label>
                        <input type="text" class="form-control"  id="setusername" name="username" onchange="ajaxValidate()" />
                        <span id="remind"></span>
                    </div>
                    <div class="form-group">
                        <label for="setpwd" class="control-label">设置你的密码</label>
                        <input class="form-control" id="setpwd" type="password" name="password" onchange="check_notnull()" />
                    </div>
                    <div class="form-group">
                        <label for="head_Img" class="control-label">请选择头像</label>
                        <input class="form-control" id="head_Img" type="file" name="headImg" onchange="check_notnull()"/>
                    </div>
                    <div class="form-group">
                        <label for="content_text" class="control-label">个性签名</label>
                        <textarea class="form-control" id="content_text" name="content"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button id="registerBtn" type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--投稿--%>
<div class="modal fade" id="ContributionModal" tabindex="-1" role="dialog" aria-labelledby="ContributionModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="ContributionModalLabel"><i id="Contribution_icon"></i>投稿</h4>
            </div>

            <form action="uploadvideo.do" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="vname" class="control-label">视频标题</label>
                        <input type="text" class="form-control" id="vname" name="vname" />
                    </div>

                    <div class="form-group">
                        <label for="vsrc" class="control-label">视频文件(.mp4)</label>
                        <input class="form-control"  type="file" id="vsrc" name="upfile"  multiple="multiple" />
                    </div>

                    <div class="form-group">
                        <label  class="control-label">请选择封面(.jpg/.png)</label>
                        <input class="form-control" type="file" name="upfile"  multiple="multiple" />
                    </div>

                    <div class="form-group">
                        <label class="control-label">视频类型</label>
                        <select class="form-control" name="typeId">
                            <c:forEach items="${types}" var="t">
                                <option value="${t.typeId}">${t.typename}</option>
                            </c:forEach>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" >上传</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="myAlert1" class="modal fade" tabindex="-1" role="dialog"  aria-labelledby="ModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="ModalLabel1"><img src="${webpath}/bootstrap/images/chenggong.png" width="20px" height="20px" style="display:inline-block;margin-right: 5px;vertical-align: middle;" alt=""/>成功提示</h4></div>
            <div class="modal-body" style="height:60px;">
                <span id="word"><strong>请求提交成功！</strong></span>3秒后自动关闭...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div></div>
</div>
<!-- 提交失败提示 -->
<div id="myAlert2" class="modal fade" tabindex="-1" role="dialog"  aria-labelledby="myModalLabe2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="ModalLabel2"><img src="${webpath}/bootstrap/images/shibai.png" width="20px" height="20px" style="display:inline-block;margin-right: 5px;vertical-align: middle;"/>失败提示</h4>
            </div>
            <div class="modal-body"  style="font-size: 20px;height:60px;">
                <span id="errorword"><strong><span style="color: #D9534F; ">请求提交失败！请重新检查信息或检查网络！</span></strong></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div></div>
</div>
<button style="display:none;" id="toRegister" data-toggle="modal" data-target="#RegisterModal" data-whatever="@mdo"></button>


<% Object message=request.getAttribute("result");
    if(message!=null&&message=="success"){
%>
<script>
    //不做处理
</script>
<%}else if(message!=null&&message=="failed"){%>
<script>
    showfailed();
</script>
<%}%>
</body>
<script type="text/javascript">
    function ajaxValidate() {

        var username=$("#setusername").val();

        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/checkUserName.do",//提交地址
            data:"username="+username,//提交数据
            dataType:"json",//返回json格式
            //contentType:"application/json;charset=utf-8",

            success:function(data){

                if ("no" == data.info) {//后端传来的msg的值是no,不能注册。反之。
                    $("#remind").html("<b style='color:red'>该用户名被注册，请更换！</b>");
                    $("#registerBtn").attr("disabled","disabled");

                }if("yes" == data.info){
                    $("#remind").html("<b style='color: green;'>该用户名可用</b>");//如果没有被注册，将提示语清空。
                }
            }
        });
    }
    
    function check_notnull() {
        var username=$("#setusername").val();
        var pwd = $("#setpwd").val();
        var headImg = $("#head_Img").val();
        if(username=="" || username==null || pwd=="" || pwd==null || headImg=="" || headImg==null)
        {
            $("#registerBtn").attr("disabled","disabled");
        }
        else
        {
            $("#registerBtn").removeAttr("disabled");
        }
    }
    
    
    function login() {
        var loginName = $("#username").val();
        var loginPwd = $("#pwd").val();
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/login.do",
            data:"username="+loginName+"&password="+loginPwd,
            dataType:"json",
            success:function (data) {
                if("loginSuccess" == data.info)
                {
                    // alert("登录成功");
                    window.location="${webpath}/toDynamic";
                }
                if("loginFailed" == data.info)
                {
                    $("#checkNamePwd").html("<b style='color:red;'>用户名或密码错误！</b>");
                }
            }
        });
    }


    var vid = $("#now_vid").val();
    var userid = $("#now_userid").val();
    //取消点赞
    function Cancel_praise(obj) {
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/cancel_praise.do",
            data:"vid="+vid+"&userid="+userid,
            dataType:"json",
            success:function (data) {
                if("no" == data.info)
                {
                    alert("取消点赞失败");
                }
                else
                {
                    $(obj).attr("onclick","Praise(this)");
                    $(obj).html("<i id='not_dianzan'></i><span>"+(data.info)+"</span>");
                }
            }

        });
    }

    //点赞
    function Praise(obj) {
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/praise.do",
            data:"vid="+vid+"&userid="+userid,
            dataType:"json",
            success:function (data) {
                if("no" == data.info)
                {
                    alert("点赞失败");
                }
                else
                {
                    $(obj).attr("onclick","Cancel_praise(this)");
                    $(obj).html("<i id='dianzaned'></i><span>"+(data.info)+"</span>");
                }
            }
        });
    }

    //图片上传
    function Imgupload(obj) {
        var len=obj.files.length;
        var str="";
        for(var i=0;i<len;i++) {
            var imgFile = obj.files[i];
            var fr = new FileReader();
            fr.readAsDataURL(imgFile);
            fr.onload = function (e) {
                str="<img  src='"+e.target.result+"' style='width: 80px;height: 80px;display: inline-block;margin-left: 10px;margin-bottom: 10px'/>";
                //  document.getElementById('vImage').src = fr.result;
                $(".fileImg").before(str);
            };
        }
        $(".up-title span:nth-child(2)").html(len+"&nbsp;/&nbsp;9");
    }
    //阻止点击空白地方 上传图片框关闭
    $('.dropdown-menu').click(function(e) {
        e.stopPropagation();
    });

    //关闭按钮
    $(".up-title #close").on("click",function () {
        $(".dynamic form").removeClass("open");
    })

    //获取评论

function queryCom(dy_id) {
        $(".comment-area"+dy_id).slideToggle(1,function () {
            if($(this).is(":visible")){
                $.ajax({
                    async:true,
                    type:"post",
                    dataType:"json",
                    data:{"dy_id":dy_id},
                    url:"${webpath}/querycomment",
                    beforeSend:function(){
                    },
                    complete:function(){
                        // hidewait();
                    },
                    success:function (data) {
                        var str="";
                        if(data!=null){
                            for (var i=0;i<data.length;i++){
                                var year=new Date(data[i].createtime).getFullYear();
                                var mon=new Date(data[i].createtime).getMonth()+1;
                                var day=new Date(data[i].createtime).getDate();
                                var time=new Date(data[i].createtime).getTime();
                                var hou=new Date(data[i].createtime).getHours();
                                var min=new Date(data[i].createtime).getMinutes();
                                if(min<10){
                                    min="0"+min;
                                }
                                var datetime=year+"-"+mon+"-"+day+"&nbsp;"+hou+":"+min;
                                str+="<div class='right-box'><img class='img-circle conImg' src='${webpath}/img/"+data[i].publisher.headImg+"'/>"+
                                    "<a class='username'>"+data[i].publisher.username+"</a>"+
                                    "<span class='cntext'>"+data[i].comment+"</span>"+
                                    "<span class='timeText'>"+datetime+"</span></div>";
                            }
                            $(".content-area").html(str);
                        }
                    },error:function () {
                        showfailed();
                    }
                })
            }
        })
}

//评论
function Insertcomment() {
    $.ajax({
        async:true,
        type:"post",
        url:"${webpath}/comment",
        dataType:"json",
        data:$(".form").serialize(),
        beforeSend:function(){
            showwait();
        },
        success:function (data) {
                if(data.length>0){
                        var str="<img class='img-circle conImg' src='${webpath}/img/"+data.publisher.headImg+"'/>"+
                            "<a class='username'>"+dat.publisher.username+"</a>"+
                            "<span class='cntext'>"+data.comment+"</span>"+
                            "<span class='timeText'>"+data.createtime+"</span>";
                    $(".content-area").html(str);
                }
            $(".plBox").show();
                hidewait();
        },error:function () {
        showfailed();
        }
    })
}

//显示关注按钮
    function showfollow(userid, follow_id,dy_id) {
        //不是自己写的动态
        if(userid!=follow_id){
        $.post("${webpath}/followOrNot", {"userid": userid, "follow_id": follow_id}, function (data) {
            if (data == "yes") {
                //已关注显示取消按钮
                $("#follow-1"+dy_id).css("display","block");
            }else{
                //未关注显示关注按钮
                $("#follow"+dy_id).css("display","block");
            }
        })
        }
    }

    function hidefollow(id) {
        $("#follow-1"+id).css("display", "none");
        $("#follow"+id).css("display", "none");
    }

    //添加关注
    function addFollow(userid, follow_id,dy_id) {
        $.post("${webpath}/newfollow", {"userid": userid, "follow_id": follow_id}, function (data) {
            if (data == "success") {
                $("#follow" + dy_id).css("display", "none");
                $("#follow-1" + dy_id).css("display", "block");
                showsuccess("关注成功！");
            } else {
                alert("关注失败！");
            }
        })
    }

    // 取消关注
    function canelFollow(userid, follow_id, dy_id) {
        $.post("${webpath}/removefollow", {"userid": userid, "follow_id": follow_id}, function (data) {
            if (data == "success") {
                $("#follow" + dy_id).css("display", "block");
                $("#follow-1" + dy_id).css("display", "none");
                showsuccess("取消关注成功！");
            } else {
                alert("取消关注失败！");
            }

        })
}



    function showwait(){
        $('#myModal').modal('show');
    }
    function hidewait(){
        $('#myModal').modal('hide');
    }
    function showsuccess(words) {
        var w=document.getElementById("word");
        w.innerText="";
        w.innerText=words;
        $("#myAlert1").modal('show');
        setTimeout(function(){
            $("#myAlert1").modal('hide');
        },1500);
    }
    function showfailed() {
        $("#myAlert2").modal('show');
    }

    //读取动态图片
    window.onload=function () {
        //获取class名字为img的数组
        var name_img=document.querySelectorAll(".content-right .img");
        //遍历img数组
        for(var i=0;i<name_img.length;i++){
            document.querySelectorAll(".content-right .img")[i].setAttribute("id","myImg"+i);
            //获取class为img下的img元素图片路径
            var path=document.querySelectorAll(".content-right .img")[i].getElementsByTagName("img")[0].src;
            //console.log(path);
            //截取图片路径
            var b=path.substring(26);
            console.log(b);
            //分割
            var imgPath=b.split(";");
            //遍历分割出来img路径
            var str="";
            for(var j=0;j<imgPath.length;j++){
                str += "<img src='${webpath}/img/"+imgPath[j]+"'/>";
                //获取当前img下标后入新的img元素
                $("#myImg"+i).html(str);
            }
            if(imgPath.length>1){
                $("#myImg"+i+" img").css("width","104px").css("height","104px");
            }
        }
    }
</script>


</html>
