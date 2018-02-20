<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>

<link rel="stylesheet" href="${ctxStatic}/css/header.css" />
<style type="text/css">
			.layui-layer-dialog{
				top: 158px !important;
			}
</style>
</head>
<body>
		<div class="page-container">
				<div class="text-c">
			<lable>标题:</lable>
			<input type="text" name="" id="q_title" placeholder="标题名称"
				style="width: 120px" class="input-text">
			<lable>文号:</lable>
			<input type="text" name="" id="q_number" placeholder="请输入发文号..."
				style="width: 110px" class="input-text">
			 <label>科室:</label> <span class="select-box inline"> <select
				name="" class="select" id="q_oId">
					<option value="">请选择</option>
			</select>
			</span>
			 <label>状态:</label> <span class="select-box inline"> <select
				name="" class="select" id="q_status">
					<option value="">请选择</option>
					<option value="0">待办</option>
					<option value="1">已办</option>
			</select>
			</span>
			<label>类型:</label> 
			<span class="select-box inline"> <select
				name="" class="select" id="q_mark">
					<option value="">请选择</option>
					<option value="1">公文发文</option>
					<option value="2">公文收文</option>
					<option value="3">简报发文</option>
					<option value="4">简报收文</option>
			</select>
			</span>
			 日期范围： <input type="text"
				onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })"
				id="logmin" class="input-text Wdate" style="width: 120px;">
			- <input type="text"
				onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })"
				id="logmax" class="input-text Wdate" style="width: 120px;">
			<button name="" id="search_btn" class="btn btn-success" type="button">
				<i class="Hui-iconfont">&#xe665;</i> 查询
			</button>
		</div>
			<div class="mt-20">
				<table id="manager_table" class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
					<thead>
						<tr class="text-c">
							<th>序号</th>
							<th>标题</th>
							<th>文号</th>
							<th>类型</th>
							<th>科室</th>
							<th>时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<!-- <tr class="text-c">
							<td>1</td>
							<td>关于XXXXX的调查 </td>
							<td>11</td>
							<td>信访</td>
							<td>2018-1-1</td>
							<td class="td-status"><span class="label label-success radius">办理中</span></td>
							<td class="f-14 td-manage">
							    <a title="查看" href="javascript:;" onclick="product_sel(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe665;</i></a>
								<a title="删除" href="javascript:;" onclick="product_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
							</td>
						</tr> -->
					</tbody>
				</table>
			</div>
		</div>
	<script type="text/javascript"
		src="${ctxStatic}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
			<script type="text/javascript">
			$(function(){
				addOrg();
				table_init();
			});
			$("#search_btn").click(function(){
				//还原初始化了的datatable
				$('#manager_table').dataTable().fnDestroy();
				table_init();
			});
			//加载表格
			function table_init(){
				var q_title=$("#q_title").val();
				var q_number=$("#q_number").val();
				var q_status=$("#q_status").find("option:selected").val();
				var q_mark=$("#q_mark").find("option:selected").val();
				var q_oId=$("#q_oId").find("option:selected").val();
				var logmin=$("#logmin").val();
				var logmax=$("#logmax").val();
				$('#manager_table').dataTable({
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
						data.q_title=q_title;
						data.q_number=q_number;
						data.q_status=q_status;
						data.logmin=logmin;
						data.logmax=logmax;
						data.q_mark=q_mark;
						data.q_oId=q_oId;
						$.ajax({
							type: "GET",
							url: "workTask/findMyDocBfByAllPage",
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
						},
						{
							"width": "15%",//指定列宽
							"data": "TITLE"
						},
						{
							"width": "15%",//指定列宽
							"data": "NUMBER"
						},
						{
							"width": "10%",//指定列宽
							"data": "mark",
							//渲染
							"render": function(data, type, row, meta) {
								if(data==1){
									return "公文发文";
								}else if(data==2){
									return "公文收文";
								}else if(data==3){
									return "简报发文";
								}else if(data==4){
									return "简报收文";
								}
							}
						},
						{
							"width": "20%",//指定列宽
							"data": "O_NAME"
						},
						{
							"width": "10%",//指定列宽
							"data": "CREATE_TIME"
						},
						{
							"width": "10%",//指定列宽
							"data": "isEnd",
							//渲染
							"render": function(data, type, row, meta) {
								if(data==0){
									return "未归档";
								}else{
									return "已归档";
								}
							}
						},
						{	"width": "10%",//指定列宽
							"data": "ID",
							"render": function(data, type, row, meta) {
								var html = '';
								var url="";
								if(row.mark==1){
									//"公文发文"
									url=ctx+'/documentSend/deleteDocumentSend?sendId='+data;
								}else if(row.mark==2){
									//"公文收文"
									url=ctx+'/documentReceive/deleteDocumentReceive?receiveId='+data;
								}else if(row.mark==3){
									//"简报发文"
									url=ctx+'/briefingSend/deleteBriefingSend?sendId='+data;
								}else if(row.mark==4){
									//"简报收文"
									url=ctx+'/briefingReceive/deleteBriefingReceive? receiveId='+data;
								}
								//渲染
								html+='<a title="删除" href="javascript:;" onclick="product_del(\''+url+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
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
						$('#manager_table').attr("style","width=100%");
					 },
				});
			};
			
			/*删除、撤销*/
			function product_del(url) {
				layer.confirm('确认要删除吗？', function(index) {
					$.ajax({
						type: 'POST',
						url: url,
						dataType: 'json',
						success: function(data) {
							if(data.success) {
								$(obj).parents("tr").remove();
								layer.msg('已删除!', {
									icon: 1,
									time: 1000
								});
								//删除之后，重新绘制表格
								$('#manager_table').dataTable().fnDestroy();
								table_init();
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
			function addOrg(){
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
							for(var i=0;i<result.data.length;i++){
								var org=result.data[i];
								if(org.parenteId!=0){
									$("#q_oId").append('<option value="'+org.oId+'">'+org.oName+'</option>');
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
			
		</script>
	</body>
</html>
