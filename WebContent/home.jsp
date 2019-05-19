<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>
<%@include file="common/adminTopNav.jsp" %>


    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../common/adminLeftNav.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		  <%@include file="../common/adminDashboard.jsp" %>
		  
		  
<%-- 		  <form action="${pageContext.request.contextPath}/user/importfile" enctype="multipart/form-data" method="post"> --%>
<!-- 	       		  上传文件：<input type="file" name="file"><br/> -->
<!-- 	     			   <input type="submit" value="提交"> -->
<!--    	 		</form>	 -->
        
        </div>
          
   	      	
      </div>
    </div>
    
    
   
    
    
    
</body>
</html>