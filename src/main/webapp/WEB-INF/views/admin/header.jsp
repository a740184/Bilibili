<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .modal-backdrop{z-index:99;}
    .bg-primary {
        background-color: #007bff!important;
    }
    .navbar .navbar-nav li.menu-item-has-children .sub-menu{
        display: none;
    }
</style>
<header id="header" class="header" style="z-index: 98">
    <div class="top-left">
        <div class="navbar-header">
            <a class="navbar-brand" href="./"><img src="${pageContext.request.contextPath}/bootstrap/images/logo.png" alt="Logo"></a>
            <a class="navbar-brand hidden" href="./"><img src="${pageContext.request.contextPath}/bootstrap/images/logo2.png" alt="Logo"></a>
            <%--                <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>--%>
        </div>
    </div>
    <div class="top-right">
        <div class="header-menu">
            <div class="header-left" style="line-height: 55px;">
                <button class="search-trigger"><i class="fa fa-search"></i></button>
                <div class="form-inline">
                    <form class="search-form">
                        <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                        <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                    </form>
                </div>
                <div class="dropdown for-notification">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-bell"></i>
                        <span class="count bg-danger">3</span>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="notification">
                        <p class="red">You have 3 Notification</p>
                        <a class="dropdown-item media" href="#">
                            <i class="fa fa-check"></i>
                            <p>Server #1 overloaded.</p>
                        </a>
                    </div>
                </div>

                <div class="dropdown for-message">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="message" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-envelope"></i>
                        <span class="count bg-primary">4</span>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="message">
                        <p class="red">You have 4 Mails</p>
                        <a class="dropdown-item media" href="#">
                            <span class="photo media-left"><img alt="avatar" src="${pageContext.request.contextPath}/bootstrap/images/avatar/1.jpg"></span>
                            <div class="message media-body">
                                <span class="name float-left">Jonathan Smith</span>
                                <span class="time float-right">Just now</span>
                                <p>Hello, this is an example msg</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="user-area dropdown float-right">
                <a href="#" class="dropdown-toggle active" data-toggle="modal" data-target="#add-category">
                    <img class="user-avatar img-circle" src="${webpath}/img/${admin.img}">
                </a>
            </div>

        </div>
    </div>
</header>
<div class="modal fade none-border" id="add-category">
    <div class="modal-dialog" style="z-index: 1060;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><strong>管理员信息</strong></h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label class="control-label">用户名</label>
                        <input class="form-control form-white" type="text" name="userName" value="${admin.userName}" readonly/>
                    </div>
                    <div class="form-group">
                        <img src="${pageContext.request.contextPath}/img/${admin.img}" width="100px" height="100px"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">当前密码</label>
                        <input class="form-control form-white" type="text" name="password" placeholder="请输入当前密码"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">新密码</label>
                        <input class="form-control form-white" type="text" name="password" placeholder="请输入新密码"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">确认密码</label>
                        <input class="form-control form-white" type="text" name="password" placeholder="请确认新密码"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">保存</button>
            </div>
        </div>
    </div>
</div>