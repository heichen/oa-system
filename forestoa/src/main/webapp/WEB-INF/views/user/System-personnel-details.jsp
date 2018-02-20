<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>

<link rel="stylesheet" href="${ctxStatic}/css/header.css" />
<style>
.mt-3{
	margin-top:3px;
}
</style>
</head>
<body>
	<article class="page-container">
		<form action="" method="post" class="form form-horizontal"
			id="userInsertForm">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">警号：</label>
				<div class="formControls col-xs-8 col-sm-9 mt-3">
					<!-- <input type="text" class="input-text" value="" placeholder=""
						id="userNumber" name="userNumber" disabled> -->
						<span id="userNumber" name="userNumber"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">姓名：</label>
				<div class="formControls col-xs-8 col-sm-9 mt-3">
					<!-- <input type="text" class="input-text" value="" placeholder=""
						id="userName" name="userName" disabled> -->
						<span id="userName" name="userName"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">性别：</label>
				<div class="formControls col-xs-8 col-sm-9 skin-minimal " id="sex">
					<div class="radio-box">
						<label><input  id="man" name="sex" type="radio" class="input-radio"
							value="男" />男</label>

					</div>
					<div class="radio-box">
						<label><input id="woman" name="sex" type="radio" class="input-radio"
							value="女" />女</label>
					</div>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">手机：</label>
				<div class="formControls col-xs-8 col-sm-9 mt-3">
					<!-- <input type="text" class="input-text" value="" placeholder=""
						id="phone" name="phone" disabled> -->
						<span id="phone" name="phone"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">邮箱：</label>
				<div class="formControls col-xs-8 col-sm-9 mt-3">
					<!-- <input type="text" class="input-text" placeholder="@" name="email"
						id="email" disabled> -->
						<span id="email" name="email"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">组织名称：</label>
				<div class="formControls col-xs-8 col-sm-2 mt-3">
					<!-- <input id="orgId" type="text" name=""
						 class="input-text treeDemo"
						value="" placeholder="无" disabled> -->
						<span id="orgId"></span>
				</div>
				<!-- <div id="menuContent" class="menuContent"
					style="background: #FFFFFF; width: 250px; height: 200px; overflow-y: scroll; display: none; position: absolute; z-index: 100;">
					<ul id="treeDemo" class="ztree"
						style="margin-top: 0; width: 160px;"></ul>
				</div> -->
				<label class="form-label col-xs-4 col-sm-2">职位名称：</label>
					<div id="roles" class="formControls col-xs-8 col-sm-2 mt-3">
					<!-- <input id="roleId" type="text" name="" class="input-text" value="" placeholder="无" disabled> -->
					<span id="roleId"></span>
				</div>
					
				
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">组织名称：</label>
				<div class="formControls col-xs-8 col-sm-2 mt-3">
					<!-- <input id="orgId1" type="text" name=""
						 class="input-text treeDemo1"
						value="" placeholder="无" disabled> -->
						<span id="orgId1"></span>
				</div>
				<!-- <div id="menuContent1" class="menuContent"
					style="background: #FFFFFF; width: 250px; height: 200px; overflow-y: scroll; display: none; position: absolute; z-index: 100;">
					<ul id="treeDemo1" class="ztree"
						style="margin-top: 0; width: 160px;"></ul>
				</div> -->
				<label class="form-label col-xs-4 col-sm-2">职位名称：</label>
					<div id="roles1" class="formControls col-xs-8 col-sm-2 mt-3">
					<!-- <input id="roleId1" type="text" name="" class="input-text" value="" placeholder="无" disabled> -->
					<span id="roleId1"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">组织名称：</label>
				<div class="formControls col-xs-8 col-sm-2 mt-3">
					<!-- <input id="orgId2" type="text" name=""
						 class="input-text treeDemo2"
						value="" placeholder="无" disabled> -->
						<span id="orgId2"></span>
				</div>
				<!-- <div id="menuContent2" class="menuContent"
					style="background: #FFFFFF; width: 250px; height: 200px; overflow-y: scroll; display: none; position: absolute; z-index: 100;">
					<ul id="treeDemo2" class="ztree"
						style="margin-top: 0; width: 160px;"></ul>
				</div> -->
				<label class="form-label col-xs-4 col-sm-2">职位名称：</label>
					<div id="roles2" class="formControls col-xs-8 col-sm-2 mt-3">
					<!-- <input id="roleId2" type="text" name="" class="input-text" value="" placeholder="无" disabled> -->
					<span id="roleId2"></span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">登录密码：</label>
				<div class="formControls col-xs-8 col-sm-9 mt-3">
					<!-- <input type="text" class="input-text" value="" placeholder=""
						id="loginPassword" name="loginPassword" disabled> -->
						<span id="loginPassword" name="loginPassword"></span>
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					 <input type="button" onClick="layer_close();"
						class="btn btn-default radius" value="&nbsp;&nbsp;返回&nbsp;&nbsp;"></input>
				</div>
			</div>
		</form>
	</article>

	<script type="text/javascript">
	<!--组织树,下拉框,人员信息初始化-->
		$(document).ready(function() {

			var str = location.href; //取得整个地址栏
			var num = str.indexOf("?");
			str = str.substr(num + 1);
			//alert(str)
			var url = "users/selectByKey?" + str;
			$.ajax({
				type : "POST",
				url : url,
				dataType : "json",
				success : function(result) {
					$("#userNumber").text(result.data.userNumber);
					$("#userName").text(result.data.userName);
					if((result.data.sex)=="男"){
                        $("#man").attr("checked","checked")
                    }else {
                        $("#woman").attr("checked","checked")
                    }
					if(result.data.orgId1!=0){
						selectOrg("#orgId",result.data.orgId1);
					}
					if(result.data.orgId2!=0){
						selectOrg("#orgId1",result.data.orgId2);
					}
					if(result.data.orgId3!=0){
						selectOrg("#orgId2",result.data.orgId3);
					}
					
					if(result.data.roleId1!=0){
						selectRole("#roleId",result.data.roleId1)
					}
					if(result.data.roleId2!=0){
						selectRole("#roleId1",result.data.roleId2)
					}
					if(result.data.roleId3!=0){
						selectRole("#roleId2",result.data.roleId3)
					}
					$("#phone").text(result.data.phone);
					$("#email").text(result.data.email);
					$("#loginPassword").text(result.data.loginPassword);
				}
			});

		});
		function selectOrg(orgs,orgId) {
			$.ajax({
				type : "POST",
				url : "orgController/getOrgById?oId="+orgId,
				dataType : "json",
				success : function(result) {
					var org = result.data.oName;
					$(orgs).text(org);
					
					
				},
				error : function(err) {
					alert("error");
				}
			});
		
		}
		
		function selectRole(roles,roleId) {

			$.ajax({
				type : "POST",
				url : "role/selectByKey?rId="+roleId,
				dataType : "json",
				success : function(result) {
					var role = result.data.role.rName;
					$(roles).text(role);
				},
				error : function(err) {
					alert("error");
				}
			});
		};
		

		$(function() {
			$(".permission-list dt input:checkbox").click(
					function() {
						$(this).closest("dl").find("dd input:checkbox").prop(
								"checked", $(this).prop("checked"));
					});
			$(".permission-list2 dd input:checkbox")
					.click(
							function() {
								var l = $(this).parent().parent().find(
										"input:checked").length;
								var l2 = $(this).parents(".permission-list")
										.find(".permission-list2 dd").find(
												"input:checked").length;
								if ($(this).prop("checked")) {
									$(this).closest("dl").find(
											"dt input:checkbox").prop(
											"checked", true);
									$(this).parents(".permission-list").find(
											"dt").first()
											.find("input:checkbox").prop(
													"checked", true);
								} else {
									if (l == 0) {
										$(this).closest("dl").find(
												"dt input:checkbox").prop(
												"checked", false);
									}
									if (l2 == 0) {
										$(this).parents(".permission-list")
												.find("dt").first().find(
														"input:checkbox").prop(
														"checked", false);
									}
								}
							});

			$("#form-admin-role-add").validate({
				rules : {
					roleNum : {
						required : true,
					},
					roleName : {
						required : true,
					},
					phone : {
						required : true,
					},
					email : {
						required : true,
						email : true
					}
				},
				onkeyup : false,
				focusCleanup : true,
				success : "valid",
				submitHandler : function(form) {
					$(form).ajaxSubmit();
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				}
			});
		});
	</script>
</body>
</html>
