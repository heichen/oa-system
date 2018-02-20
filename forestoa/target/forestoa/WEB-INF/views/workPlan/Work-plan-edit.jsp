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
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>工作标题：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="workplanTitle" type="text" class="input-text" value="" placeholder="" id="areaname" name="areaname">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>工作计划状态：</label>
					<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="articlecolumn" class="select" id="status">
					<option value="未开始">未开始</option>
					<option value="进行中">进行中</option>
					<option value="已结束">已结束</option>
				</select>
				</span> </div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>计划开始时间：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="workplanStarttime" type="text" onClick="WdatePicker()" id="datemin" class="input-text Wdate" style="width:180px;">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>计划结束时间：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="workplanEndtime" type="text" onClick="WdatePicker()" id="datemax" class="input-text Wdate" style="width:180px;">
					</div>
				</div>
				
				<!-- <div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">设置计划开始提醒时间：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="workplanNoticetime" type="text" onClick="WdatePicker()" class="input-text Wdate" style="width:180px;">
					</div>
				</div> -->

				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>详细内容：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<textarea id="workplanContent" class="textarea" cols="50" rows="10"></textarea> 
						<!-- <script id="editor" type="text/plain" style="width:100%;height:400px;"></script> -->
					</div>
				</div>

				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
						<button id="save" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
						<!-- <button onClick="article_save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 提交</button> -->
						<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
					</div>
				</div>
			</form>
		</article>

	<script type="text/javascript">
	
	
	var str = location.href; //取得整个地址栏
	var num = str.indexOf("?");
	str = str.substr(num + 1);
	var workplanId=strs = str.split("=")[1];
	<!--组织树,下拉框,人员信息初始化-->
		$(document).ready(function() {
			var url = "workplan/selectByKey?" + str;
			$.ajax({
				type : "POST",
				url : url,
				dataType : "json",
				success : function(result) {					
					$("#workplanTitle").val(result.data.workplanTitle);
					$("#workplanStarttime").val(getMyDate(result.data.workplanStarttime));
					$("#workplanEndtime").val(getMyDate(result.data.workplanEndtime));
					$("#workplanNoticetime").val(getMyDate(result.data.workplanNoticetime));
					$("#workplanContent").val((result.data.workplanContent));					
					var status= result.data.status
				    $("#status").find("option[value='"+status+"']").attr("selected",true); 
					
				}
			});

			

		});
	 //点击确定按钮向后台添加数据
    $("#save").on("click", function () {
        var workplanTitle = $("#workplanTitle").val();
        var workplanContent = $("#workplanContent").val();
        var workplanStarttime = $("#workplanStarttime").val();
        var workplanEndtime = $("#workplanEndtime").val();
        var workplanNoticetime=$("#workplanNoticetime").val();
        var status=$("#status").val();
/*------------------------------------------------<formCheck>---------------------------------------------------*/
      if(workplanTitle=="") {
        	  //layer.msg('工作计划不可以为空');
        	  layer.msg("工作计划标题不可以为空", {
					icon : 5,
					time : 1000
				});
            return false;
        }
     
        
        if(workplanContent=="") {
            //layer.msg('工作计划内容不可以为空');
            layer.msg("工作计划内容不可以为空", {
				icon : 5,
				time : 1000
			});
            return false;
        }
        if(workplanStarttime=="") {
            //layer.msg('工作计划的开始时间不可以为空');
            layer.msg("工作计划的开始时间不可以为空", {
				icon : 5,
				time : 1000
			});
            return false;
        }
        if(workplanEndtime=="") {
            //layer.msg('工作计划的结束时间不可以为空');
            layer.msg("工作计划的结束时间不可以为空", {
				icon : 5,
				time : 1000
			});
            return false;
        }

        
        if(status==0) {
            //layer.msg('工作计划的状态不可以为空');
            layer.msg("工作计划的状态不可以为空", {
				icon : 5,
				time : 1000
			});
            return false;
        }
         
        
/*------------------------------------------------</formCheck>---------------------------------------------------*/
        $.ajax({
            type: "post",
            url: "workplan/update",
            data:{
            	"workplanId":workplanId,
                "workplanTitle":workplanTitle,
                "workplanContent":workplanContent,
                "workplanStarttime":workplanStarttime,
                "workplanEndtime":workplanEndtime,
                "workplanNoticetime":workplanNoticetime,
                "status":status
            },

            success: function (data) {

                if (data.success == false) {
                	 layer.msg('失败，请重新填写并提交');
                }

                if (data.success==true) {
                  		 window.location.href = ctx+"/Workplan";
                		 window.parent.location.reload();
                   
                }
            },
            error: function () {
            }
        });

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
	
	
		</script>
</body>
</html>
