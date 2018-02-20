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
<body>
		<article class="page-container">
			<form class="form form-horizontal" id="form-article-add">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>通知/通告标题：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="" placeholder="" id="noticeTitle" name="noticeTitle">
					</div>
				</div>

				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>通知/通告类型：</label>
					<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="articlecolumn" class="select" id="noticeType">
					<option value="会议">会议</option>
					<option value="集体活动">集体活动</option>
				</select>
				</span> </div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">详细内容：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<textarea id="noticeContent" class="textarea" cols="50" rows="10"></textarea>
					</div>
				</div>
							
				<!-- <div  class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>组织：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="org" type="text" name="" value="" onclick="showMenu();" class="input-text" value="" placeholder="请选择通知对象" readonly="readonly"/>
					</div>
					<div id="menuContent" class="menuContent" style=" background:#FFFFFF;width: 250px;height: 200px; overflow-y: scroll;display:none; position: absolute;z-index:100;">
						<ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
					</div>
					
				</div> -->
				
				<div class="row cl">
					
				</div>

				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
						<input class="btn btn-primary radius" id="save" type="button" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
						<!-- <input id="save" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>保存</input> -->
						<!-- <button id="save" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存</button> -->
						<!-- <button onClick="article_save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 立即发送</button> -->
						<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
					</div>
				</div>

				<!--<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
						<button onClick="equipment_area_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
						<button onClick="removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
					</div>
				</div>-->
			</form>
		</article>

	<script type="text/javascript">
	
	/* var setting = {
			check: {
				enable: true,
				chkboxType: {"Y":"s", "N":"s"}
			},
			view: {
				
				dblClickExpand: false,
				selectedMulti : false
			},
			data: {
				key: {
                    name: "nodeName"
                },
				simpleData: {
					enable: true,
					idKey: "nodeId",
                    pIdKey: "pId",
                    rootPId: "",
                    nameKey: "nodeName"
					
				}
			},
			callback: {
				beforeClick: beforeClick,
				onCheck: onCheck
			}
		};


		function beforeClick(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}
		
		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			nodes = zTree.getCheckedNodes(true);
			v = "";
			r="";
			for (var i=0, l=nodes.length; i<l; i++) {
				
				v += nodes[i].nodeName + ",";
				if(nodes[i].nodeValue=="user"){
				   r +=nodes[i].nodeId + ","
				}	
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			if (r.length > 0 ) r = r.substring(0, r.length-1);
			var org = $("#org");
			org.attr("value", v);
			org.attr("name", r);
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
			if (!(event.target.id == "menuBtn" || event.target.id == "org" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}

		$(document).ready(function(){
			var tree="#treeDemo";
         	initializeZtree(tree);
		});
		
	
		function initializeZtree(treeId){
         	
         	 $.ajax({
                  type: "POST",
                  url: "users/getUsersTree",
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
          */
		
		
		
       //点击确定按钮向后台添加数据
         $("#save").on("click", function () {
             var noticeTitle = $("#noticeTitle").val();
             var noticeContent = $("#noticeContent").val();
             var noticeType=$("#noticeType").val();
            /*  var noticeReceiverId = $("#org").attr("name");
             var noticeReceiver=$("#org").val(); */
            
/*------------------------------------------------<formCheck>---------------------------------------------------*/
             
              if(noticeTitle=="") {
        	  //layer.msg('通知标题不可以为空');
        	  layer.msg("通知标题不可以为空", {
					icon : 5,
					time : 1000
				});
            return false;
        }
     
        
        if(noticeContent=="") {
            //layer.msg('通知内容不可以为空');
            layer.msg("通知内容不可以为空", {
				icon : 5,
				time : 1000
			});
            return false;
        }
        if(noticeType==null) {
            //layer.msg('通知类型不可以为空');
            layer.msg("通知类型不可以为空", {
				icon : 5,
				time : 1000
			});
            return false;
        }
       /*  if(noticeReceiver=="") {
            //layer.msg('通知的接收人/组织不可以为空');
            layer.msg("通知的接收人/组织不可以为空", {
				icon : 5,
				time : 1000
			});
            return false;
        } */
             
             
             
/*------------------------------------------------</formCheck>---------------------------------------------------*/
             $.ajax({
                 type: "post",
                 url: "notice/insert",
                 data:{
                     "noticeTitle":noticeTitle,
                     "noticeContent":noticeContent,
                     "noticeType":noticeType,
                     /* "noticeReceiver":noticeReceiver,
                     "noticeReceiverId":noticeReceiverId */
                 },

                 success: function (data) {
                	 console.log(data.success);
                	 if (data.success==true) {
                    		 window.location.href = ctx+"/Workbulletin";
                    		 window.parent.location.reload();
                     if (data.success == false) {
                    	 layer.msg('失败，请重新填写并提交');
                    	 /* layer.msg('失败', function() {
                    		 window.location.href = ctx+"/Workbulletin";
             			}); */

                     
                     
                     }}},
                 error: function () {
                 }
             });

         });

</script>
</body>
</html>
