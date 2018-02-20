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
			<form action="" method="post" class="form form-horizontal" id="form-admin-role-add">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">处理人:</label>
					<div class="formControls col-xs-8 col-sm-4">
						<input type="text" id="citySel" name="" readonly="true" onclick="showMenu(); return false;" class="input-text" value="" placeholder="请选择指定人员">
					</div>
					<div id="menuContent" class="menuContent" style="display:none; position: absolute;width: 260px;height: 200px; overflow: auto;">
						<ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
					</div>
					<label class="form-label col-xs-4 col-sm-2">日期范围：</label>
					<div class="formControls col-xs-8 col-sm-4">
						<input id="logmin" type="text" onfocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"  class="input-text Wdate" style="width:150px;"> -
						<input id="logmax" type="text" onfocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"  class="input-text Wdate" style="width:150px;">
					</div>
				</div>
				
				<!-- <div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">日期范围：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="logmin" type="text" onfocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"  class="input-text Wdate" style="width:150px;"> -
						<input id="logmax" type="text" onfocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"  class="input-text Wdate" style="width:150px;">
					</div>
				</div> -->
				<div class="row cl">
					<div class="col-xs-7 col-sm-7 col-xs-offset-5 col-sm-offset-5">
						
						<input type="button" id="role_add" status="add"
						onClick="article_save();" class="btn btn-primary radius"
						value="保存"></input> 
						
						<input type="button" id="role_delete" status="add"
						onClick="article_delete();" class="btn btn-primary radius"
						value="一键收回"></input>
						
						<input type="button" onClick="layer_close();"
						class="btn btn-default radius" value="取消"></input>
					</div>
				</div>
			</form>
		</article> 
		
	<script type="text/javascript">
	
			function showMenu() {
				var cityObj = $("#citySel");
				var cityOffset = $("#citySel").offset();
				$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
		
				$("body").bind("mousedown", onBodyDown);
			};
			function hideMenu() {
				$("#menuContent").fadeOut("fast");
				$("body").unbind("mousedown", onBodyDown);
			};
			function onBodyDown(event) {
				if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
					hideMenu();
				}
			};
	
		//tree配置
		var setting = {
			/*check: {
				enable: true,
				chkStyle: "radio",
				radioType: "all"
			},*/
			
			view: {
				dblClickExpand: false,
				showLine: false,
				selectedMulti: false
			},
			data: {
				//显示得name值
				key: {
					name: "nodeName"
				},
				simpleData: {
					enable: true,
					idKey: "nodeId",
					pIdKey: "pId",
					rootPId: ""
				}
			},	
			callback: {
				//节点点击事件
				beforeClick: beforeClick

			}
		};

		function beforeClick(treeId, treeNode) {
			$("#citySel").val(); //清空之前的值
			$("#citySel").val(treeNode.nodeName); //
			$("#citySel").attr("name", ""); //
			$("#citySel").attr("name", treeNode.nodeId); //
			
			$("#menuContent").hide();//隐藏
		};
		
		//查看是否有角色id，有则进入编辑模式
		function GetQueryString(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
			var r = window.location.search.substr(1).match(reg);
			if (r != null)
				return unescape(r[2]);
			return null;
		}
		$(function(){
			var assignedUid = GetQueryString("uId");
			userTree(assignedUid);
		});
		
		//人员列表
		var users=null;
		var ud_id=null;
		function userTree(uId){
			/*加载所有组织树查询*/
			$.ajax({
				url: 'dispatched/getUserDispatched',
				type: "POST",
				data:{
					"uId":uId
				},
				dataType: "json",
				success: function(result) {
					if(result.success) {
						zNodes = result.data.userTree;
						users=zNodes;
						$.fn.zTree.init($("#treeDemo"), setting, zNodes);
						if(result.data.dispatched!=null){
							var dispatched=result.data.dispatched;
							ud_id=dispatched.udId;
							var acceptUid=dispatched.acceptUid;
							$("#logmin").val(dispatched.startTime);
							$("#logmax").val(dispatched.endTime);
							for(var i=0;i<zNodes.length;i++){
								if(zNodes[i].nodeId==acceptUid){
									$("#citySel").val(zNodes[i].nodeName); //
									$("#citySel").attr("name", zNodes[i].nodeId); //
									break;
								}
							}
						}
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
		};
		
		//保存按钮
		function article_save(){
			var acceptUname=$("#citySel").val(); //获取到的名称
			var acceptUid=$("#citySel").attr("name"); //获取到的id
			//console.log(acceptUid+acceptUname);
			var isUser=false;
			for(var i=0;i<zNodes.length;i++){
				if(zNodes[i].nodeId==acceptUid&&zNodes[i].nodeValue.trim()=="user"){
					isUser=true;
				}
			}
			var startTime=$("#logmin").val();//开始时间
			var endTime=$("#logmax").val();//结束时间
			
			if(!isUser){
				layer.msg("请指定一个具体人员", {
					icon : 5,
					time : 1000
				});
			}else{
				if(startTime!=null&&endTime!=null&&startTime.trim()!=""&&endTime.trim()!=""){
					var assignedUid = GetQueryString("uId");
					var post_data={
						"udId":ud_id,
						"assignedUid":assignedUid,
						"acceptUid":acceptUid,
						"startTime":startTime,
						"endTime":endTime,
						"valid":1
					};
					//满足条件提交
					$.ajax({
						url : "dispatched/save",
						type : "POST",
						contentType : "application/json;charset=UTF-8",
						data : JSON.stringify(post_data),
						xhrFields : {
							withCredentials : true
						},
						success : function(data) {
							if (data.success) {
								//保存成功跳转到主页面
								window.location.href = ctx + "/Systempersonnel";
								//重新加载
								window.parent.location.reload();
								//parent.layer.close(index);
							} else {
								layer.msg(data.msg, {
									icon : 5,
									time : 1000
								});
							}
						},
					})
				}else{
					layer.msg("开始时间，结束时间不能为空", {
						icon : 5,
						time : 1000
					});
				}
			}
			
		};
		
		
		
		
		
		
		//一键收回按钮
		function article_delete(){
			var assignedUid = GetQueryString("uId");
			 $.ajax({
                 type: "post",
                 url: "dispatched/updateValid",
                 data:{
                     "assignedUid":assignedUid,
                 },

                 success : function(data) {
						if (data.success) {
							//保存成功跳转到主页面
							window.location.href = ctx + "/Systempersonnel";
							//重新加载
							window.parent.location.reload();
							//parent.layer.close(index);
						} else {
							layer.msg(data.msg, {
								icon : 5,
								time : 1000
							});
						}
					},
                 error: function () {
                 }
             });
			
			
			
		};
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>
