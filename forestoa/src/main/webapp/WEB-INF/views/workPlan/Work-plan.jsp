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
			 日期范围：<!-- { maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' }  { minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' }-->
				<input type="text" onfocus="WdatePicker()" id="logmin" class="input-text Wdate" style="width:120px;"> -
				<input type="text" onfocus="WdatePicker()" id="logmax" class="input-text Wdate" style="width:120px;">
				<input type="text" id="workplanTitle" name="" id="" placeholder="姓名" style="width:250px" class="input-text">
				<button name="" id="btn_search"  class="btn btn-primary" type="button"><i class="Hui-iconfont">&#xe6cf;</i> 查询</button>
				<button name="" id="reset"  class="btn btn-primary" type="button"><i class="Hui-iconfont">&#xe6cf;</i> 重置</button>
			</div> 
			<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
				<a class="btn btn-primary radius" data-title="添加" data-href="" onclick="product_add('添加','${ctx}/Workplanadd')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加</a></span> 
			</div>
			<div class="mt-20">
				<table id="workPlanTable" class="table table-border table-bordered table-bg table-hover table-sort table-responsive" style="width:100%">
					<thead>
						<tr class="text-c">
							<th>编号</th>
							<!-- <th>警号</th> -->
							<th>姓名</th>
							<th>计划内容</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		
		<script type="text/javascript" src="${ctxStatic}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
		<script type="text/javascript">
		$(function() {
			//第一次加载表格
			createTable();
			
		});
    //初始化datatable
    
    	function createTable() {
        $("#workPlanTable").dataTable({
        	"pageLength": 10,//默认每页显示10条数据
            /*  //  "destroy": true,       //销毁表格对象
             "aLengthMenu": [5, 10, 20],  //用户可自选每页展示数量 5条或10条
             "searching": false,//禁用搜索（搜索框） */
             "serverSide": true, //服务器分页		
				"searching": false, //关闭搜索框
				"ordering": false, //是否允许用户排序
				"bInfo": true, //是否显示页脚信息，DataTables插件左下角显示记录数
				"bLengthChange": false, //去掉每页多少条框体 
			"language": {
				"sProcessing": "处理中..."
			},
            "ajax": function(data, callback, settings) {
            	//var param=noticeManage.getQueryCondition(data);
            	data.workplanTitle = $("#workplanTitle").val();//查询条件  
                var workplanStarttime= $("#logmin").val();//开始时间
                var workplanEndtime= $("#logmax").val(); //结束时间
                if(workplanStarttime!=null&&workplanStarttime.trim()!=""){
                	data.workplanStarttime=workplanStarttime;
                }
                if(workplanEndtime!=null&&workplanEndtime.trim()!=""){
                	data.workplanEndtime=workplanEndtime;
               }
				$.ajax({
					type: "POST",
					url: "workplan/selectAll",
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
            "columns": [//对接收到的json格式数据进行处理，data为json中对应的key
            	{	
            		"width":"5%",
            		"data": null,
                	"targets": 0
                },
               /*  {	
                	"width":"15%",
                	"data": "user.userNumber"
                }, */ 
                {
                	"width":"8%",
                	"data": "user.userName"
                }, {
                	"width":"50%",
                	"data": "workplanContent"
                },
                /* {
                	"width":"30%",
                	"data": "workplanContent"
                }, */
                {
                	"width":"8%",
                	"data": "workplanStarttime"
                },
                {
                	"width":"8%",
                	"data": "workplanEndtime"
                },
                /* {
                	"width":"10%",
                	"data": "workplanNoticetime"
                }, */
                {
                	"width":"8%",
                	"data": "status"
                },
               
            ],
            //渲染
             "columnDefs": [
                {
                    targets: 3,
                    data: "workplanStarttime",
                    render: function (data) {
                        return getMyDate(data);
                    }
                },
                {
                    targets: 4,
                    data: "workplanEndtime",
                    render: function (data) {
                        return getMyDate(data);
                    }
                },
                /* {
                    targets: 5,
                    data: "workplanNoticetime",
                    render: function (data) {
                        return getMyDate(data);
                    }
                }, */
                {
                    "targets": 6,
                    "class": "button",
                    "bSortable": false,
                    "data":function(data) {
                    	
                    	
                    	var user=${sessionScope.loginuser};
            			var userNumber=user.userNumber;
            			var userId=user.userId;
            			if(userId==data.workplanOwner){
            				
            				return  '<a onclick=product_show("工作计划查看",\''+ctx+'/Workplandetail\',"'+data.workplanId+'") class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe665;</i></a>'+
                            '<a  name="'+data.workplanOwner+'" onclick=product_edit("工作计划编辑",\''+ctx+'/Workplanedit\',"'+data.workplanId+'") class="ml-5 wpedit" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>'+
                            '<a  name="'+data.workplanOwner+'" onclick=product_del("工作计划删除","'+data.workplanId+'") class="ml-5 wpedit" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
            				
            				
            			}else{
            				return  '<a onclick=product_show("工作计划查看",\''+ctx+'/Workplandetail\',"'+data.workplanId+'") class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe665;</i></a>';
            				
            			}
                    	
                    	
                        
                    }
                }
              
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
				$('#workPlanTable').attr("style","width=100%");
			 },

        })
    };
			
    /* var noticeManage = {  
            getQueryCondition : function(data) {  
                var param = {};
                param.workplanTitle = $("#workplanTitle").val();//查询条件  
                var workplanStarttime= $("#logmin").val();//开始时间
                var workplanEndtime= $("#logmax").val(); //结束时间
                if(workplanStarttime!=null&&workplanStarttime.trim()!=""){
                	 param.workplanStarttime=workplanStarttime;
                }
                if(workplanEndtime!=null&&workplanEndtime.trim()!=""){
               	 param.workplanEndtime=workplanEndtime;
               }
               
               	//param.workplanStarttime=$("#starttime").val();
                //组装分页参数  
                param.start = data.start;  
                param.length = data.length;  
                param.draw = data.draw;  
                return param;  
            }};		 */
			
    $("#btn_search").click(function(){  
        /* var table = $('#workPlanTable').DataTable();
     	 table.draw( false ); */
     	 $('#workPlanTable').dataTable().fnDestroy();
    	createTable();
       });		
			
    $("#reset").click(function(){  
    	$("#workplanTitle").val("");
    	$("#logmin").val("");
    	$("#logmax").val("");
        var table = $('#workPlanTable').DataTable();
     	 table.draw( false );
       });	
			
  //将时间戳格式化
    function getMyDate(time){
        if(typeof(time)=="undefined"){
            return "";
        }
        var oDate = new Date(time),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth()+1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay);//最后拼接时间

        return oTime;
    };

    //补0操作,当时间数据小于10的时候，给该数据前面加一个0
    function getzf(num){
        if(parseInt(num) < 10){
            num = '0'+num;
        }
        return num;
    }
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			/*查看*/
			function product_show(title, url, id) {
				var index = layer.open({
					type: 2,
					title: title,
					content: url+"?workplanId="+id
				});
				layer.full(index);
			}
			/*查看*/
			function product_details(title, url, id) {
				var index = layer.open({
					type: 2,
					title: title,
					content: url+"?workplanId="+id
				});
				layer.full(index);
			}
			/*添加*/
			function product_add(title, url) {
				var index = layer.open({
					type: 2,
					title: title,
					content: url
				});
				layer.full(index);
			};
			/*修改*/
			function product_edit(title, url, id) {
				var index = layer.open({
					type: 2,
					title: title,
					content: url+"?workplanId="+id
				});
				layer.full(index);
			};
			 /*删除、撤销*/
			function product_del(obj, id) {
				layer.confirm('确认要删除吗？', function(index) {
					$.ajax({
						type: 'POST',
						url: "workplan/delete2",
						dataType: 'json',
						data: {
							"workplanId": id
						},
						success: function(data) {
							if(data.success) {
								$(obj).parents("tr").remove();
								layer.msg('已删除!', {
									icon: 1,
									time: 1000
								});

								//销毁表格
								$('#workPlanTable').dataTable().fnDestroy();
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
