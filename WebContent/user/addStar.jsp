<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/importAndShow.js"></script>

<script type="text/javascript" src="../js/showPhoto.js"></script>
<title>上传用户</title>
</head>
<body>
<%@include file="../../common/adminTopNav.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../common/adminLeftNav.jsp" %>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

          <h2 class="sub-header">上传明星</h2>
          
          
          <div class="add_user">
        	<form action="/user/addStar" enctype="multipart/form-data" method="post">

				
					<div class="form-group">
						<label for="user_id">明星id</label> 
						<input class="form-control" name="user_id" id="user_id" type="text"  />
					</div>
					
					<div class="form-group">
						<label for="user_info">明星信息</label> 
						<input class="form-control" name="user_info" id="user_info"  type="text"  />
					</div>
					<input type="file" name="file" id="imgOne"onchange="preImg(this.id,'imgPre');" /> 
					<img id="imgPre" src=""width="300px"height="300px" style="display: block;"onload="javascript:DrawImage(this,900,900);" /> 
							<input type="submit" value="提交">
<!-- 	       		<input type="file" name="file"><br/> -->
<!-- 	     		<input type="submit" value="提交"> -->
   	 		</form>	 
        
          </div> 
 
        
   			 
   			 			
        </div>
      </div>
    </div>

</body>
</html>