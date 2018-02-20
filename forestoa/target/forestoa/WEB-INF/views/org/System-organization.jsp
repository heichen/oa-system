<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>

<link rel="stylesheet" href="${ctxStatic}/css/header.css" />

</head>
<body class="pos-r">
	<div class="pos-a"
		style="width: 248px; left: 0; top: 0; bottom: 0; border-right: 1px solid #e5e5e5; overflow: auto; text-align: center;">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div style="margin-left: 248px;">
		<!--<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 账号权限管理 <span class="c-gray en">&gt;</span> 组织管理
				<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
			</nav>-->
		<div class="page-container">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"> <a class="btn btn-primary radius"
					onclick="product_add('添加','${ctx}/Systemorganizationadd')"
					href="javascript:;"> <i class="Hui-iconfont">&#xe600;</i> 添加
				</a></span>
			</div>
			<div class="mt-20">
				<table id="org_table"
					class="table table-border table-bordered table-bg table-hover table-sort table-responsive"  style="width:100%">
					<thead>
						<tr class="text-c">
							<th>编号</th>
							<th>组织名称</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${ctxStatic}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
			//tree配置
			var setting = {
				/*	check: {
					enable: true,
					chkStyle: "radio", //单选框
					radioType: "all" //对所有节点设置单选
				},*/
				view: {
					dblClickExpand: false,
					showLine: false,
					selectedMulti: false
				},
				data: {
					//显示得name值
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
					//节点点击事件
					beforeClick: beforeClick

				}
			};

			function beforeClick(treeId, treeNode) {
				//还原初始化了的datatable
				$('#org_table').dataTable().fnDestroy();
				//重新加载数据
				addDatable(treeNode.oId);
			}

			function addDatable(datas) {
				/*datable加载数据*/
				$('#org_table').dataTable({
					"pageLength": 10,//默认每页显示20条数据
					"searching": false, //关闭搜索框
					"ordering": false, //是否允许用户排序
					"bLengthChange": false, //去掉每页多少条框体 
					"ajax": {
						url: 'orgController/getOrgTree?oId=' + datas,
						dataSrc: function(result) {
							return result.data;
						}
					},
					"columns": [{
							"width": "5%",//指定列宽
							"data": null, //自动编号声明
							"targets": 0
						},
						{
							"data": "oName"
						},
						{
							"data": "oId",
							//渲染
							"render": function(data, type, row, meta) {
								var html = '';
								html += '<a title="编辑" href="javascript:;" onclick="product_edit(\'编辑\',\''+ctx+'/Systemorganizationadd\',' + data + ')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>'
								html += '<a title="删除" href="javascript:;" onclick="product_del(this,' + data + ')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
								return html;
							}
						},
					],
					"fnDrawCallback": function() { //自动编号函数
						var api = this.api();
						//varstartIndex = api.context[0]._iDisplayStart; //获取到本页开始的条数 　
						api.column(0).nodes().each(function(cell, i) {
							cell.innerHTML = i + 1;
						});
					},
					"initComplete": function(settings, json) {
					    //初始化完成之后的回调函数
						$('#org_table').attr("style","width=100%");
					 },

				});
			}
			function addZtree(){
			//加载Ztree树
			$.ajax({
				type: 'POST',
				url: 'orgController/getOrgTree',
				data: {
					"oId": 1
				},
				dataType: "json",
				success: function(result) {
					if(result.success) {
						var t = $("#treeDemo");
						var zTree = $.fn.zTree.getZTreeObj("tree");
						var zNodes = result.data;
						t = $.fn.zTree.init(t, setting, zNodes);
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
			$(document).ready(function() {
				//默认首次加载所有的数据
				addDatable(1);
				addZtree();

			});
			/*添加*/
			function product_add(title, url) {
				var index = layer.open({
					type: 2,
					title: title,
					content: url
				});
				layer.full(index);
			}
			/*编辑*/
			function product_edit(title, url, id) {
				var index = layer.open({
					type: 2,
					title: title,
					content: url + '?oId=' + id
				});
				layer.full(index);
			}
			/*删除*/
			function product_del(obj, id) {
				layer.confirm('确认要删除吗？', function(index) {
					$.ajax({
						type: 'POST',
						url: 'orgController/deleteOrg',
						data: {
							"oId": id
						},
						dataType: 'json',
						success: function(data) {
							if(data.success) {
								$(obj).parents("tr").remove();
								layer.msg('已删除!', {
									icon: 1,
									time: 1000
								});
								//重新加载ztree树
								addZtree();
								//还原初始化了的datatable
								$('#org_table').dataTable().fnDestroy();
								//重新加载数据
								addDatable(1);
								//getOrgById(id);
							} else {
								//alert(data.msg);
								layer.msg(data.msg, {
									icon : 5,
									time : 1000
								});
							}
						},
						error: function(data) {
							console.log(data.msg);
						}
					});
				});
			};
			/*根据oId查询组织*/
			/*function getOrgById(oId) {
				$.ajax({
					type: "POST",
					url: config_url + '/orgController/getOrgById',
					data: {
						"oId": oId
					},
					dataType: "json",
					success: function(result) {
						if(result.success) {
							//还原初始化了的datatable
							$('#org_table').dataTable().fnDestroy();
							//重新加载数据
							addDatable(result.data.parenteId);
						} else {
							alert(result.msg);
						}
					},
					error: function(data) {
						console.log(data.msg);
					}
				});
			}*/
		</script>
</body>
</html>
