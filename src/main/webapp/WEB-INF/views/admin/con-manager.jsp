<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../base.jsp"%>
<html>
<head>
    <title>投稿管理</title>
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
                                <li><a href="#">投稿管理</a></li>
                                <li class="active"><a href="javascript:location.reload();" style="color: #03a9f3;">投稿信息</a></li>
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
                            <strong class="card-title">投稿详情</strong>
                        </div>
                        <div class="card-body">
                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>素材编号</th>
                                    <th>投稿用户</th>
                                    <th>素材名称</th>
                                    <th>素材类型</th>
                                    <th>封面图片</th>
                                    <th>投稿时间</th>
                                    <th>点赞数</th>
                                    <th>硬币数</th>
                                    <th>操作</th>
                                </tr>
                                <tbody>
                            <c:forEach items="${pageInfo.list}" var="videos">
                            <tr>
                                <td>${videos.vid}</td>
                                <td>${videos.user.username}</td>
                                <td>${videos.vname}</td>
                                <td>${videos.vtype.typename}</td>
                                <td><img src="${webpath}/img/${videos.vImage}" width="80px" height="50px"/></td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${videos.vtime}"/></td>
                                <td>${videos.praise}</td>
                                <td>${videos.getIcon}</td>
                                <td><a style="margin-left: 10px;" class="btn btn-primary" href="javascript:void(0)" onclick="queryVideo('${videos.vid}')">修改</a><a class="btn btn-danger" href="${webpath}/admin/delete/${videos.vid}/${pageInfo.pageNum}" style="margin-left: 10px;">删除</a></td>
                            </tr>
                            </c:forEach>
                                </tbody>
                            </table>
                            <!-- 显示分页 -->
                            <div class="row">
                                <div class="col-md-6" >当前第${pageInfo.pageNum}页, 总共${pageInfo.pages}页, 共${pageInfo.total}条记录</span></div>
                                <div class="col-md-6" >
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination">
                                            <li><a href="${webpath}/${webpath}/admin/conMan?pageNum=1">首页</a></li>
                                            <!-- 上页 -->
                                            <c:if test="${pageInfo.hasPreviousPage}">
                                                <li>
                                                    <a href="${webpath}/admin/conMan?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
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
                                                    <li><a href="${webpath}/admin/conMan?pageNum=${page_Num}">${page_Num}</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <!-- 下页 -->
                                            <c:if test="${pageInfo.hasNextPage}">
                                                <li>
                                                    <a href="${webpath}/admin/conMan?pageNum=${pageInfo.pageNum+1}" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <li><a href="${webpath}/admin/conMan?pageNum=${pageInfo.pages}">末页</a></li>
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
<div class="modal fade" id="putCon" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" >
                <h4 class="modal-title" id="ModalLabel"><strong>修改投稿素材</strong></h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="${webpath}/admin/video"  method="post" enctype="multipart/form-data">
                    <input type="hidden" name="pageNum" value="${pageInfo.pageNum}"/>
                    <div class="form-group">
                        <label class="control-label">投稿人</label>
                        <input class="form-control form-white" type="hidden" name="vid" id="vid" value="${video.vid}"/>
                        <input class="form-control form-white" type="text"  id="username" value="${video.user.username}" readonly/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">素材标题</label>
                        <input class="form-control form-white" type="text" name="vname" id="vname" value="${video.vname}" readonly/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">素材类型</label>
                        <select class="form-control selected" name="typeId" id="typeId">
                            <c:forEach items="${videoTypes}" var="list">
                            <option value="${list.typeId}">${list.typename}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group" id="fm">
                    <label class="control-label">封面</label>
                        <div class="img-list">
                            <img  src="" width="100px" height="100px" id="vImage"/>
                        </div>
                        <div class="input-group">
                            <input type="text" id='location' name="vImage" class="form-control"  onclick="$('#i-file').click();">
                            <label class="input-group-btn">
                                <input type="button" id="i-check" value="浏览文件" class="btn btn-primary" onclick="$('#i-file').click();">
                            </label>
                        </div>
                        <input type="file" name="file" id='i-file'  accept=".jpg, .png, .jepg, .gif, .bmp, .svg" style="display: none">
                </div>
                    <div class="form-group">
                    <label class="control-label">视频</label>
                        <video  id="vsrc" controls="controls" width="200px" height="100px">你的浏览器不支持video</video>
                </div>
                    <div class="form-group">
                        <label class="control-label">点赞</label>
                        <input class="form-control" name="" type="text" value="${video.praise}" id="praise" readonly/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">硬币</label>
                        <input class="form-control" name="" type="text" value="${video.praise}" id="getIcon" readonly/>
                    </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary">保存</button>
            </div>
                </form>
        </div>
    </div>
</div>
</div>
<div class="clearfix"></div>
<%@ include file="footer.jsp"%>
</div>
</body>
<% Object message=request.getAttribute("result");
    if(message!=null&&message=="success"){
%>
<script>
    showsuccess('操作成功！');
</script>
<%}else if(message!=null&&message=="failed"){%>
<script>
    showfailed();
</script>
<%}%>

<script>

    function queryVideo(id) {
        $.ajax({
            type:"GET",
            url:"${webpath}/admin/queryVideo/"+id,
            data:{
                id:id
            },
            dataType:"json",
            success:function (data) {
                if(data.result=="success"){
                    var video=data.video;
                    var vid=document.getElementById("vid");
                    var username=document.getElementById("username");
                    var vsrc=document.getElementById("vsrc");
                    var vname=document.getElementById("vname");
                    var typeId=document.getElementById("typeId");
                    var vImage=document.getElementById("vImage");
                    var getIcon=document.getElementById("getIcon");
                    var praise=document.getElementById("praise");
                    var v_img_src=document.getElementById("location");
                    vid.value= video.vid ;
                    vsrc.src = "${webpath}/img/"+video.vsrc ;
                    username.value=video.user.username;
                    vname.value=video.vname ;
                    $("#typeId option").each(function () {
                            if ($(this).val() == video.vtype.typeId) {
                                $(this).attr("selected", true);
                            }
                      });
                    vImage.src= "${webpath}/img/"+video.vImage ;
                    v_img_src.value=video.vImage;
                    getIcon.value=video.getIcon;
                    praise.value=video.praise;
                    $("#putCon").modal('show');
                }else{
                    showfailed();
                }
            },
            error:function (error) {
                showfailed();
            }
        })
    }

    $('#putCon').on('hidden.bs.modal', function () {
        var video=document.getElementsByTagName("video")[0];
        video.pause();
    });

    document.getElementById('i-file').onchange = function() {
        var len=this.files.length;
        var str="";
        var name="";
        for(var i=0;i<len;i++) {
            var imgFile = this.files[i];
            var fr = new FileReader();
            fr.readAsDataURL(imgFile);
            fr.onload = function (e) {
                str="<img  src='"+e.target.result+"' width='100px' height='100px'/>";
                //  document.getElementById('vImage').src = fr.result;
                $(".img-list").after(str);
            };
            name=name+this.files[i].name+"|";
        }
        $('#location').val(name);
        $(".img-list").html(str);
    };
</script>
</html>
