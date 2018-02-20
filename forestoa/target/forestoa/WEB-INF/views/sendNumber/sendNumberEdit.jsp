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
<article class="page-container">
			<form class="form form-horizontal" id="form-article-add">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">年份：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="" placeholder="" id="YEAR" name="YEAR" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">公文类型：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="" placeholder="" id="TYPE" name="TYPE" disabled="disabled">
					</div>
				</div>
				
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>序号：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="" placeholder="" id="NODE" name="NODE">
					</div>
				</div>


				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
						<input type="button" id="save"  class="btn btn-primary radius" value="保存"/>
						<input type="button" onClick="layer_close();" class="btn btn-default radius" value="&nbsp;&nbsp;取消&nbsp;&nbsp;"></input>
					</div>
				</div>
			</form>
		</article>
	<script type="text/javascript">
	var str = location.href; //取得整个地址栏
	var num = str.indexOf("?");
	str = str.substr(num + 1);
	var ID=strs = str.split("=")[1];
	<!--收发单位信息初始化-->
		$(document).ready(function() {
			var url = "sendNumber/selectById?" + str;
			$.ajax({
				type : "POST",
				url : url,
				dataType : "json",
				success : function(result) {
					var r = "";
					$("#YEAR").val(result.data.year);
					$("#NODE").val(result.data.node);
					
					var type=""
					if((result.data.type)==0){
						 type="赤森公发"
					};
					if((result.data.type)==1){
						 type="赤森公函发"
					};
					if((result.data.type)==2){
						 type="党务"
					};
					if((result.data.type)==3){
						 type="其他"
					};
					if((result.data.type)==4){
						 type="简报"
					};
					if((result.data.type)==5){
						 type="信息"
					};
					
					$("#TYPE").val(type);
					
					
				}
			});
		});	
		
		
		 $("#save").on("click",function(){
         	var node=$("#NODE").val();
         	
/*------------------------------------------------<formCheck>---------------------------------------------------*/
            if (node == "") {
				//layer.msg('单位名称不可以为空');
				layer.msg("序号不可为空", {
					icon : 5,
					time : 1000
				});
				return false;
			}
			
/*------------------------------------------------</formCheck>---------------------------------------------------*/
         	$.ajax({
         		type:"post",
         		url:"sendNumber/update",
         		data:{
         			"id":ID,
         			"node":node,
         			
         		},	 
         		
         		/* sucesss: function(data){	
       			  
        			 if (data.success == false) {
        				layer.msg(data.msg, {
							icon : 5,
							time : 1000
						});
                     }

                     if (data.success==true) {
                   	  
                       window.location.href = ctx+"/unitManage";
                       window.parent.location.reload();
                     }
        		 },  
        	 	 error:function () {
          		  }  */
         		
         		  success: function (data) {

                    if (data.success == false) {
                    	layer.msg(data.msg, {
							icon : 5,
							time : 1000
						});
                    }

                    if (data.success==true) {
                        window.location.href = ctx+"SendNumber";
                        window.parent.location.reload();
                    }
                },
                error: function () {
                }  
         		
         		
         		
         		   
         		
         	});
         });
		
		
            
	</script>
</body>
</html>
