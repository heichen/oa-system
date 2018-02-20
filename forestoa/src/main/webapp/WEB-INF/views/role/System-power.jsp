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
	<div class="page-container">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
				<a href="javascript:;" onclick="product_add('添加权限节点','${ctx}/Systempoweradd')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加权限节点</a>
				</span>
			</div>
			<table id="role_table" class="table table-border table-bordered table-bg table-hover table-sort table-responsive mt-20" style="width:100%">
				<thead>
					<tr class="text-c">
						<th>编号</th>
						<th>名称</th>
						<th>权限</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<!--<tr class="text-c">
						<td>1</td>
						<td>xxx局长</td>
						<td>公文办理、简报办理</td>
						<td>
							<a title="编辑" href="javascript:;" onclick="product_edit('编辑','${ctx}/Systempoweredit','310')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
							<a title="删除" href="javascript:;" onclick="product_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					</tr>  -->	
				</tbody>
			</table>
		</div>
			<script type="text/javascript" src="${ctxStatic}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
			<script type="text/javascript">
			$(function() {
				//第一次加载表格
				createTable();
			});
			//初始化表格
			function createTable() {
				$('#role_table').dataTable({
					"pageLength": 10,//默认每页显示20条数据
					"serverSide": true, //服务器分页
					"searching": false, //关闭搜索框
					"ordering": false, //是否允许用户排序
					"bInfo": true, //是否显示页脚信息，DataTables插件左下角显示记录数
					"bLengthChange": false, //去掉每页多少条框体 
					"language": {
						"sProcessing": "处理中..."
					},
					"ajax": function(data, callback, settings) {
						$.ajax({
							type: "GET",
							url: "role/findByPage",
							cache: false, //禁用缓存  
							data: data, //传入已封装的参数  
							dataType: "json",
							success: function(result) {
								//封装返回数据  
								var returnData = {};
								returnData.draw = result.data.draw; //这里直接自行返回了draw计数器,应该由后台返回  
								returnData.recordsTotal = result.data.recordsTotal; //总记录数  
								returnData.recordsFiltered = result.data.recordsFiltered; //后台不实现过滤功能，每次查询均视作全部结果  
								returnData.data = result.data.data;
								//调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染  
								//此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕  
								callback(returnData);
							},
						});
					},
					"columns": [{
							"width": "10%",//指定列宽
							"data": null, //自动编号声明
							"targets": 0
							//"data": "rId"
						},
						{
							"width": "15%",
							"data": "rName"
						},
						{	
							"width": "65%",
							"data": "menus",
							//渲染
							"render": function(data, type, row, meta) {
								//type 的值  dispaly sort filter
								//代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
								//这里只处理了类型是显示的，过滤和排序返回原始数据
								var html = '';
								if(data.length > 0) {
									for(var i = 0; i < data.length; i++) {
										html += data[i].mName + '&nbsp;&nbsp;';
									}
								}
								return html;
							}
						},
						{
							"width": "10%",
							"data": "rId",
							//渲染
							"render": function(data, type, row, meta) {
								var html = '';
								html += '<a title="编辑" href="javascript:;" onclick="product_edit(\'编辑\',\''+ctx+'/Systempoweradd\',' + data + ')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>';
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
						$('#role_table').attr("style","width=100%");
					 },
				});
			};

			/*查看*/
			function product_show(title, url, id) {
				var index = layer.open({
					type: 2,
					title: title,
					content: url
				});
				layer.full(index);
			}
			/*添加*/
			function product_add(title, url) {
				var index = layer.open({
					type: 2,
					title: title,
					content: url,
					success: function(layero, index){
					    console.log(layero);
					    $(layero.selector).css('width','100%');
					 },
				});
				layer.full(index);
			};
			/*修改*/
			function product_edit(title, url, id) {
				var index = layer.open({
					type: 2,
					title: title,
					//打开新的页面之后，把当前要编辑的角色对象id传到url中，方便编辑页面使用
					content: url + '?rId=' + id,
					success: function(layero, index){
						 console.log(layero);
					    $(layero.selector).css('width','100%');
					 },
				});
				layer.full(index);
			};
			/*删除、撤销*/
			function product_del(obj, id) {
				layer.confirm('确认要删除吗？', function(index) {
					$.ajax({
						type: 'POST',
						url: "role/del",
						dataType: 'json',
						data: {
							"rId": id
						},
						success: function(data) {
							if(data.success) {
								$(obj).parents("tr").remove();
								layer.msg('已删除!', {
									icon: 1,
									time: 1000
								});

								//销毁表格
								$('#role_table').dataTable().fnDestroy();
								//重新绘制表格
								createTable();
							} else {
								//console.log(data.msg);
								layer.msg(data.msg, {
									icon: 1,
									time: 1000
								});
							}
						},
						error: function(data) {
							//console.log(data.msg);
							layer.msg(data.msg, {
								icon: 1,
								time: 1000
							});
						},
					});
				});
			};
		</script>
</body>
</html>
