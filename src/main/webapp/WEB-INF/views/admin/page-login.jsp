<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../base.jsp"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台登录</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style>
    /*input.error{border: 1px solid red;}*/
    label.error { color: red; }
</style>
<body class="bg-dark">

    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                    <a href="index.jsp">
                        <img class="align-content" src="${pageContext.request.contextPath}/bootstrap/images/logo.png" alt="">
                    </a>
                </div>
                <div class="login-form">
                    <form id="form">
                        <div class="form-group">
                            <label>用户名</label>
                            <input type="text" class="form-control" placeholder="请输入用户名" name="userName" id="userName" >
                            <p id="checkNamePwd"></p>
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input type="password" class="form-control" placeholder="请输入密码" name="password" id="password">
                        </div>
                        <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30" id="btn_sub">登录</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="${webpath}/bootstrap/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    jQuery(function ($) {

    $("#form").validate({
        onsubmit:true,// 是否在提交是验证
        onfocusout: function(element) {
            $(element).valid();
        },
        rules:{
            userName:{
                required:true
            },
            password:{
                required: true
            }
        },
        messages:{
            userName:{
                required:"*用户名不能为空",
            },
            password:{
                required:"*密码不能为空",
            }
        },submitHandler:function (form){
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/admin/login",
                data:$("#form").serialize(),
                dataType:"json",
                success:function (data) {
                    if("loginSuccess" == data.info)
                    {
                        window.location.href="/admin/index";
                    }
                    if("loginFailed" == data.info)
                    {
                        $(".form-group:first-child").append("<p id='checkNamePwd' style='color:red;'>用户名或密码错误！</p>");
                    }
                }
            })
        }
        })
        $("#userName").focus(function () {
            $("#userName-error").hide();
            $("#checkNamePwd").remove();
        })
        $("#password").focus(function () {
            $("#password-error").remove();
        })
    })
</script>
</html>
