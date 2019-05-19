<button id="replaceImg" class="l-btn">更换图片</button>
 
<!--图片裁剪框 start-->
<div style="display: none" class="tailoring-container">
    <div class="black-cloth" onclick="closeTailor(this)"></div>
    <div class="tailoring-content">
        <div class="tailoring-content-one">
            <label title="上传图片" for="chooseImg" class="l2-btn choose-btn">
                <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden" onchange="selectImg(this)">
                本地上传
            </label>
            <label title="拍照" class="l2-btn choose-btn" id='capture' style="margin-left: 2%;">拍照</label>
            <label title="重拍" class="l2-btn choose-btn" id='takeAgain' style="margin-left: 2%;">重拍</label>
            <div class="close-tailoring"  onclick="closeTailor(this)">×</div>
        </div>
        <div class="tailoring-content-two">
            <div class="tailoring-box-parcel">
                <video id="video" width="100%" height="100%" controls  style="float: left;" ></video>
                <canvas id="canvas" width="482px" height="448px" style="float: left;" hidden="hidden"></canvas>
                <div id="showImg" hidden="hidden" style="width: 100%;height:100%;">
                    <img id="tailoringImg">
                </div>
            </div>
            <div class="preview-box-parcel">
                <p>图片预览：</p>
                <div class="square previewImg"></div>
                <div class="circular previewImg"></div>
            </div>
        </div>
        <div class="tailoring-content-three">
            <button class="l2-btn cropper-reset-btn">复位</button>
            <button class="l2-btn cropper-rotate-btn">旋转</button>
            <button class="l2-btn cropper-scaleX-btn">换向</button>
            <button class="l2-btn sureCut" id="sureCut">确定</button>
        </div>
    </div>
</div>
<!--图片裁剪框 end-->
 
<script>
 
    //弹出框水平垂直居中
    (window.onresize = function () {
        var win_height = $(window).height();
        var win_width = $(window).width();
        if (win_width <= 768){
            $(".tailoring-content").css({
                "top": (win_height - $(".tailoring-content").outerHeight())/2,
                "left": 0
            });
        }else{
            $(".tailoring-content").css({
                "top": (win_height - $(".tailoring-content").outerHeight())/2,
                "left": (win_width - $(".tailoring-content").outerWidth())/2
            });
        }
    })();
 
 
    //图像上传
    function selectImg(file) {
        if (!file.files || !file.files[0]){
            return;
        }
        var reader = new FileReader();
        reader.onload = function (evt) {
            var replaceSrc = evt.target.result;
            //更换cropper的图片
            $('#tailoringImg').cropper('replace', replaceSrc,false);//默认false，适应高度，不失真
 
        }
        reader.readAsDataURL(file.files[0]);
        mediaStreamTrack && mediaStreamTrack.stop();
        $("#video").hide();
        $("#showImg").show();
 
    }
    //cropper图片裁剪
    $('#tailoringImg').cropper({
        aspectRatio: 1/1,//默认比例
        preview: '.previewImg',//预览视图
        guides: false,  //裁剪框的虚线(九宫格)
        autoCropArea: 0.5,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
        movable: false, //是否允许移动图片
        dragCrop: true,  //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
        movable: true,  //是否允许移动剪裁框
        resizable: true,  //是否允许改变裁剪框的大小
        zoomable: false,  //是否允许缩放图片大小
        mouseWheelZoom: false,  //是否允许通过鼠标滚轮来缩放图片
        touchDragZoom: true,  //是否允许通过触摸移动来缩放图片
        rotatable: true,  //是否允许旋转图片
        crop: function(e) {
            // 输出结果数据裁剪图像。
        }
    });
 
    //弹框
    $("#replaceImg").on("click",function () {
        takeImg()
    });
 
    //旋转
    $(".cropper-rotate-btn").on("click",function () {
        $('#tailoringImg').cropper("rotate", 45);
    });
    //复位
    $(".cropper-reset-btn").on("click",function () {
        $('#tailoringImg').cropper("reset");
    });
    //换向
    var flagX = true;
    $(".cropper-scaleX-btn").on("click",function () {
        if(flagX){
            $('#tailoringImg').cropper("scaleX", -1);
            flagX = false;
        }else{
            $('#tailoringImg').cropper("scaleX", 1);
            flagX = true;
        }
        flagX != flagX;
    });
 
    //裁剪后的处理
    $("#sureCut").on("click",function () {
        var cas = $('#tailoringImg').cropper('getCroppedCanvas');//获取被裁剪后的canvas
        var base64url = cas.toDataURL('image/png'); //转换为base64地址形式
        base64url=base64url.replace("\r","")
        $.post("../Info", {op:"takePhoto",base64url:base64url }, function(data) {
            var result=parseInt($.trim(data.result));
            if(result==-1){
                $.messager.show({title:"温馨提示",msg:"输入的信息不完整,确认后重新提交。",timeout:3000,showType:'slide'})
            }else if(result>0){
                $.messager.show({title:"成功提示",msg:"头像更新成功",timeout:3000,showType:'slide'})
                //$('#attendance_info').css('color','green').text("已提交");
            }else{
                $.messager.alert("失败提示","头像更新失败，请稍后重试...",'error')
            }
        }, "JSON");
        //关闭裁剪框
        closeTailor();
    });
    //关闭裁剪框
    function closeTailor() {
        $(".tailoring-container").toggle();
        mediaStreamTrack && mediaStreamTrack.stop();
    }
 
    //访问用户媒体设备的兼容方法
    function getUserMedia(constraints, success, error) {
        if (navigator.mediaDevices.getUserMedia) {
            //最新的标准API
            navigator.mediaDevices.getUserMedia(constraints).then(success).catch(error);
        } else if (navigator.webkitGetUserMedia) {
            //webkit核心浏览器
            navigator.webkitGetUserMedia(constraints,success, error)
        } else if (navigator.mozGetUserMedia) {
            //firfox浏览器
            navigator.mozGetUserMedia(constraints, success, error);
        } else if (navigator.getUserMedia) {
            //旧版API
            navigator.getUserMedia(constraints, success, error);
        }
    }
 
    let video = document.getElementById('video');
    let canvas = document.getElementById('canvas');
    let context = canvas.getContext('2d');
    var mediaStreamTrack
    function success(stream) {
        //兼容webkit核心浏览器
        let CompatibleURL = window.URL || window.webkitURL;
        //将视频流设置为video元素的源
        mediaStreamTrack = stream.getTracks()[0];
        //video.src = CompatibleURL.createObjectURL(stream);
        video.srcObject = stream;
        video.play();
    }
 
    function error(error) {
        alert('访问用户媒体设备失败,请尝试更换浏览器')
    }
 
 
 
    document.getElementById('capture').addEventListener('click', function () {
        context.drawImage(video, 0, 0, 480, 320);
        mediaStreamTrack && mediaStreamTrack.stop();
        $('#tailoringImg').cropper('replace', canvas.toDataURL("image/png"),false);//默认false，适应高度，不失真
        $("#video").hide();//隐藏拍照框
        $("#showImg").show()//将拍照结果显示
    })
 
    //请求拍照
    $("#takeAgain").bind("click", function(){
        takePhoto();
    });
 
    //开始拍照
    function takeImg(){
        $(".tailoring-container").toggle();
        takePhoto();
    }
 
    //请求摄像头
    function takePhoto() {
        if (navigator.mediaDevices.getUserMedia || navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia) {
            //调用用户媒体设备, 访问摄像头
            getUserMedia({video : {width: 100, height: 100}}, success, error);
            $("#showImg").hide();//隐藏拍照结果显示框
            //$('#showImg').html('<img id="tailoringImg" hidden="hidden">')
            $("#video").show();//开启拍照框
        } else {
            alert('不支持访问用户媒体');
        }
    }
</script>
