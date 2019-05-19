<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">



<script type="text/javascript" src="../js/showPhoto.js"></script>

<script type="text/javascript">
	/**
	 * 从 file 域获取 本地图片 url
	 * 编辑：www.jbxue.com
	 */
	function getFileUrl(sourceId) {
		var url;
		if (navigator.userAgent.indexOf("MSIE") >= 1) { // IE
			url = document.getElementById(sourceId).value;
		} else if (navigator.userAgent.indexOf("Firefox") > 0) { // Firefox
			url = window.URL
					.createObjectURL(document.getElementById(sourceId).files
							.item(0));
		} else if (navigator.userAgent.indexOf("Chrome") > 0) { // Chrome
			url = window.URL
					.createObjectURL(document.getElementById(sourceId).files
							.item(0));
		}
		return url;
	}

	/**
	 * 将本地图片 显示到浏览器上
	 * 编辑：www.jbxue.com
	 */
	function preImg(sourceId, targetId) {
		var url = getFileUrl(sourceId);
		var imgPre = document.getElementById(targetId);
		imgPre.src = url;
	}
</script>
</head>
<body>

	<%@include file="../../common/adminTopNav.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<%@include file="../common/adminLeftNav.jsp"%>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<h2 class="sub-header">上传人脸</h2>


				<div class="import_picture">
					<form action="${pageContext.request.contextPath}/user/importfile"
						enctype="multipart/form-data" method="post">
						<input type="file" name="file" id="imgOne"
							onchange="preImg(this.id,'imgPre');" /> <img id="imgPre" src=""
							width="300px" height="300px" style="display: block;"
							onload="javascript:DrawImage(this,900,900);" /> <input
							type="submit" value="提交">
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>