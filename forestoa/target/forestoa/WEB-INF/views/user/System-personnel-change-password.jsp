<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>

<link rel="stylesheet" href="${ctxStatic}/css/header.css" />
<style>
	.form-horizontal .form-label {
    	text-align: right; 
	}
</style>
</head>
<body>
	<article class="page-container">
		<form action="/" method="post" class="form form-horizontal"
			id="form-change-password">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>警号:</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="userNumber" name="userNumber" type="text"
						class="input-text" disabled>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>新密码:</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="newpassword" name="newpassword" type="password"
						class="input-text" autocomplete="off" placeholder="不修改请留空"
						name="newpassword" id="newpassword">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>确认密码:</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="loginPassword" name="loginPassword" type="password"
						class="input-text" autocomplete="off" placeholder="不修改请留空"
						name="newpassword2" id="new-password2">
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input id="update" class="btn btn-primary radius" type="button"
						value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
						 <input type="button" onClick="layer_close();"
						class="btn btn-default radius" value="&nbsp;&nbsp;返回&nbsp;&nbsp;"></input>
				</div>
			</div>
		</form>
	</article>

	<script type="text/javascript">
	var str = location.href; //取得整个地址栏
	var num = str.indexOf("?");
	str = str.substr(num + 1);
	var userId=strs = str.split("=")[1];
		$(document).ready(function() {
			
			var url = "users/selectByKey?" + str;
			$.ajax({
				type : "POST",
				url : url,
				dataType : "json",
				success : function(result) {
					var r = "";
					 $("#userNumber").val(result.data.userNumber);
				}
			});
			
		});

		//点击确定按钮向后台添加数据
		$("#update").on("click", function() {
			
			var userNumber = $("#userNumber").val();
			
			var loginPassword = $("#loginPassword").val();
			if(loginPassword=="") {
			     //alert("确认密码不可以为空");
			     layer.msg("确认密码不可以为空!", {
						icon : 5,
						time : 1000
	              
	           });
			     return false;}
			
			if($("#newpassword").val()==loginPassword){
				
				
				$.ajax({
					type : "post",
					url : "users/changePassword",
					data : {
						"userId" : userId,
						"loginPassword" : loginPassword
					},

					success : function(data) {
						//保存成功跳转到主页面
						window.location.href = ctx + "/Systempersonnel";
						window.parent.location.reload();
						
					},
					error : function() {
						layer.msg(data.msg, {
							icon : 5,
							time : 1000
						});
					}
				});

				
				
				
				
			}else{
				//alert("您两次输入的密码不相同！！");
				layer.msg("您两次输入的密码不相同！！", {
					icon : 5,
					time : 1000
				});
			}

			

			
		});

		
		
		
		
		
	
		
		
		
		
		
		

		

			
		
	</script>
</body>
</html>
