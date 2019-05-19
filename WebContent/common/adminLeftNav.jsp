<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="reqPath" value="${pageContext.request.servletPath}" />
<ul id="main-nav" class="main-nav nav nav-tabs nav-stacked" style="">
	<li ${fn:contains(reqPath,"/user/home")?"class='active'":""}><a
		href="${pageContext.request.contextPath}/user/home"> <i
			class="glyphicon glyphicon-th-large"></i> 首页
	</a></li>

<li ${fn:contains(reqPath,"/user/home")?"class='active'":""}><a
		href="${pageContext.request.contextPath}/user/importPhoto.jsp"> <i
			class="glyphicon glyphicon-th-large"></i> 人脸识别
	</a></li>
	
<li ${fn:contains(reqPath,"/user/home")?"class='active'":""}><a
		href="${pageContext.request.contextPath}/user/takeCam.jsp"> <i
			class="glyphicon glyphicon-th-large"></i> 拍照识别
	</a></li>
	
<li ${fn:contains(reqPath,"/user/home")?"class='active'":""}><a
		href="${pageContext.request.contextPath}/user/addStar.jsp"> <i
			class="glyphicon glyphicon-th-large"></i> 增加明星
	</a></li>
	
	<li ${fn:contains(reqPath,"/user/home")?"class='active'":""}><a
		href="${pageContext.request.contextPath}/user/getUsers"> <i
			class="glyphicon glyphicon-th-large"></i> 管理用户
	</a></li>
</ul>



