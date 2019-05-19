<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<title>人脸识别</title>
<style type="text/css">
</style>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrapValidator.min.css">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.min.js"></script>
</head>
<body>
	<div>
		<div class="page-header" style="margin-top: 10px; text-align: center">
			<span style="font-size:50px">人脸识别系统</span>
		</div>
	</div>
	<div class="col-md-offset-4 col-md-4">
	<!-- <div class="" style="width:450px;margin:0 auto;"> -->
		<div class="panel panel-primary" style="margin-top: 5px;">
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="Cus">
					<div class="well well-sm ">
						<h3 class="panel-title">登陆</h3>
					</div>
					<div class="panel-body">
						<form name="LoginG" id="LoginG" action="${pageContext.request.contextPath}/user/checkUser" method="post"
							target="_parent" onKeyDown="if(event.keyCode==13)return false;else noNumbers(event);">
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">账号</span> <input name="username"
										type="text" class="form-control">
								</div>
								<br />
							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">密码</span> <input
										name="password" type="Password" class="form-control">
								</div>
							</div>
							<h5>请将计算结果填入文本框：</h5>
							<div class="form-group form-horizontal">
								<label class="col-lg-3 control-label " id="captchaOperation"></label>
								<div class="col-lg-9">
									<input type="text" class="form-control " name="captcha" />
								</div>
							</div><br/><br/>
							<div class="form-group">
								<input class="btn  btn-primary btn-block" type="button"
									value="登　　录" onclick="login()" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							function randomNumber(min, max) {
								return Math.floor(Math.random()
										* (max - min + 1) + min);
							}
							;

							function generateCaptcha() {
								$('#captchaOperation').html(
										[ randomNumber(1, 9), '+',
												randomNumber(1, 5), '=' ]
												.join(' '));
							}
							;
							generateCaptcha();

							$('#LoginG')
									.bootstrapValidator(
											{
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													uname : {
														message : '账号无效',
														validators : {
															notEmpty : {
																message : '账户不能为空'
															},
															stringLength : {
																min : 1,
																max : 10,
																message : '账号长度应为 5-10'
															}
														}
													},
													upassword : {
														validators : {
															notEmpty : {
																message : '密码不能为空'
															}
														}
													},
													captcha : {
														validators : {
															callback : {
																message : '验证码错误',
																callback : function(
																		value,
																		validator) {
																	var items = $(
																			'#captchaOperation')
																			.html()
																			.split(
																					' '), sum = parseInt(items[0])
																			+ parseInt(items[2]);
																	return value == sum;
																}
															}
														}
													}

												}

											})
									.on(
											'error.form.bv',
											function(e) {
												var $form = $(e.target), bootstrapValidator = $form
														.data('bootstrapValidator');
												if (!bootstrapValidator
														.isValidField('captcha')) {
													generateCaptcha();
												}
											});

						});

		function login() {
// 			window.location.href="success.jsp";
			
			$('#LoginG').data('bootstrapValidator').validate();
			if (!$('#LoginG').data('bootstrapValidator').isValid()) {
				return;
			}

			$
					.ajax({
						url : '${pageContext.request.contextPath}/user/checkUser',
						type : "post",
						dataType : "text",
						data : $('#LoginG').serialize(),
						success : function(msg) {
							if (msg == "success"){
								window.location = "${pageContext.request.contextPath}/user/home";
							}
							else
								alert("用户名或密码错误"+msg);
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							alert("XMLHttpRequest.status"
									+ XMLHttpRequest.status);
							alert("XMLHttpRequest.readyState"
									+ XMLHttpRequest.readyState);
							alert("XMLHttpRequest.textStatus" + textStatus);
						}
					});
		}
	</script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							function randomNumber(min, max) {
								return Math.floor(Math.random()
										* (max - min + 1) + min);
							}
							;

							function generateCaptcha() {
								$('#captchaOperation2').html(
										[ randomNumber(1, 50), '+',
												randomNumber(1, 50), '=' ]
												.join(' '));
							}
							;
							generateCaptcha();

							$('#LoginS')
									.bootstrapValidator(
											{
												//message: 'This value is not valid',
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													Username2 : {
														message : 'The username is not valid',
														validators : {
															notEmpty : {
																message : '账户不能为空'
															},
															stringLength : {
																min : 5,
																max : 10,
																message : '账号长度应为 5-10'
															},
															/*remote: {
															    url: 'checkUser',
															    message: '用户名不存在'
															},*/
															regexp : {
																regexp : /^[a-zA-Z0-9_\.]+$/,
																message : '只接受数字和字母 '
															}
														}
													},
													Password2 : {
														validators : {
															notEmpty : {
																message : '密码不能为空'
															}
														}
													},
													captcha2 : {
														validators : {
															callback : {
																message : '验证码错误',
																callback : function(
																		value,
																		validator) {
																	var items = $(
																			'#captchaOperation2')
																			.html()
																			.split(
																					' '), sum = parseInt(items[0])
																			+ parseInt(items[2]);
																	return value == sum;
																}
															}
														}
													}

												}
											})
									.on(
											'error.form.bv',
											function(e) {
												var $form = $(e.target), bootstrapValidator = $form
														.data('bootstrapValidator');
												if (!bootstrapValidator
														.isValidField('captcha')) {
													generateCaptcha();
												} 
											});
						});
	</script>
</body>
</html>