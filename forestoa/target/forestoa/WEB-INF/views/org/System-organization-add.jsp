<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>

<link rel="stylesheet" href="${ctxStatic}/css/header.css" />
</head>
<body>
	<article class="page-container">
			<form action="" method="post" class="form form-horizontal" id="form-member-add">
				<div class="row cl">
					<label id="parenteId" class="form-label col-xs-4 col-sm-2">所属上级组织：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" id="citySel" name="" readonly="true" onclick="showMenu(); return false;" class="input-text" value="" placeholder="请选择所属上级组织">
					</div>
					<label class="form-label col-xs-4 col-sm-2">组织名称：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="" placeholder="请输入组织名称" id="username">
					</div>

					<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
						<ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
					</div>
				</div>
				<div class="row cl">
					<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-5">
						<input class="btn btn-primary radius" id="btn" status="add" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
						<input type="button" onClick="layer_close();" class="btn btn-default radius" value="&nbsp;&nbsp;取消&nbsp;&nbsp;"></input>
					</div>
				</div>
			</form>
		</article>
	<script type="text/javascript">
			/*查看是否有组织id，有则进入编辑模式*/
			function GetQueryString(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if(r != null) return unescape(r[2]);
				return null;
			}
			var oId = GetQueryString("oId");
			if(oId != null && oId.trim().length > 0) {
				//console.log("修改组织，组织id为：" + oId);
				//修改组织
				getOrgById(oId);
			} else {
				//console.log("添加组织");
			}
			/*tree配置*/
			var setting = {
				view: {
					dblClickExpand: false
				},
				data: {
					key: {
						name: "oName"
					},
					simpleData: {
						enable: true,
						idKey: "oId",
						pIdKey: "parenteId",
						rootPId: ""
					}
				},
				callback: {
					beforeClick: beforeClick,
					onClick: onClick
				}
			};

			function beforeClick(treeId, treeNode) {
				return treeNode;

			}

			function onClick(e, treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
					nodes = zTree.getSelectedNodes(),
					v = "";
				k = "";
				nodes.sort(function compare(a, b) {
					return a.id - b.id;
				});
				for(var i = 0, l = nodes.length; i < l; i++) {
					v += nodes[i].oName + ",";
					k += nodes[i].oId;
				}
				if(v.length > 0) v = v.substring(0, v.length - 1);
				var cityObj = $("#citySel");
				$("#citySel").val(); //清空之前的值
				$("#citySel").val(v); //将oName给所属上级组织赋value值
				$("#citySel").attr("name", ""); //清空之前得name值
				$("#citySel").attr("name", k); //将oId给所属上级组织赋name值
				//cityObj.attr("value", v);
			}

			function showMenu() {
				var cityObj = $("#citySel");
				var cityOffset = $("#citySel").offset();
				$("#menuContent").css({
					left: cityOffset.left + "px",
					top: cityOffset.top + cityObj.outerHeight() + "px"
				}).slideDown("fast");

				$("body").bind("mousedown", onBodyDown);
			}

			function hideMenu() {
				$("#menuContent").fadeOut("fast");
				$("body").unbind("mousedown", onBodyDown);
			}

			function onBodyDown(event) {
				if(!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
					hideMenu();
				}
			}
			$(document).ready(function() {
				/*加载所有组织树查询*/
				$.ajax({
					url: 'orgController/getOrgTree',
					type: "POST",
					data: {
						"oId": 1
					},
					dataType: "json",
					success: function(result) {
						if(result.success) {
							zNodes = result.data;
							$.fn.zTree.init($("#treeDemo"), setting, zNodes);
						} else {
							//alert(result.msg);
							layer.msg(result.msg, {
								icon : 5,
								time : 1000
							});
						}
					},
					error: function(result) {
						console.log(result.msg);
					}
				});
			});
			/*根据oId查询组织*/
			function getOrgById(oId) {
				$.ajax({
					url:'orgController/getOrgById',
					type: "POST", 
					data: {
						"oId": oId
					},
					dataType: "json",
					success: function(result) {
						if(result.success) {
							//给组织名称框赋值
							$("#username").val(result.data.oName);
							/* 根据返回得父Id 查询对应得父节点名称*/
							if(result.data.parenteId == 0) {
								$("#citySel").attr("name", 0);
								$("#parenteId").hide();
								$("#citySel").hide();
							} else {
								$.ajax({
									type: "POST",
									url: 'orgController/getOrgById',
									data: {
										"oId": result.data.parenteId
									},
									dataType: "json",
									success: function(result) {
										if(result.success) {
											//给所属上级组织赋值
											$("#citySel").val(result.data.oName);
											//将oId给所属上级组织赋name值
											$("#citySel").attr("name", result.data.oId);
											//设置保存按钮为更新状态
											$("#btn").attr("status", "update");
										} else {
											//alert(result.msg);
											layer.msg(result.msg, {
												icon : 5,
												time : 1000
											});
										}
									},
									error: function(result) {
										console.log(result.msg);
									}
								});
							}
						} else {
							alert(result.msg);
						}
					},
					error: function(data) {
						console.log(data.msg);
					}
				});
			}
			//添加对象，更新对象
			function saveOrUpdate(url, org) {
				$.ajax({
					url: url,
					type: "POST",
					contentType: "application/json;charset=UTF-8",
					data: JSON.stringify(org),
					xhrFields: {
						withCredentials: true
					},
					success: function(data) {
						if(data.success) {
							//跳转到主界面
							window.location.href = ctx+"/Systemorganization";
							//重新加载
							window.parent.location.reload();
							//关闭弹出层
							//parent.layer.close(index);
						} else {
							//alert(data.msg);
							layer.msg(result.msg, {
								icon : 5,
								time : 1000
							});
						}
					},
					error: function(data) {
						console.log(data.msg);
					}
				})
			};

			/*提交事件*/
			$("#btn").click(function() {
				//获取父id
				var parenteId = $("input:text").attr("name");
				//获取组织名称
				var oName = $("#username").val();
				var parenteIdIsNull = false;
				var oNameIsNull = false;
				//查看当前按钮状态，新建还是更新
				var status = $("#btn").attr("status");
				//父id不能为空
				if(parenteId != null && parenteId != "undefined" && parenteId.trim().length > 0) {
					parenteIdIsNull = true;
				} else {
					parenteIdIsNull = false;
					alert("所属上级组织不能为空！");
				}
				//组织名称不能为空
				if(oName != null && oName != "undefined" && oName.trim().length > 0) {
					oNameIsNull = true;
				} else {
					alert("组织名称不能为空！");
					oNameIsNull = false;
				}
				if(parenteIdIsNull && oNameIsNull) {
					var btn_url = '';
					if(status == "add") {
						//console.log("添加对象");
						//封装组织对象
						var org = {
							"oName": oName,
							"parenteId": parenteId
						};
						//console.log(org);
						btn_url = "orgController/saveOrg";
					} else if(status == "update") {
						//console.log("更新对象");
						//封装组织对象
						var org = {
							"oId": oId,
							"oName": oName,
							"parenteId": parenteId
						};
						//console.log(org);
						btn_url = "orgController/updateOrg";;
					}
					//执行添加或更新ajax
					saveOrUpdate(btn_url, org);
				}
			});
		</script>

</body>
</html>
