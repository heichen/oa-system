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
			<div class="text-c">
				 <label>科室:</label> <span class="select-box inline"> 
				 <select
					name="" class="select" id="q_oId">
						<option value="">请选择</option>
				</select>
				</span>
				<label>人员:</label>
				<span class="select-box inline"> 
				 <select
					name="" class="select" id="name">
						<option value="">请选择</option>
				</select>
				</span> 
				<label>日期范围：</label>
				<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:100px;"> -
				<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:100px;">
				
				<button name="" id="search_btn" class="btn btn-primary" type="submit"><i class="Hui-iconfont">&#xe6cf;</i> 查询</button>
			</div>
			<div class="mt-20">
				<table id="fallback_table" tablename="thistable" class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
					<thead>
						<tr class="text-c">
							<th>序号</th>
							<th>警号</th>
							<th>名字</th>
							<th>部门</th>
							<th>次数</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<!-- 	<tr class="text-c">
							<td>1</td>
							<td>1000</td>
							<td>张xx</td>
							<td>综合科</td>
							<td>7</td>
							<td class="f-14 td-manage">
								<input class="btn radius btn-secondary" onclick="product_show('查看详情','Statistics-fallback-datails.html','1000')" type="button" value="查看">
							</td>
						</tr> -->
					</tbody>
				</table>
			</div>
		</div>
			<script type="text/javascript" src="${ctxStatic}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
		<script type="text/javascript">
			 $(function(){
				 addOrg();
				 table_init();
			 });
			 $("#search_btn").click(function(){
					//还原初始化了的datatable
					$('#fallback_table').dataTable().fnDestroy();
					table_init();
				});
			 
			 
			 $("#q_oId").change(function(){
				 if($(this).val()!=null&&$(this).val()!=""){
					 addUser(); 
				 }else{
					$("#name").html("");
					 $("#name").append('<option value="'+'">请选择</option>');
				 }
				
				 
				 	/* a = $("#q_oId").val();
			        b = $("#q_oId option:checked").text();
			        alert("被选项目的值："+a+"，被选项目的显示值："+b+"。");
				 alert("sss"); */
				 
			 });
			 
			 
			//加载表格
				function table_init(){
					var q_oId=$("#q_oId").find("option:selected").val();
					var userName=$("#name").find("option:selected").val();
					var logmin=$("#logmin").val();
					var logmax=$("#logmax").val();
					$('#fallback_table').dataTable({
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
							data.logmin=logmin;
							data.logmax=logmax;
							data.q_oId=q_oId;
							data.userName=userName;
							$.ajax({
								type: "GET",
								url: "search/myDocBfBackByPage",
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
								"data": "USER_NUMBER"
							},
							{
								"width": "15%",//指定列宽
								"data": "USER_NAME"
							},
							{
								"width": "15%",//指定列宽
								"data": "O_NAME",
							},
							{
								"width": "15%",//指定列宽
								"data": "BACK_COUNT"
							},
							{
								"width": "30%",//指定列宽
								"data": "USER_ID",
								"render": function(data, type, row, meta) {
									//获取模板
									var template = $.templates("#selTmpl");
									//将模板与数据拼合得到html字符串
									var htmlOutput = template.render({
										"url" : ctx+'/Statisticsfallbackdatails',
										"uId":data
									});
									return htmlOutput;
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
							$('#fallback_table').attr("style","width=100%");
						 },
					});
				};
			/*详情*/
			function product_details(title, url, id, w, h) {
				var index = layer.open({
					type: 2,
					title: title,
					content: url
				});
				layer.full(index);
			}
			
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
			
			
			 function addUser(){
				$("#name").html("");
				var q_oId = $("#q_oId").val();
				$.ajax({
					type: 'POST',
					url: 'users/selectAllByOrg',
					data: {
						"orgId": q_oId
					},
					dataType: "json",
					success: function(result) {
						if(result.success) {
							$("#name").append('<option value="'+'">请选择</option>');
							for(var i=0;i<result.data.length;i++){
								var user=result.data[i];
									$("#name").append('<option value="'+user.userName+'">'+user.userName+'</option>');
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
			
			
			
			
			
			
			/*查看*/
			function product_sel(title, url, id) {
				var index = layer.open({
					type : 2,
					title : title,
					content : url+'?uId='+id,
				});
				layer.full(index);
			};
		</script>
		
		<script id="selTmpl" type="text/x-jsrender">
 			<a title="查看" href="javascript:;" onclick="product_sel('查看详情','{{:url}}','{{:uId}}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe665;</i></a>
	</script>
</body>
</html>
