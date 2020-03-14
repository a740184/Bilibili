<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="webpath" value="${pageContext.request.contextPath}"></c:set>

<%--    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">--%>
<%--    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">--%>
    <link rel="stylesheet" href="${webpath}/bootstrap/css/normalize.min.css">
    <link rel="stylesheet" href="${webpath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${webpath}/bootstrap/css/font-awesome.min.css">
    <link rel="stylesheet" href="${webpath}/bootstrap/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="${webpath}/bootstrap/css/flag-icon.min.css">
    <link rel="stylesheet" href="${webpath}/bootstrap/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${webpath}/bootstrap/assets/css/style.css">
    <link rel="stylesheet" href="${webpath}/bootstrap/assets/css/pagination.css">

<script type="text/javascript"  src="${webpath}/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript"  src="${webpath}/bootstrap/assets/js/popper.min.js"></script>
<script type="text/javascript"  src="${webpath}/bootstrap/assets/js/bootstrap.min.js"></script>
<script src="${webpath}/bootstrap/assets/js/lib/data-table/datatables.min.js"></script>
<%--<script type="text/javascript"  src="${webpath}/bootstrap/js/jquery.matchHeight-min.js"></script>--%>
<%--<script type="text/javascript" src="${webpath}/bootstrap/assets/js/main.js"></script>--%>
<%--<script type="text/javascript" src="${webpath}/bootstrap/js/jquery.validate.min.js"></script>--%>
<%--    <script src="${webpath}/bootstrap/assets/js/init/datatables-init.js"></script>--%>
<%--以下为弹窗提示--%>
<!--   提交成功提示 -->

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
<!-- 等待中 -->
<div id="myModal" class="modal fade" data-keyboard="false"
     data-backdrop="static" data-role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div id="loading" class="loading">请求发送中...</div>
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
<!-- 确认提示 -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="ModalLabel3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="ModalLabel3">
                    确认提示
                </h4>
            </div>
            <div class="modal-body" id="sure">
                您是否确认当前信息填写准确？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="add_info()">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
    function showsuccess(words) {
        var w=document.getElementById("word");
        w.innerText="";
        w.innerText=words;
        $("#myAlert1").modal('show');
        setTimeout(function(){
            $("#myAlert1").modal('hide');
        },3000);
    }
    function showfailed() {
        $("#myAlert2").modal('show');
    }
    function showwait(){
        $('#myModal').modal('show');
    }
    function hidewait(){
        $('#myModal').modal('hide');
    }
    function showsure(text){
        var w=document.getElementById("sure");
        w.innerHTML="";
        w.innerHTML=text;
        $('#myModal3').modal('show');
    }
</script>