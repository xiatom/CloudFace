<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
</head>
<body>
<%@include file="../common/adminTopNav.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../common/adminLeftNav.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h2 class="sub-header">${empty user.id?"添加":"修改" }用户信息</h2>
          <div class="col-sm-4 col-sm-offset-3 col-md-5 col-md-offset-2">
         	<form class="form" role="form" id="addrForm"  method="post" action="/CloudFace/user/doHandleuser" enctype="multipart/form-data">
					<input type="hidden" id="id" name="id" value="${empty user.id?0:user.id}"/>
					<div class="form-group">
						<label for="username"> 用户名 </label> 
						<input class="form-control" name="username" id="username" value="${user.username}" type="text"  placeholder="用户名" required/>
					</div>
					
					<div class="form-group">
						<label for="role">用户角色 </label> 
						<input class="form-control" name="role" id="role" value="${user.role}" type="text"  placeholder="用户角色" required/>
					</div>
					
					
					<div class="form-group">
						<label for="password">密码 </label> 
						<input class="form-control" name="password" id="password" value="${user.password}" type="text"  placeholder="密码" required/>
					</div>
					
<%-- 					<c:if test="${empty user.id}"> --%>
<!-- 					<div class="form-group"> -->
<!-- 						<label for="username"> 密码</label>  -->
<%-- 						<input class="form-control" name="username" id="username" value="${user.username}" type="text"  placeholder="用户名" required/> --%>
<!-- 					</div> -->
<!-- 					<button class="btn btn-primary" type="submit" >确定</button> -->
<%-- 					</c:if> --%>
		
		
		
				<button class="btn btn-primary" type="submit" >确定</button>
				<button class="btn btn-default" type="reset" >重置</button>
			</form>
		   </div>
        </div>
      </div>
    </div>

</body>
</html>