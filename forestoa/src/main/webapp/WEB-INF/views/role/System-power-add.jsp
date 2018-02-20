<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>

<link rel="stylesheet" type="text/css" href="${ctxStatic}/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" href="${ctxStatic}/css/header.css" />
<style>
.permission-list>dd>dl>dt{
	width:110px;
}
</style>
</head>
<body>
	<div class="page-container">
		<form class="form form-horizontal" id="form-article-add">
	
			<div id="tab-system" class="HuiTab">
				<div class="row cl" style="display: inline-block; width: 680px;">
					<label class="form-label col-xs-4 col-sm-4">角色名称：</label>
					<div class="formControls col-xs-8 col-sm-4">
						<input type="text" class="input-text valid" value=""
							placeholder="" id="roleName" name="roleName" oId="">
					</div>
				</div>
				<div class="tabBar cl" style="height: 30px;margin-left:126px">
					<span>权限</span> <!--  <span>功能</span>-->
				</div>
				<div class="tabCon"
					style="height: 300px; overflow-y: scroll; overflow-x: hidden;margin-left:126px">
					<div class="row cl">
						<div class="formControls col-xs-8 col-sm-12 menu-list">
							<!--
							<dl class="permission-list">
									<dt>
								<label>
									<input type="checkbox" value="" name="user-Character-0" id="user-Character-0">
										公文管理模块
								</label>
							</dt>
									<dd>
										<dl class="cl permission-list2">
											<dt>
										<label class="">
											<input type="checkbox" value="" name="user-Character-0-0" id="user-Character-0-0">
											公文管理
										</label>
									</dt>
											<dt>
										<label class="">
											<input type="checkbox" value="" name="user-Character-0-0" id="user-Character-0-0">
											简报管理
										</label>
									</dt>
										</dl>
									</dd>
								</dl>
								-->
						</div>
					</div>
				</div>
			<!--	<div class="tabCon"
					style="height: 300px; overflow-y: scroll; overflow-x: hidden;">
					<div class="row cl">
						<div class="formControls col-xs-8 col-sm-9">
							
							<dl class="permission-list">
									<dt>
										<label>
										<input type="checkbox" value="" name="" id="">
											公文管理模块
										</label>
									</dt>
									<dd>
										<dl class="cl permission-list2">
											<dt>
												<label class="">
													<input type="checkbox" value="" name="" id="">
													查看详情
												</label>
											</dt>
											<dt>
												<label class="">
													<input type="checkbox" value="" name="" id="">
													同意
												</label>
											</dt>
											<dt>
												<label class="">
													<input type="checkbox" value="" name="" id="">
													驳回
												</label>
											</dt>
										</dl>
									</dd>
								</dl>
								
						</div>
					</div>
				</div>-->
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
					<input type="button" id="role_add" status="add"
						onClick="article_save_submit();" class="btn btn-primary radius"
						value="保存"></input> <input type="button" onClick="layer_close();"
						class="btn btn-default radius" value="取消"></input>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});
			$("#tab-system").Huitab({
				index : 0
			});

			//查看是否有角色id，有则进入编辑模式
			function GetQueryString(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return unescape(r[2]);
				return null;
			}
			var rId = GetQueryString("rId");
			if (rId != null && rId.trim().length > 0) {
				//console.log("修改角色，角色id为：" + rId);
				//修改业务
				selectByKey(rId);
			} else {
				//console.log("添加角色");
				//添加业务
				selectMenuTree();
			}
		});

		/**
		 * 全选事件
		 */
		function setcheckbox() {
			/*全选*/
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
		}

		//修改业务，根据rid查询角色
		function selectByKey(rId) {
			$.ajax({
				url : 'role/selectByKey',
				xhrFields : {
					withCredentials : true
				},
				data : {
					"rId" : rId
				},
				dataType : "json",
				success : function(data) {
					if (data.success) {
						var role = data.data.role;
						var menuTree = data.data.menuTree;
						var orgTree = data.data.orgTree;
						//角色名称
						$("#roleName").val(role.rName);
						$("#roleName").attr("rId", role.rId);

						//初始化菜单列表
						create_context_menu(menuTree);
						//设置保存按钮为更新状态
						$("#role_add").attr("status", "update");
					} else {
						layer.msg(data.msg, {
							icon : 5,
							time : 1000
						});
					}

				}
			})
		};

		//添加业务，查询所需的组织树与菜单树
		function selectMenuTree() {
			$.ajax({
				url : 'role/selectMenuTree',
				xhrFields : {
					withCredentials : true
				},
				dataType : "json",
				success : function(data) {
					if (data.success) {
						var menuTree = data.data.menuTree;

						//初始化菜单列表
						create_context_menu(menuTree);
						//设置保存按钮为更新状态
						$("#role_add").attr("status", "add");
					} else {
						layer.msg(data.msg, {
							icon : 5,
							time : 1000
						});
					}

				}
			})
		};

		//初始化中间菜单列表
		function create_context_menu(menuTree) {
			var menulist = "";
			//获取模板
			var template = $.templates("#menuTreeTmpl");
			//将模板与数据拼合得到html字符串
			var htmlOutput = template.render({
				"menuTree" : menuTree
			});

			$(".menu-list").html(htmlOutput);
			//注册全选事件
			setcheckbox();
		};

		//点击保存
		function article_save_submit() {
		
			//角色名称不为空标识
			var roleNameIsNull = false;

			var btn_url = "";
			//查看当前按钮状态，新建还是更新
			var status = $("#role_add").attr("status");
			//console.log(status);

			//获取全部菜单列表,主要的三个字段mId(菜单id),rmId(关联id),binDing是否选中（选中为1，默认为0）
			var menu_list = new Array();
			$("input:checkbox[name='menu_tree']").each(function() {
				//console.log($(this).attr("mId") + "---"+$(this).attr("rmId")+"---"+$(this).is(':checked'));
				var menu = {
					"mId" : $(this).attr("mId"),
					"binDing" : $(this).is(':checked') ? 1 : 0,
					"rmId" : $(this).attr("rmId")
				};
				menu_list.push(menu);
			});
			//console.log(menu_list);

			//获取角色名称
			var roleName = $("#roleName").val();
			//角色名称不能为空
			if (roleName != null && roleName != "undefined"
					&& roleName.trim().length > 0) {
				//console.log("从roleName中获取到角色名称=" + roleName);
				roleNameIsNull = true;
			} else {
				roleNameIsNull = false;
				//alert("角色名称不能为空");
				layer.msg("角色名称不能为空", {
					icon : 5,
					time : 1000
				});
			}

			//如果角色名称都不为空，则执行添加和修改操作
			if (roleNameIsNull) {
				var btn_url = '';
				if (status == "add") {
					//console.log("添加对象");
					//封装角色对象
					var role = {
						"rName" : roleName,
						"menus" : menu_list
					};
					//console.log(role);
					btn_url = "role/save";
				} else if (status == "update") {
					//console.log("更新对象");
					//封装角色对象
					var role = {
						"rId" : $("#roleName").attr("rId"),
						"rName" : roleName,
						"menus" : menu_list
					};
					//console.log(role);
					btn_url = "role/update";
				}
				//执行添加或更新ajax
				saveOrUpdate(btn_url, role);
			}
		};

		//添加对象，更新对象
		function saveOrUpdate(url, role) {
			$.ajax({
				url : url,
				type : "POST",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(role),
				xhrFields : {
					withCredentials : true
				},
				success : function(data) {
					if (data.success) {
						//保存成功跳转到主页面
						window.location.href = ctx + "/Systempower";
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
		};
		
		//子菜单选中事件
		function menu_second(el){
			//console.log($(el));
			//console.log($(el).context.checked);
			if ($(el).context.checked) {
				//console.log("被选中了");
				//console.log($(el).parent().parent().parent().parent().prev().find("input").attr("checked",true));
				var parenteId=$(el).attr("parenteId");
				//console.log(parenteId);
				$("#"+parenteId).prop('checked', true);
			}
		};
	</script>

	<!--menuTree模板-->
	<script id="menuTreeTmpl" type="text/x-jsrender">
			{{for menuTree}}
			<dl class="permission-list">
				<dt>
						<label>
							{{if binDing == 1}}
								<input name="menu_tree" type="checkbox" value="" mId="{{: mId}}" rmId="{{: rmId}}"  id="{{: mId}}"  checked="checked" >
							{{else}}
								<input name="menu_tree" type="checkbox" value="" mId="{{: mId}}" rmId="{{: rmId}}"  id="{{: mId}}"   >
  							{{/if}}
							{{: mName}}
						</label>
					</dt>
				<dd>
					<dl class="cl permission-list2">
						{{for childMenus}}
						<dt>
									<label class="">
										{{if binDing == 1}}
											<input name="menu_tree" type="checkbox" value="" mId="{{: mId}}" rmId="{{: rmId}}"  id="{{: mId}}" parenteId="{{:parenteId}}" checked="checked" onchange="menu_second(this)">
										{{else}}
											<input name="menu_tree" type="checkbox" value="" mId="{{: mId}}" rmId="{{: rmId}}"  id="{{: mId}}" parenteId="{{:parenteId}}" onchange="menu_second(this)">
  										{{/if}}
										{{: mName}}
									</label>
								</dt> {{/for}}
					</dl>
				</dd>
			</dl>
			{{/for}}
		</script>


</body>
</html>
