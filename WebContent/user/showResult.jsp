<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/showPhoto.js"></script>
<script type="text/javascript">
function reset(){
	window.location.href="${pageContext.request.contextPath}/user/home";
}
</script>

<script type="text/javascript">
function submit(){
	window.location.href="${pageContext.request.contextPath}/user/home";
}
</script>

<title>分析结果</title>


</head>
<body>
<%@include file="../common/adminTopNav.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../common/adminLeftNav.jsp" %>
        </div>
        
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h2 class="sub-header">分析结果</h2>
         
		 
        </div>
        	
      </div>
    </div>
    
    
		<form class="form" role="form" id="star"  method="post" action="${pageContext.request.contextPath}/user/getPhoto" enctype="multipart/form-data">
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<div class="form-group">
						<label for="error_msg"> 识别信息 </label> 
						<input class="form-control" name="error_msg" id="error_msg" value="${star.error_msg}" type="text" placeholder="信息" />
					</div>

					<div class="form-group">
						<label for="error_code">识别码</label> 
						<input class="form-control" name="error_code" id="error_code" value="${star.error_code}" type="text"   />
					</div>

					<div class="form-group">
						<label for="group_id">组</label> 
						<input class="form-control" name="group_id" id="group_id" value="${star.group_id}" type="text"   />
					</div>
						
					<div class="form-group">
						<label for="user_id">明星id</label> 
						<input class="form-control" name="user_id" id="user_id" value="${star.user_id}" type="text"  />
					</div>
					
					<div class="form-group">
						<label for="user_info">明星信息</label> 
						<input class="form-control" name="user_info" id="user_info" value="${star.user_info}" type="text"  />
					</div>
					
					<div class="form-group">
						<label for="score">识别分数</label> 
						<input class="form-control" name="score" id="score" value="${star.score}" type="text"  />
					</div>
						
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<a href="../home.jsp" class="btn btn-primary" type="button">确定</a>
			<a href="../home.jsp"  class="btn btn-default" type="button">重置</a>
			</div>
			</form>
		
		
	
						
		
</body>
</html>