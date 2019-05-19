<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../../common/adminTopNav.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../common/adminLeftNav.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

          <h2 class="sub-header">用户列表</h2>
          
<%--           <a href="${pageContext.request.contextPath}/user/handleUser.jsp">添加</a> --%>
          
          <c:if test="${!empty users }">
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>序号</th>
                  <th>用户名称</th>
                  <th>用户角色</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${users}" var="user" varStatus="vs">
                <tr>
                  <td>${vs.count }</td>
                  <td>${user.username }</td>
                  <td>${user.role}</td>
                  <td>
                   	<a href="${pageContext.request.contextPath}/user/handleUser.jsp">添加</a>
                  	<a href="${pageContext.request.contextPath}/user/handleUser?id=${user.id}">修改</a> |
                  	<a href="${pageContext.request.contextPath}/user/deluser?id=${user.id}" onclick="confirm('确定要删除这个用户吗？')">删除</a>   
				  </td>
                </tr>
               </c:forEach>
              </tbody>
            </table>
          </div>
          </c:if>    
 
        
   			 
   			 			
        </div>
      </div>
    </div>

</body>
</html>