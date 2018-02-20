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
					<label class="form-label col-xs-4 col-sm-2">工作标题：</label>
					<div class="formControls col-xs-8 col-sm-9 mt-5">
						<!-- <input id="workplanTitle" type="text" class="input-text" value="" placeholder="" disabled> -->
						<span id="workplanTitle"></span>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>通知/通告状态：</label>
					<div class="formControls col-xs-8 col-sm-9 mt-5">
				<!-- <input id="status" type="text" class="input-text" value="" placeholder=""  disabled> -->
					<span id="status"></span>
				 </div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">计划开始时间：</label>
					<div class="formControls col-xs-8 col-sm-9 mt-5">
						<!-- <input id="workplanStarttime" type="text" class="input-text" style="width:180px;" disabled> -->
						<span id="workplanStarttime"></span>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">计划结束时间：</label>
					<div class="formControls col-xs-8 col-sm-9 mt-5">
						<!-- <input id="workplanEndtime" type="text"  id="datemax" class="input-text" style="width:180px;" disabled> -->
						<span id="workplanEndtime"></span>
					</div>
				</div>
				
				<!-- <div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">设置计划开始提醒时间：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="workplanNoticetime" type="text"  class="input-text" style="width:180px;" disabled>
					</div>
				</div> -->

				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">详细内容：</label>
					<div class="formControls col-xs-8 col-sm-9 mt-5">
						<textarea id="workplanContent" class="textarea" cols="50" rows="10" disabled>在这里输入内容...</textarea> 
						<!-- <script id="editor" type="text/plain" style="width:100%;height:400px;"></script> -->
					</div>
				</div>

				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
						<!-- <button id="save" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存</button> -->
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
					$("#workplanTitle").text(result.data.workplanTitle);
					$("#workplanStarttime").text(getMyDate(result.data.workplanStarttime));
					$("#workplanEndtime").text(getMyDate(result.data.workplanEndtime));
					$("#workplanNoticetime").val(getMyDate(result.data.workplanNoticetime));
					$("#workplanContent").val((result.data.workplanContent));
					$("#status").text((result.data.status));
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
