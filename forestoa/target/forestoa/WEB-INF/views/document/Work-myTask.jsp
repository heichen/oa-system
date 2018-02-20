<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" />
<title>赤峰市森林公安网上办公系统</title>
<style type="text/css">
body{
	overflow: auto; 
}
	.fl {
		float: left;
	}
	
	.fr {
		float: right;
	}
	
	.list li {
		/* height: 45px; */
		border-bottom: 1px solid #ccc;
	}
	
	.list li a {
		color: #000;
		font-size: 16px;
		display: block;
	}
	
	.list li span {
		font-size: 12px;
		color: #ccc;
	}
	p{
		margin-bottom: 20px;
	}
</style>
	</head>

	<body>
		<article class="page-container">
			<div class="row cl">
				<div class="formControls col-xs-12 col-md-6 col-sm-6">
					<div class="panel panel-primary mt-20">
						<div class="panel-header">公文-收文 <span class="menu_none" style="float: right;" id="doc_Receive_num">15</span></div>
						<div class="panel-body">
							<ul class="list" style="height: 138px;overflow-y:scroll ;" id="doc_Receive">
							<!--	<li>
									<p>
										<a onclick="product_detail('收文','File-document-receive.html')" href="javascript:void(0);">
											关于xxxxxxxx相关工作
										</a>
										<span class="fl">赤峰市森林公安局财务部</span>
										<span class="fr">2018-1-16</span>
									</p>
								</li>
							-->
							</ul>
						</div>
					</div>
				</div>
				<div class="formControls col-xs-12 col-md-6 col-sm-6">
					<div class="panel panel-secondary mt-20">
						<div class="panel-header">公文-发文<span class="menu_none" style="float: right;" id="doc_Send_num">15</span></div>
						<div class="panel-body">
							<ul class="list" style="height: 138px;overflow-y:scroll ;" id="doc_Send">
								<!--  
								<li>
									<p>
										<a href="javascript:void(0);">
											关于xxxxxxxx相关工作
										</a>
										<span class="fl">赤峰市森林公安局财务部</span>
										<span class="fr">2018-1-16</span>
									</p>
								</li>
								-->
							</ul>
						</div>
					</div>
				</div>
				<div class="formControls col-xs-12 col-md-6 col-sm-6">
					<div class="panel panel-success mt-20">
						<div class="panel-header">简报-收文 <span class="menu_none" style="float: right;" id="bf_Receivelist_num">15</span></div>
						<div class="panel-body">
							<ul class="list" style="height: 138px;overflow-y:scroll ;" id="bf_Receivelist">
							<!-- <li>
									<p>
										<a href="javascript:void(0);">
											关于xxxxxxxx相关工作
										</a>
										<span class="fl">赤峰市森林公安局财务部</span>
										<span class="fr">2018-1-16</span>
									</p>
								</li>
						 	-->
							</ul>
						</div>
					</div>
				</div>
				<div class="formControls col-xs-12 col-md-6 col-sm-6">
					<div class="panel panel-warning mt-20">
						<div class="panel-header">简报-发文<span class="menu_none" style="float: right;" id="bf_Sendlist_num">15</span></div>
						<div class="panel-body">
							<ul class="list" style="height: 138px;overflow-y:scroll ;" id="bf_Sendlist">
						<!-- <li>
									<p>
										<a href="javascript:void(0);">
											关于xxxxxxxx相关工作
										</a>
										<span class="fl">赤峰市森林公安局财务部</span>
										<span class="fr">2018-1-16</span>
									</p>
								</li> 
							 -->	
							</ul>
						</div>
					</div>
				</div>
			</div>
		</article>
		<script type="text/javascript">
			/*查看*/
			function product_detail(title, url, id) {
				var index = layer.open({
					type: 2,
					title: title,
					content: url
				});
				layer.full(index);
			}
			$(function(){
				$.ajax({
					url : 'workTask/getToDoTask',
					success : function(data) {
						if (data.success) {
							//获取模板
							var template = $.templates("#listTmpl");
							
							if(data.data.docReceive!=null&&data.data.docReceive.length>0){
								$("#doc_Receive_num").text(data.data.docReceive.length);
								$("#doc_Receive_num").attr("class","badge badge-danger");
								//将模板与数据拼合得到html字符串
								var docReceivehtmlOutput = template.render({
									"data" : data.data.docReceive,
									"title":"公文收文",
									"url":ctx+"/Filedocumentreceivedetail"
								});
								$("#doc_Receive").html(docReceivehtmlOutput);
							}
						
							if(data.data.docSend!=null&&data.data.docSend.length>0){
								$("#doc_Send_num").text(data.data.docSend.length);
								$("#doc_Send_num").attr("class","badge badge-danger");
								//将模板与数据拼合得到html字符串
								var docSendhtmlOutput = template.render({
									"data" : data.data.docSend,
									"title":"公文发文",
									"url":ctx+"/Filedocumentsenddetail"
								});
								$("#doc_Send").html(docSendhtmlOutput);
							}
							
							if(data.data.bfReceivelist!=null&&data.data.bfReceivelist.length>0){
								$("#bf_Receivelist_num").text(data.data.bfReceivelist.length);
								$("#bf_Receivelist_num").attr("class","badge badge-danger");
								//将模板与数据拼合得到html字符串
								var docSendhtmlOutput = template.render({
									"data" : data.data.bfReceivelist,
									"title":"简报收文",
									"url":ctx+"/Filebriefingreceivedetail"
								});
								
								$("#bf_Receivelist").html(docSendhtmlOutput);
							}
							
							if(data.data.bfSendlist!=null&&data.data.bfSendlist.length>0){
								$("#bf_Sendlist_num").text(data.data.bfSendlist.length);
								$("#bf_Sendlist_num").attr("class","badge badge-danger");
								//将模板与数据拼合得到html字符串
								var docSendhtmlOutput = template.render({
									"data" : data.data.bfSendlist,
									"title":"简报发文",
									"url":ctx+"/Filebriefingsenddetail"
								});
								
								$("#bf_Sendlist").html(docSendhtmlOutput);
							}
						
						} else {
							layer.msg(data.msg, {
								icon : 5,
								time : 1000
							});
						}

					}
				});
			});
		</script>
		
	<!--列表通用模板-->
	<script id="listTmpl" type="text/x-jsrender">
			{{for data}}
				<li>
					<p>
						<a onclick="product_detail('{{:#parent.parent.data.title}}','{{:#parent.parent.data.url}}?taskId={{:TASK_ID}}')" href="javascript:void(0);">
							{{: TITLE}}
						</a>
						<span class="fl">{{: O_NAME}}</span>
						<span class="fr">{{: START_TIME}}</span>
					</p>
				</li>
			{{/for}}
	</script>
		
	</body>

</html>
