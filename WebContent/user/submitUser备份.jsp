<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/showPhoto.js"></script>
<script type="text/javascript">
	function deletePhoto() {
		alert("重置照片");
// 		window.location.href = "${pageContext.request.contextPath}/user/importPhoto.jsp";
	}
</script>

<title>预览图片</title>


</head>
<body>
	<%@include file="../common/adminTopNav.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<%@include file="../common/adminLeftNav.jsp"%>
			</div>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h2 class="sub-header">预览图片</h2>
			</div>

		</div>
	</div>


	<form class="form" role="form" id="photoMsg" method="post"
		action="${pageContext.request.contextPath}/user/getPhoto"
		enctype="multipart/form-data">

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h2>拦截器拦截，显示失败</h2>
<%-- 			<img src=${photo } onload="javascript:DrawImage(this,900,900);"> --%>
			<img src="${pageContext.request.contextPath}/upload\uploadPhoto.jpg" onload="javascript:DrawImage(this,900,900);">
			<h1>${pageContext.request.contextPath}/upload\uploadPhoto.jpg</h1>
		</div>

<%-- 		<input type="image" src=${photo } alt="Submit" /><br /> --%>
		
		<input type="text" name="photo" value=${photo } style="display: none;"><br />
		
		
		
		
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<button class="btn btn-primary" type="submit">确定</button>
			<a href="../user/importPhoto.jsp"  class="btn btn-default" type="button" onclick = "deletePhoto()">重置</a>
		</div>
	</form>
	
</body>
</html>