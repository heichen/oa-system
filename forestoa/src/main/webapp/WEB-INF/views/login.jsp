<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>
<link href="${ctxStatic}/h-ui.admin/css/H-ui.login.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
.loginBox {
	height: 250px;
}
</style>
</head>
<body style="color: #ffffff;">
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="header"></div>
	<div class="loginWraper">
		<div id="loginform" class="loginBox">
			<form class="form form-horizontal" action="index.html" method="post">
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
					<div class="formControls col-xs-8">
						<input id="userNumber" name="userNumber" type="text"
							placeholder="警号" class="input-text size-L">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
					<div class="formControls col-xs-8">
						<input id="loginPassword" name="loginPassword" type="password"
							placeholder="密码" class="input-text size-L">
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<label for="online"> <input type="checkbox" name="online"
							id="online" value=""> 记住密码
						</label>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input id="loginBtn" name="loginBtn" type="button"
							class="btn btn-success radius size-L"
							value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"> <input
							name="" type="reset" class="btn btn-default radius size-L"
							value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">Copyright</div>

	<script type="text/javascript">
		$(function() {
			var userNumber = $.cookie("forestoaNumber");
			var loginPassword = $.cookie("forestoaPwd")
			$("#userNumber").val(userNumber);
			$("#loginPassword").val(loginPassword);
			if (userNumber != null && userNumber != ""
					&& userNumber != undefined && loginPassword != null
					&& loginPassword != "" && loginPassword != undefined) {
				$("#online").prop('checked', true);
			}
		});
		$("#loginBtn").on("click", function() {
			var userNumber = $("#userNumber").val();
			var loginPassword = $("#loginPassword").val();
			if ($("#online").prop('checked')) {
				//如果选中了记住密码
				$.cookie("forestoaNumber", userNumber);
				$.cookie("forestoaPwd", loginPassword);
			} else {
				$.cookie("forestoaNumber", "");
				$.cookie("forestoaPwd", "");
			}
			login(userNumber,loginPassword);
		});

		$(document).keydown(function(event) {
			if (event.keyCode == 13) {
				var userNumber = $("#userNumber").val();
				var loginPassword = $("#loginPassword").val();
				if ($("#online").prop('checked')) {
					//如果选中了记住密码
					$.cookie("forestoaNumber", userNumber);
					$.cookie("forestoaPwd", loginPassword);
				} else {
					$.cookie("forestoaNumber", "");
					$.cookie("forestoaPwd", "");
				}
				login(userNumber, loginPassword);
			}
		});

		function login(userNumber, loginPassword) {
			$.ajax({
				type : "post",
				url : "users/login",
				data : {
					"userNumber" : userNumber,
					"loginPassword" : loginPassword
				},

				success : function(data) {
					// wsCache.touch("currUser",900);
					//alert(data.success);
					if (data.success == false) {
						//alert("用户或密码输入错误！");
						layer.msg(data.msg, {
							icon : 5,
							time : 1000
						});
					}
					if (data.success == true) {
						if (data.data == 1) {
							//alert(ctx+'/index');
							window.location.href = ctx + '/index';
						} else {
							layer.msg(data.msg, {
								icon : 5,
								time : 1000
							});
						}

					}
					//confirm2()
				},
				error : function() {
				}
			});
		};
		//	$('#loginBtn').click(function(){
		//		location.href = 'index.html';
		//	});
	</script>
</html>
