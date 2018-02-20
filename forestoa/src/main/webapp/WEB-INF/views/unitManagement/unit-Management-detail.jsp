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
					<label class="form-label col-xs-4 col-sm-2">单位名称：</label>
					<div class="formControls col-xs-8 col-sm-9 mt-5">
						<!-- <input type="text" class="input-text" value="" placeholder="" id="name" name="name" disabled="disabled"> -->
						<span  id="name" name="name"></span>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">单位负责人：</label>
					<div class="formControls col-xs-8 col-sm-9 mt-5">
						<!-- <input type="text" class="input-text" value="" placeholder="" id="manager" name="manager" disabled="disabled"> -->
						<span id="manager" name="manager"></span>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">单位类型：</label>
					<div class="formControls col-xs-8 col-sm-9 mt-5">
						<!-- <input type="text" class="input-text" value="" placeholder="" id="status" name="status" disabled="disabled"> -->
						<span id="status" name="status"></span>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">联系电话：</label>
					<div class="formControls col-xs-8 col-sm-9 mt-5">
						<!-- <input type="text" class="input-text" value="" placeholder="" id="phone" name="phone" disabled="disabled"> -->
						<span id="phone" name="phone"></span>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">单位地址：</label>
					<div class="formControls col-xs-8 col-sm-9 mt-5">
						<!-- <input type="text" class="input-text" value="" placeholder="" id="remarks1" name="remarks1" disabled="disabled"> -->
						<span id="remarks1" name="remarks1"></span>
					</div>
				</div>

				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
						<!-- <button id="save" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button> -->
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
	var unitId=strs = str.split("=")[1];
	<!--收发单位信息初始化-->
		$(document).ready(function() {
			//alert(str)
			var url = "unit/selectByKey?" + str;
			$.ajax({
				type : "POST",
				url : url,
				dataType : "json",
				success : function(result) {
					var r = "";
					$("#name").text(result.data.name);
					$("#manager").text(result.data.manager);
					$("#phone").text(result.data.phone);
					$("#status").text(result.data.status);
					$("#remarks1").text(result.data.remarks1);
					
				}
			});
		});	
		
		
            
	</script>
</body>
</html>
