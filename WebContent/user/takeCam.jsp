<!DOCTYPE html>
<html lang="ZH-CN">
<head>
  <meta charset="utf-8">
  
  <title>takePhoto</title>
  <style>
    .booth {
      width:400px;
     
      background:#ccc;
      border: 10px solid #ddd;
      margin: 0 auto;
    }
  </style>
</head>
<body>
<%@include file="../../common/adminTopNav.jsp" %>
        <div class="col-sm-3 col-md-2 sidebar">
          <%@include file="../common/adminLeftNav.jsp" %>
        </div>
  <div class="booth">
    <video id="video" width="400" height="300"></video>
    <button id='tack'> snap shot</button>
    <canvas id='canvas' width='400' height='300'></canvas>
    
    <div class="import_picture">
					<form action="${pageContext.request.contextPath}/user/getCam"
						enctype="multipart/form-data" method="post">
<!-- 						<input type="file" name="file" id="img" /> -->
						<input id="test" type="hidden" name="test">
						<img id="img" src=""style="display: none;" />
							 <input type="submit" value="submit">
					</form>
	</div>
  </div>
 
 
  <script>
    var video = document.getElementById('video'),
        canvas = document.getElementById('canvas'),
        snap = document.getElementById('tack'),
        img = document.getElementById('img'),
        vendorUrl = window.URL || window.webkitURL;
        
    //媒体对象
    navigator.getMedia = navigator.getUserMedia ||
                         navagator.webkitGetUserMedia ||
                         navigator.mozGetUserMedia ||
                         navigator.msGetUserMedia;
    navigator.getMedia({
        video: true, //使用摄像头对象
        audio: false  //不适用音频
    }, function(strem){
        console.log(strem);
        video.src = vendorUrl.createObjectURL(strem);
        video.play();
    }, function(error) {
        //error.code
        console.log(error);
    });
    snap.addEventListener('click', function(){
    
        //绘制canvas图形
        canvas.getContext('2d').drawImage(video, 0, 0, 400, 300);

        //把canvas图像转为img图片
        img.src = canvas.toDataURL("image/png");
        console.log(img.src);
        document.getElementById("test").value = img.src;
        
    })
  </script>
</body>
</html>