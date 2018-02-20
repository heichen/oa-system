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
				<label>请选择时间:</label>
				<!--<input type="text" onclick="WdatePicker({dateFmt:'yyyy年'})" class="input-text Wdate" style="width:300px"/>-->
				<span class="select-box inline">
					<select id="enrollYear" name="" class="select">
						<option value="">请选择</option>
					</select>
				</span>
				<span class="select-box inline">
					<select name="" class="select" id="ARCHIVAL_PERIOD">
						<option value="">请选择存储年限</option>
						<option value="0">10年</option>
						<option value="1">30年</option>
						<option value="2">永久</option>
					</select>
				</span>
				<button name="" id="search_btn" class="btn btn-success" type="button"><i class="Hui-iconfont">&#xe665;</i> 查询</button>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
					<a class="btn btn-primary radius" data-title="打印目录"  href="javascript:;" id="directory_btn">
						<i class="Hui-iconfont"></i> 打印目录
					</a>
					<a class="btn btn-primary radius" data-title="批量打印"  href="javascript:;" id="batch_btn">
						<i class="Hui-iconfont"></i> 批量打印
					</a>
				</span>
			</div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive" id="archives_table">
					<thead>
						<tr class="text-c">
							<th>件号</th>
							<th>存储年限/年</th>
							<th>责任者</th>
							<th>文号</th>
							<th>题名</th>
							<th>日期</th>
							<th>页数</th>
							<th>备注</th>
						</tr>
					</thead>
					<tbody>
						<!--  <tr class="text-c">
							<td>2</td>
							<td>30</td>
							<td>
								<002></002>
							</td>
							<td>XXX部科员</td>
							<td>20171115</td>
							<td>关于xxxx</td>
							<td>2017-11-15</td>
							<td>5</td>
							<td></td>
						</tr>-->
					</tbody>
				</table>
			</div>
		</div>
		
	<div style="width: 1px; height: 1px; overflow: hidden;">
        <iframe id="iframe1" name="iframe1" src="" ></iframe>
    </div>
    
	<script type="text/javascript" src="${ctxStatic}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
		<script type="text/javascript">
		//打印目录
		$("#directory_btn").click(function(){
			var ARCHIVAL_PERIOD=$("#ARCHIVAL_PERIOD").find("option:selected").val();
			var enrollYear=$("#enrollYear").val();
			$.ajax({
				type: "GET",
				url: "workarchives/workarchivesDirectory",
				cache: false, //禁用缓存  
				data: {
					"ARCHIVAL_PERIOD":ARCHIVAL_PERIOD,
					"enrollYear":enrollYear
				},
				dataType: "json",
				success: function(result) {
					if (result.success) {
						directorynum=0;//打印的目录长度
						directorylist=result.data;
						excelFunc();
					} else {
						layer.msg(result.msg, {
							icon : 5,
							time : 1000
						});
					}			
				},
			});
		});
	
		var directorylist;
		var directorynum=0;//打印的目录长度
		 window. excelFunc = function(){
			if(directorynum<directorylist.length){
				 //加载文档打印页面（可传参)
	             document.getElementById("iframe1").src = ctx+"/ExcelPrint?filePath=" + directorylist[directorynum];
			}else{
				layer.msg('目录打印完成', {
				    time: 2000, //2s后自动关闭
				 });
				//打印完成之后，删除缓存目录
				$.ajax({
					type: "GET",
					url: "workarchives/workarchivesDelTemp",
					cache: false, //禁用缓存  
					data: {
					  "fileName":directorylist[0]
					},
					dataType: "json",
					success: function(result) {
						if (result.success) {
							
						} else {
						
						}			
					},
				});
			}
			directorynum++;
		};
		//批量打印正文
			$("#batch_btn").click(function(){
			var ARCHIVAL_PERIOD=$("#ARCHIVAL_PERIOD").find("option:selected").val();
			var enrollYear=$("#enrollYear").val();
			$.ajax({
				type: "GET",
				url: "workarchives/workarchivesPofile",
				cache: false, //禁用缓存  
				data: {
					"ARCHIVAL_PERIOD":ARCHIVAL_PERIOD,
					"enrollYear":enrollYear
				},
				dataType: "json",
				success: function(result) {
					if (result.success) {
						layer.confirm('当前查询出来的文件总共'+result.data.length+'份，确认打印？', function(index) {
							layer.msg('开始批量打印正文', {
							    time: 2000, //2s后自动关闭
							 });
							pofilenum=0;//打印的正文长度
							pofilelist=result.data;
							wordFunc();
						});
					} else {
						layer.msg(result.msg, {
							icon : 5,
							time : 1000
						});
					}			
				},
			});
		});
		
		var pofilelist;
		var pofilenum=0;//打印的正文长度
		 window. wordFunc = function(){
			if(pofilenum<pofilelist.length){
				 //加载文档打印页面（可传参)
	             document.getElementById("iframe1").src = ctx+"/WordPrint?filePath=" + pofilelist[pofilenum];
			}else{
				layer.msg('正文打印完成', {
				    time: 2000, //2s后自动关闭
				 });
			}
			pofilenum++;
		};
		
		/* $(function(){
			table_init();
		}); */
		
		$("#search_btn").click(function(){
			
			//还原初始化了的datatable
			$('#archives_table').dataTable().fnDestroy();
			table_init();
		});
		
		function addOptionsInEnrollYear() { 
			var time = new Date(); 
			var year = time.getFullYear(); 
			var oSelect = document.getElementById("enrollYear"); 

			 
			for(var j = year - 10; j <= year - 1; j++) { 
				var Option = document.createElement("option");  
				Option.setAttribute("value", "" + j);  
				Option.text = "" + j;  
				oSelect.appendChild(Option); 
			} 
		}
		addOptionsInEnrollYear();

		//加载表格
		function table_init(){
			var ARCHIVAL_PERIOD=$("#ARCHIVAL_PERIOD").find("option:selected").val();
			var enrollYear=$("#enrollYear").val();
			$('#archives_table').dataTable({
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
					data.ARCHIVAL_PERIOD=ARCHIVAL_PERIOD;
					data.enrollYear=enrollYear;
					$.ajax({
						type: "GET",
						url: "workarchives/workarchivesByPage",
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
						"width": "10%",//指定列宽
						"data": "ARCHIVAL_PERIOD",
						//渲染
						"render": function(data, type, row, meta) {
							//存档期限(0:10年 1:30年 2:永久存储)
							if(data=="0"){
								return "10年";
							}else if(data=="1"){
								return "30年";
							}else if(data=="2"){
								return "永久存储";
							}
						}
					},
					{
						"width": "10%",//指定列宽
						"data": "USER_NAME",
					},
					{
						"width": "10%",//指定列宽
						"data": "NUMBER"
					},
					{
						"width": "30%",//指定列宽
						"data": "TITLE"
					},
					{
						"width": "10%",//指定列宽
						"data": "CREATE_TIME",
					},
					{	"width": "10%",//指定列宽
						"data": "PAGES",
					},
					{	"width": "10%",//指定列宽
						"data": null,
						//渲染
						"render": function(data, type, row, meta) {
						 return "";
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
					$('#archives_table').attr("style","width=100%");
				 },
			});
		};
		</script>
</body>
</html>
