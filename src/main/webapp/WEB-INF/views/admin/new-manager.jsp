<%@ page import="java.net.URLDecoder" %>
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
    <title>新闻管理</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style>
    .open .sub-menu .subtitle{
        display: none;
    }
</style>
<body>
    <!-- Left Panel -->
<%@ include file="leftAside.jsp"%>
    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <%@ include file="header.jsp"%>
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Dashboard</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">Dashboard</a></li>
                                    <li><a href="#">Table</a></li>
                                    <li class="active">Data table</li>
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

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">新闻信息表</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Salary</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>3333</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>$320,800</td>
                                        </tr>
                                        <tr>
                                            <td>444</td>
                                            <td>gg</td>
                                            <td>Edinburgh</td>
                                            <td>$320,800</td>
                                        </tr>
                                        <tr>
                                            <td>nxr</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>5280</td>
                                        </tr>
                                        <tr>
                                            <td>nxr</td>
                                            <td>System Architect</td>
                                            <td>ttyuu</td>
                                            <td>5280</td>
                                        </tr>
                                        <tr>
                                            <td>nxr</td>
                                            <td>System Architect</td>
                                            <td>asdf</td>
                                            <td>5280</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!-- 显示分页 -->
                                <div class="row">
                                    <div class="col-md-6" >当前第${pageInfo.pageNum}页, 总共${pageInfo.pages}页, 共${pageInfo.total}条记录</span></div>
                                    <div class="col-md-6" >
                                        <nav aria-label="Page navigation">
                                            <ul class="pagination">
                                                <li><a href="${webpath}/maintainer/queryforRes?pn=1">首页</a></li>
                                                <!-- 上页 -->
                                                <c:if test="${pageInfo.hasPreviousPage}">
                                                    <li>
                                                        <a href="${webpath}/maintainer/queryforRes?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <!-- 页码 -->
                                                <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">

                                                    <c:if test="${page_Num==pageInfo.pageNum}">
                                                        <li><a href="#" class="active">${page_Num}</a></li>
                                                    </c:if>
                                                    <c:if test="${page_Num!=pageInfo.pageNum}">
                                                        <li><a href="${webpath}/maintainer/queryforRes?pn=${page_Num}">${page_Num}</a></li>
                                                    </c:if>
                                                </c:forEach>
                                                <!-- 下页 -->
                                                <c:if test="${pageInfo.hasNextPage}">
                                                    <li>
                                                        <a href="${webpath}/maintainer/queryforRes?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <li><a href="${webpath}/maintainer/queryforRes?pn=${pageInfo.pages}">末页</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->

        <div class="clearfix"></div>

        <%@ include file="footer.jsp"%>

    </div><!-- /#right-panel -->

    <!-- Right Panel -->

    <!-- Scripts -->
<%--    自动分页--%>
<%--    <script src="${pageContext.request.contextPath}/bootstrap/assets/js/lib/data-table/jquery.datatables.min.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/bootstrap/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/bootstrap/assets/js/lib/data-table/dataTables.buttons.min.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/bootstrap/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/bootstrap/assets/js/lib/data-table/jszip.min.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/bootstrap/assets/js/lib/data-table/vfs_fonts.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/bootstrap/assets/js/lib/data-table/buttons.html5.min.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/bootstrap/assets/js/lib/data-table/buttons.print.min.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/bootstrap/assets/js/lib/data-table/buttons.colVis.min.js"></script>--%>
<%--    <script src="${pageContext.request.contextPath}/bootstrap/assets/js/init/datatables-init.js"></script>--%>


    <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
      } );
  </script>

</body>
</html>
