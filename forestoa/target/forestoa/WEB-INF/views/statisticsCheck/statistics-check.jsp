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
			<div class="text-c ">
					
					
						<!-- <input id="org" type="text" name="0" onclick="showMenu();" class="input-text treeDemo" value="" placeholder="请选择组织"> -->
						
						<div id="menuContent" class="menuContent" style=" background:#FFFFFF;width: 250px;height: 200px; overflow-y: scroll;display:none; position: absolute;z-index:100;">
							<ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
						</div>
				<!-- <input id="org" type="text" name="0" onclick="showMenu();" class="input-text treeDemo" value="" placeholder="请选择组织"> -->
				<input type="text" name="0" id="org" placeholder="选择组织" onclick="showMenu();" style="width:250px" value="" class="input-text treeDemo">		
				 日期范围：
				<input type="text" onfocus="WdatePicker()" id="logmin" class="input-text Wdate" style="width:120px;" placeholder="首次打卡时间"> -
				<input type="text" onfocus="WdatePicker()" id="logmax" class="input-text Wdate" style="width:120px;" placeholder="末次打卡时间">
				<input type="text" name="" id="userName" placeholder="姓名" style="width:250px" class="input-text">
				<button name="" id="mysearch" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 查询</button>
				<button name="" id="reset" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 重置</button>
			
			<div class="mt-20">
			<table id="myTable" class="table table-border table-bordered table-bg table-hover table-sort table-responsive" style="width:100%">
				<thead>
					<tr class="text-c">
						<th width="80">序号</th>
						<th width="80">警号</th>
						<th width="120">姓名</th>
						<th width="60">首次打卡时间</th>
						<th width="120">末次打卡时间</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
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
        $("#myTable").dataTable({
		      	
		        	//"bAutoWidth": true,
		        	"pagingType": "simple_numbers",
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
		        ajax : function(data, callback, settings) {  
		                //封装请求参数  
		                //var param = userManage.getQueryCondition(data);
		        	data.userName = $("#userName").val();
		        	data.orgId = $("#org").attr("name");
	                var attenceStarttime= $("#logmin").val();//开始时间
	                var attenceEndtime= $("#logmax").val(); //结束时间
	                if(attenceStarttime!=null&&attenceStarttime.trim()!=""){
	                	data.attenceStarttime=attenceStarttime;
	                }
	                if(attenceEndtime!=null&&attenceEndtime.trim()!=""){
	                	data.attenceEndtime=attenceEndtime;
	               }
		                $.ajax({  
		                        type: "GET",  
		                        url: "attendance/selectAll",  
		                        cache : false,  //禁用缓存  
		                        data: data,    //传入已封装的参数  
		                        dataType: "json",  
		                        success: function(result) {  
		                                //异常判断与处理  
		                                if (result.errorCode) {  
		                                    alert("查询失败");  
		                                    return;  
		                                }  
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
		                        error: function(XMLHttpRequest, textStatus, errorThrown) {  
		                            alert("查询失败");  
		                        }  
		                    });  
		            },  
		            "columns": [//对接收到的json格式数据进行处理，data为json中对应的key
		            	{	
		            		"width":"10%",
		            		"data": null,
		                	"targets": 0
		                },
		                 {
		                	"width":"20%",
		                	"data": "user.userNumber"
		                },
		                 {
		                	"width":"20%",
		                	"data": "user.userName"
		                },
		                {
		                	"width":"20%",
		                	"data": "attenceStarttime"
		                },
		                {
		                	"width":"20%",
		                	"data": "attenceEndtime"
		                },
		               
		            ],
		            //渲染
		             "columnDefs": [
		            	  {
		                     targets: 3,
		                     data: "attenceStarttime",
		                     render: function (data) {
		                         return getMyDate(data);
		                     }
		                 },{
		                     targets: 4,
		                     data: "attenceEndtime",
		                     render: function (data) {
		                         return getMyDate(data);
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
						$('#myTable').attr("style","width=100%");
					 },
		        
		       
		    })}; 
		
		
		/*  var userManage = {  
		            getQueryCondition : function(data) {  
		                var param = {};    
		              	//组装查询条件
		               
		               	//param.attenceStarttime = $("#logmin").val();
		                //param.attenceEndtime = $("#logmax").val();
		                param.userName = $("#userName").val();
		                param.orgId = $("#org").attr("name");
		                var attenceStarttime= $("#logmin").val();//开始时间
		                var attenceEndtime= $("#logmax").val(); //结束时间
		                if(attenceStarttime!=null&&attenceStarttime.trim()!=""){
		                	 param.attenceStarttime=attenceStarttime;
		                }
		                if(attenceEndtime!=null&&attenceEndtime.trim()!=""){
		               	 param.attenceEndtime=attenceEndtime;
		               }
		                
		                
		                //组装分页参数  
		                param.start = data.start;  
		                param.length = data.length;  
		                param.draw = data.draw;  
		                return param;  
		            }}; */

		 $("#mysearch").click(function(){  
			 
			 $('#myTable').dataTable().fnDestroy();
		    	createTable();
	       /*   var table = $('#myTable').DataTable();
	      	 table.draw( false ); */
	        });
		 $("#reset").click(function(){  
			 var cityObj = $("#org");
				cityObj.attr("value", "请选择组织");
				cityObj.attr("name", 0);
				$("#userName").val("");
				$("#logmin").val("");
				$("#logmax").val("");
	         var table = $('#myTable').DataTable();
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
		    
		    
		    function formatDate(mydate) { 
		    	var now=new Date(mydate);
		    	var year=now.getYear(); 
		    	var month=now.getMonth()+1; 
		    	var date=now.getDate(); 
		    	var hour=now.getHours(); 
		    	var minute=now.getMinutes(); 
		    	var second=now.getSeconds(); 
		    	return year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second; 
		    	} 
		    
		    
		    
/*ztree树的配置*/		    
			
		    var setting = {
					view: {
						dblClickExpand: false
					},
					data: {
						key: {
	                        name: "oName"
	                    },
						simpleData: {
							 enable: true,
		                        idKey: "oId",
		                        pIdKey: "parenteId",
		                        rootPId: "",
		                        nameKey: "oName"
						}
					},
					callback: {
						beforeClick: beforeClick,
						onClick: onClick
					}
				};
		    
		    
		    function beforeClick(treeId, treeNode) {
				var check = (treeNode && !treeNode.isParent);
				if (!check) alert("只能选择具体部门...");
				return check;
			}
			
			function onClick(e, treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
				nodes = zTree.getSelectedNodes(),
				v = "";
				k="";
				nodes.sort(function compare(a,b){return a.id-b.id;});
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].oName + ",";
					k+=nodes[i].oId;
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				var cityObj = $("#org");
				cityObj.attr("value", v);
				cityObj.attr("name", k);
				
			}

			function showMenu() {
				var cityObj = $("#org");
				var cityOffset = $("#org").offset();
				$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

				$("body").bind("mousedown", onBodyDown);
			}
			function hideMenu() {
				$("#menuContent").fadeOut("fast");
				$("body").unbind("mousedown", onBodyDown);
			}
			function onBodyDown(event) {
				if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
					hideMenu();
				}
			}						
				$(document).ready(function(){
					var tree="#treeDemo";
		         	initializeZtree(tree);
				});
				//-->
			
				function initializeZtree(treeId){
		         	
		         	 $.ajax({
		                  type: "POST",
		                  url: "orgController/getOrgTree",
		                  data: {
		                      "oId": 1
		                  },
		                  dataType: "json",
		                  success: function (result) {
		                      zNodes = result.data;
		                      $.fn.zTree.init($(treeId), setting, zNodes);
		                  },
		                  error: function (err) {
		                      //alert("error");
		                  }
		              });
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
								$('#userTable').dataTable().fnDestroy();
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
