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
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>单位名称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="name" name="name">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">单位负责人：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="manager" name="manager">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>单位类型：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<select id="status" name="status" class="input-text roleId">
						<option value="0">请选择单位类型</option>
						<option value="来文单位">来文单位</option>
						<option value="主送单位">主送单位</option>
						<option value="抄送单位">抄送单位</option>
					</select>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">联系电话：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="phone" name="phone">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">单位地址：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="remarks1" name="remarks1">
				</div>
			</div>

			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
					<!-- <button id="save" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存</button> -->
					<input class="btn btn-primary radius" id="save" type="button" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
					<!-- <button onClick="article_save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 提交</button> -->
					<input type="button" onClick="layer_close();" class="btn btn-default radius" value="&nbsp;&nbsp;取消&nbsp;&nbsp;"></input>
				</div>
			</div>
		</form>
	</article>

	<script type="text/javascript">
		$("#save").on("click", function() {
			var name = $("#name").val();
			var manager = $("#manager").val();
			var status = $("#status").val();
			var phone = $("#phone").val();
			var remarks1 = $("#remarks1").val();
			/*------------------------------------------------<formCheck>---------------------------------------------------*/
			if (name == "") {
				//layer.msg('单位名称不可以为空');
				layer.msg("单位名称不可以为空", {
					icon : 5,
					time : 1000
				});
				return false;
			}
			if (status == 0) {
				//layer.msg('必须选择一个单位类型，单位类型不可以为空');
				layer.msg("必须选择一个单位类型，单位类型不可以为空", {
					icon : 5,
					time : 1000
				});
				return false;
			}
			/* if (phone == "") {
				//layer.msg('联系电话不可以为空');
				layer.msg("联系电话不可以为空", {
					icon : 5,
					time : 1000
				});
				return false;
			} */
			if (phone != "") {

				reg = /^[-+]?\d*$/;
				if (!reg.test(phone)) {
					//layer.msg('联系电话请输入的整数');
					layer.msg("联系电话请输入的整数", {
						icon : 5,
						time : 1000
					});
					return false;
				}
			}
			/* if (remarks1 == "") {
				//layer.msg('收发单位的地址不可以为空');
				layer.msg("收发单位的地址不可以为空", {
					icon : 5,
					time : 1000
				});
				return false;
			} */

			/*------------------------------------------------</formCheck>---------------------------------------------------*/
			$.ajax({
				type : "post",
				url : "unit/insert",
				data : {
					"name" : name,
					"manager" : manager,
					"status" : status,
					"phone" : phone,
					"remarks1":remarks1
				},
				success: function (data) {

                    if (data.success == false) {
                    	layer.msg(data.msg, {
							icon : 5,
							time : 1000
						});
                    }

                    if (data.success==true) {
                        window.location.href = ctx+"/unitManage";//人员添加成功则跳转到人员管理主页面
                        window.parent.location.reload();
                        //parent.layer.close(index);
                    }
                },
                error: function () {
                }

			});

		});
	</script>
</body>
</html>
