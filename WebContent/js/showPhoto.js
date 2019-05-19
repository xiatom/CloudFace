function DrawImage(ImgD,FitWidth,FitHeight){  
	var image=new Image();   
	image.src=ImgD.src;    
	if(image.width>0 && image.height>0){    
		if(image.width/image.height>= FitWidth/FitHeight){  
			if(image.width>FitWidth){
				ImgD.width=FitWidth;
				ImgD.height=(image.height*FitWidth)/image.width;    
			}else{
				ImgD.width=image.width;
				ImgD.height=image.height;
				}
			}else{ 
				if(image.height>FitHeight){
					ImgD.height=FitHeight; 
					ImgD.width=(image.width*FitHeight)/image.height; 
				}else{
					ImgD.width=image.width;      
					ImgD.height=image.height;
					}
				}
			}
	}

function getFileUrl(sourceId) {
	var url;
	if (navigator.userAgent.indexOf("MSIE")>=1) { // IE
	url = document.getElementById(sourceId).value;
	} else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox
	url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
	} else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome
	url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
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