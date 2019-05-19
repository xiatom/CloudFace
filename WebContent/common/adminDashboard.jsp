<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1 class="page-header">首页</h1>


  <div class="col-xs-4 col-sm-3 ">
    <img src="${pageContext.request.contextPath}/images/admin/photo.png" width="150" height="150" >
    <h4><a href="${pageContext.request.contextPath}/user/importPhoto.jsp">人脸识别</a></h4>
    <span class="text-muted">上传照片以识别</span>
  </div>
  
  <div class="col-xs-4 col-sm-3 ">
    <img src="${pageContext.request.contextPath}/images/admin/cam.png" width="150" height="150" >
    <h4><a href="${pageContext.request.contextPath}/user/takeCam.jsp">拍照识别</a></h4>
    <span class="text-muted">拍摄照片以识别</span>
  </div>
  
  
  <div class="col-xs-4 col-sm-3">
    <img src="${pageContext.request.contextPath}/images/admin/star.png" width="150" height="150" >
    <h4><a href="${pageContext.request.contextPath}/user/addStar.jsp">添加明星</a></h4>
    <span class="text-muted">上传明星信息</span>
  </div>
  
   <div class="col-xs-4 col-sm-3 ">
    <img src="${pageContext.request.contextPath}/images/admin/admin.png" width="150" height="150" >
    <h4><a href="${pageContext.request.contextPath}/user/getUsers">管理用户</a></h4>
    <span class="text-muted">用户信息管理</span>
  </div>
</div>