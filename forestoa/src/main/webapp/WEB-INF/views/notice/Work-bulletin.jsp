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
				<!-- 日期范围：
				<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;"> -
				<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">-->
				<input type="text" id="Type" name="" id="" placeholder="通知标题" style="width:250px" class="input-text">
				<button name="" id="btn_search"  class="btn btn-primary" type="button"><i class="Hui-iconfont">&#xe6cf;</i> 查询</button>
				<button name="" id="reset"  class="btn btn-primary" type="button"><i class="Hui-iconfont">&#xe6cf;</i> 重置</button>
			</div> 
			<div id="add" class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
				<a  class="btn btn-primary radius" data-title="添加" data-href="" onclick="product_add('通知通告添加','${ctx}/Workbulletinadd')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加</a></span> 
			</div>
			<div class="mt-20">
				<table id="noticeTable" class="table table-border table-bordered table-bg table-hover table-sort table-responsive" style="width:100%">
					<thead>
						<tr class="text-c">
								<th>序号</th>
								<th>通知标题</th>
								<th>通知创建时间</th>
								<th>通知类型</th>
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
		var sendByAdmin='<%=request.getAttribute("sendByAdmin")%>';
		var user = ${sessionScope.loginuser};
		$(function() {
			//是否隐藏添加按钮
			if(sendByAdmin=="true"){
				var user=${sessionScope.loginuser};
				
				
				if(user.userNumber!="admin"){
					
					$('#add').hide();
					
				}  
				
			}
			//第一次加载表格
			if((user.userId)==1000){
				createTable1();
			}else{
				createTable();
			}
			
		});
    //初始化datatable
    
    	function createTable() {
        $("#noticeTable").dataTable({
        	//"bAutoWidth": true,
            "destroy": true,       //销毁表格对象
            //"aLengthMenu": [5, 10, 20],  //用户可自选每页展示数量 5条或10条
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
            	var param=noticeManage.getQueryCondition(data);
				$.ajax({
					type: "POST",
					url: "userNotice/selectAll",
					cache: false, //禁用缓存  
					data: param, //传入已封装的参数  
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
			"createdRow":function(row,data,index){
                if (data.status==0) {
                    $('td',row).css('color','red');
                  }
                },
            "columns": [//对接收到的json格式数据进行处理，data为json中对应的key
            	{
            		"width":"5%",
            		"data": null,
                	"targets": 0
                },
                {
                	"width":"20%",
                	"data": "notice.noticeTitle"
                },
                {
                	"width":"10%",
                	"data": "notice.noticeCreatetime"
                },
                {
                	"width":"10%",
                	"data": "notice.noticeType"
                },
                 {
                	"width":"10%",
            	"data": "status"
            }, 
               
            ],
            //渲染
             "columnDefs": [
            	 {	
            		 "width":"10%",
            		 "targets": 2,
            		 "data": "nWriteTime",
                     "render": function (data) {
                         return getMyDate(data);
                     }
            		 
            	 },
            	 {	
            		 "width":"10%",
            		 "targets": 4,
            		 "data": "status",
            		 "createdCell": function (td, data, rowData, row, col) {
            		      if (data=='1') {
            		        $(td).css('color', 'red')
            		      }
            		 },
                     "render": function (data) {
                    	 if(data=='1'){
                    		 return "已阅";
                    	 }
                    	 else{
                    		
                    		    
                    		 return "未阅";
                    		 }
                     }
            		 
            	 },
            	 
                {	
            		 "width":"15%",
                    "targets": 5,
                    "class": "button",
                    "bSortable": false,
                    "data":function(data) {
                        return  '<a onclick=product_details("通知通告查看",\''+ctx+'/Workbulletindetail\',"'+data.noticeId+'") class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe665;</i></a>';
                            
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
				$('#noticeTable').attr("style","width=100%");
			 },

        })
    };
    
    
    
  //初始化datatable
    
	function createTable1() {
    $("#noticeTable").dataTable({
    	//"bAutoWidth": true,
        "destroy": true,       //销毁表格对象
        //"aLengthMenu": [5, 10, 20],  //用户可自选每页展示数量 5条或10条
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
        	var param=noticeManage.getQueryCondition(data);
			$.ajax({
				type: "POST",
				url: "notice/selectAll",
				cache: false, //禁用缓存  
				data: param, //传入已封装的参数  
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
		"createdRow":function(row,data,index){
            if (data.status==0) {
                $('td',row).css('color','red');
              }
            },
        "columns": [//对接收到的json格式数据进行处理，data为json中对应的key
        	{
        		"width":"5%",
        		"data": null,
            	"targets": 0
            },
            {
            	"width":"20%",
            	"data": "noticeTitle"
            },
            /* {
            	"width":"20%",
            	"data": "noticeContent"
            }, */
            {
            	"width":"10%",
            	"data": "noticeCreatetime"
            },
            {
            	"width":"10%",
            	"data": "noticeType"
            },
             {
            	"width":"10%",
        	"data": "remarks3"
        }, 
           
        ],
        //渲染
         "columnDefs": [
        	 {	
        		 "width":"10%",
        		 "targets": 2,
        		 "data": "nWriteTime",
                 "render": function (data) {
                     return getMyDate(data);
                 }
        		 
        	 },
        	 {	
        		 "width":"10%",
        		 "targets": 4,
        		 "data": "status",
        		 "createdCell": function (td, data, rowData, row, col) {
        		      if (data=='1') {
        		        $(td).css('color', 'red')
        		      }
        		 },
                 "render": function (data) {
                	 if(data=='正确'){
                		 return "发送成功";
                	 }else{
                		 return "发送失败";
                	 }
                      
                 }
        		 
        	 },
        	 
            {	
        		 "width":"15%",
                "targets": 5,
                "class": "button",
                "bSortable": false,
                "data":function(data) {
                    return  '<a onclick=product_details("通知通告查看",\''+ctx+'/Workbulletindetail\',"'+data.noticeId+'") class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe665;</i></a>';
                        
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
			$('#noticeTable').attr("style","width=100%");
		 },

    })
};
    		
    var noticeManage = {  
            getQueryCondition : function(data) {  
                var param = {};    
                param.noticeTitle = $("#Type").val();//查询条件  
                //组装分页参数  
                param.start = data.start;  
                param.length = data.length;  
                param.draw = data.draw;  
                return param;  
            }};		
			
    $("#btn_search").click(function(){  
        var table = $('#noticeTable').DataTable();
     	 table.draw( false );
       });	
    $("#reset").click(function() {
		$("#Type").val("");
		var table = $('#noticeTable').DataTable();
		table.draw(false);
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
            oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间

        return oTime;
    };

    //补0操作,当时间数据小于10的时候，给该数据前面加一个0
    function getzf(num){
        if(parseInt(num) < 10){
            num = '0'+num;
        }
        return num;
    }
    
    
			

			function product_details(title, url, id) {
				var index = layer.open({
					type: 2,
					 closeBtn: 0, 
					title: title,
					content: url+"?noticeId="+id
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
					content: url+"?noticeId="+id
				});
				layer.full(index);
			};
			 /*删除、撤销*/
			function product_del(obj, id) {
				layer.confirm('确认要删除吗？', function(index) {
					$.ajax({
						type: 'POST',
						url: "notice/delete2?noticeId="+id,
						dataType: 'json',
						success: function(data) {
							if(data.success) {
								$(obj).parents("tr").remove();
								layer.msg('已删除!', {
									icon: 1,
									time: 1000
								});

								//销毁表格
								$('#userTable').dataTable().fnDestroy();
								//重新绘制表格
								createTable();
							} else {
								layer.msg(data.msg, {
									icon: 1,
									time: 1000
								});
							}
						},
						error: function(data) {
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
