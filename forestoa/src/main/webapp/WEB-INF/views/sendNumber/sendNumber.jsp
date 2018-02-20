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


		<div class="mt-20">
			<table id="unitTable"
				class="table table-border table-bordered table-bg table-hover table-sort table-responsive"
				style="width: 100%">
				<thead>
					<tr class="text-c">
						<th>编号</th>
						<th>年份</th>
						<th>发文类型</th>
						<th>序号</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>

	<script type="text/javascript"
		src="${ctxStatic}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		$(function() {
			//第一次加载表格
			createTable();
		});
		//初始化datatable

		function createTable() {
			$("#unitTable")
					.dataTable(
							{

								//"bAutoWidth": true,
								"pagingType" : "simple_numbers",
								"destroy" : true, //销毁表格对象
								//"aLengthMenu": [5, 10, 20],  //用户可自选每页展示数量 5条或10条
								"searching" : false,//禁用搜索（搜索框） */
								"serverSide" : false, //服务器分页
								"searching" : false, //关闭搜索框
								"ordering" : false, //是否允许用户排序
								"bInfo" : true, //是否显示页脚信息，DataTables插件左下角显示记录数
								"bLengthChange" : false, //去掉每页多少条框体 
								"language" : {
									"sProcessing" : "处理中..."
								},
								ajax : function(data, callback, settings) {
									
											$.ajax({
												type : "GET",
												url : "sendNumber/selectAll",
												cache : false, //禁用缓存  
												data : data, //传入已封装的参数  
												dataType : "json",
												success : function(result) {
													//异常判断与处理  
													if (result.errorCode) {
														layer.msg('查询失败', {
															icon: 1,
															time: 1000
														});
														return;
													}
													//封装返回数据  
													var returnData = {};
													returnData.data = result.data;
													//调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染  
													//此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕  
													callback(returnData);
												},
												error : function(
														XMLHttpRequest,
														textStatus, errorThrown) {
													layer.msg('查询失败', {
														icon: 1,
														time: 1000
													});
												}
											});
								},
								"columns" : [//对接收到的json格式数据进行处理，data为json中对应的key
								{

									"width" : "10%",

									"data" : null,
									"targets" : 0
								}, {
									"data" : "YEAR"
								}, {
									"data" : "TYPE"
								},

								{
									"data" : "NODE"
								},

								],
								//渲染
								"columnDefs" : [
									{
			                            targets: 2,
			                            data: "TYPE",
			                            render: function (data) {
			                            		if(data==""){
		                						return "";
		                						};
			                					if(data==0){
			                						return "赤森公发";
			                					};
			                					if(data==1){
			                						return "赤森公函发";
			                					};
			                					if(data==2){
			                						return "党务";
			                					};
			                					if(data==3){
			                						return "其他";
			                					};
			                					if(data==4){
			                						return "简报";
			                					};
			                					if(data==5){
			                						return "信息";
			                					};
			                					
			                                

			                            }
			                        },{
									"targets" : 4,
									"class" : "button",
									"bSortable" : false,
									"data" : function(data) {
									return '<a onclick=product_edit("公文文号编辑",\''+ctx+'/sendNumberEdit\',"'+data.ID+'") class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>'
												
									}
								},
								

								],
								"fnDrawCallback" : function() { //自动编号函数
									var api = this.api();
									//varstartIndex = api.context[0]._iDisplayStart; //获取到本页开始的条数 　
									api.column(0).nodes().each(
											function(cell, i) {
												cell.innerHTML = i + 1;
											});
								},
								"initComplete" : function(settings, json) {
									//初始化完成之后的回调函数
									$('#unitTable').attr("style", "width=100%");
								},

							})
		};

		/*修改*/
		function product_edit(title, url, id) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url + "?ID=" + id
			});
			layer.full(index);
		};
	</script>
</body>
</html>
