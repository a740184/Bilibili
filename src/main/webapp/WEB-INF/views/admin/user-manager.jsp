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
    <title>用户管理</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${webpath}/bootstrap/assets/css/lib/datatable/dataTables.bootstrap.min.css">
</head>
<body>
<%@ include file="leftAside.jsp"%>
    <div id="right-panel" class="right-panel">
     <%@ include file="header.jsp"%>
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>当前页面</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">用户管理</a></li>
                                    <li class="active"><a href="javascript:location.reload();" style="color: #03a9f3;">信息管理</a></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="animated fadeIn">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">用户信息</strong>
                                <form class="form-inline my-2 my-lg-12" style="padding-top: 15px;" action="${webpath}/admin/userSearch">
                                    <input class="form-control mr-lg-4" type="search" placeholder="请输入要搜索的用户信息" aria-label="Search" name="keyword">
                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
                                </form>
                            </div>
                            <div class="table-stats order-table ov-h">
                                <table class="table" style="table-layout: fixed">
                                    <thead>
                                        <tr>
                                            <th class="serial">#</th>
                                            <th>昵称</th>
                                            <th class="avatar">头像</th>
                                            <th>个性签名</th>
                                            <th>等级</th>
                                            <th>硬币</th>
                                            <th>经验</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.list}" var="user">
                                        <tr>
                                            <td class="serial">${user.userid}</td>
                                            <td>${user.username}</td>
                                            <td class="avatar">
                                                <div class="round-img">
                                                    <a href="#"><img class="rounded-circle" src="${webpath}/img/${user.headImg}" alt=""  height="50px"></a>
                                                </div>
                                            </td>
                                            <td>${user.content}</td>
                                            <td>${user.level}</td>
                                            <td>${user.coin}</td>
                                            <td>${user.exp}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div> <!-- /.table-stats -->
                        </div>
                    </div>
        </div>
<%--                分页--%>
                <div class="row">
                    <div class="col-md-6" >当前第${pageInfo.pageNum}页, 总共${pageInfo.pages}页, 共${pageInfo.total}条记录</span></div>
                    <div class="col-md-6" >
                        <nav aria-label="...">
                            <ul class="pagination">
                                <li><a href="${webpath}/admin/userMan?pageNum=1">首页</a></li>
                                <!-- 上页 -->
                                <c:if test="${pageInfo.hasPreviousPage}">
                                    <li>
                                        <a href="${webpath}/admin/userMan?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <!-- 页码 -->
                                <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">

                                    <c:if test="${page_Num==pageInfo.pageNum}">
                                        <li><a href="#" class="active" style="background-color: #337ab7;color:#fff;">${page_Num}</a></li>
                                    </c:if>
                                    <c:if test="${page_Num!=pageInfo.pageNum}">
                                        <li><a href="${webpath}/admin/userMan?pageNum=${page_Num}">${page_Num}</a></li>
                                    </c:if>
                                </c:forEach>
                                <!-- 下页 -->
                                <c:if test="${pageInfo.hasNextPage}">
                                    <li>
                                        <a href="${webpath}/admin/userMan?pageNum=${pageInfo.pageNum+1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <li><a href="${webpath}/admin/userMan?pageNum=${pageInfo.pages}">末页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
    </div><!-- .animated -->
</div><!-- .content -->

<div class="clearfix"></div>

<%@ include file="footer.jsp"%>

</div>
<% Object message=request.getAttribute("result");
    if(message!=null&&message=="success"){
%>
<script>
    showsuccess('');
</script>
<%}else if(message!=null&&message=="failed"){%>
<script>
    showfailed();
</script>
<%}%>
</body>
</html>
