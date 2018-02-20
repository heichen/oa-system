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
		<form action="" method="post" class="form form-horizontal"
			id="userInsertForm">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="userName" name="userName">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>性别：</label>
				<div class="formControls col-xs-8 col-sm-9 skin-minimal" id="sex">
					<div class="radio-box">
						<label><input  id="man" name="sex" type="radio" class="input-radio"
							value="男" />男</label>

					</div>
					<div class="radio-box">
						<label><input id="woman" name="sex" type="radio" class="input-radio"
							value="女" />女</label>
					</div>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>手机：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="phone" name="phone">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>邮箱：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="@" name="email"
						id="email">
				</div>
			</div>
			<div  class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>组织名称：</label>
						<div class="formControls col-xs-8 col-sm-3">
							<input id="orgId" type="text" onclick="showMenu(); return false;" name="" class="input-text treeDemo" value="" placeholder="请选择所属组织">
						</div>
						
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>职位名称：</label>
						<div id="roles" class="formControls col-xs-8 col-sm-2">
							<select  id="roleId" name="roleId"   class="input-text roleId">
										<option value="">请选择职位名称</option>
							</select>
						</div>
				</div>
				<div  class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>组织名称：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="orgId1" type="text" name=""  onclick="showMenuTwo(); return false;"  class="input-text treeDemo1" value="" placeholder="请选择所属组织">
					</div>
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>职位名称：</label>
					<div id="roles1" class="formControls col-xs-8 col-sm-2">
						<select  id="roleId1" name="roleId"   class="input-text roleId">
								<option value="">请选择职位名称</option>
						</select>
					</div>
				</div>
				<div  class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>组织名称：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="orgId2" type="text" onclick="showMenuThree(); return false;" name="" class="input-text treeDemo2" value="" placeholder="请选择所属组织">
					</div>
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>职位名称：</label>
					<div id="roles2" class="formControls col-xs-8 col-sm-2">
						<select  id="roleId2" name="roleId"   class="input-text roleId">
								<option value="">请选择职位名称</option>
									
						</select>
					</div>
				</div>
			
			<div class="row cl menu_none" id="row_orgTree">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>分管领导下属组织：</label>
					<div class="formControls col-xs-8 col-sm-9"  style="height:120px;overflow:auto;">
						<div id="orgTree_check"  class="ztree">
						
						</div>
					</div>
			</div>	
				
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input type="button" id="userInsert" class="btn btn-primary radius"
						value="保存" /> <input type="button" onClick="layer_close();"
						class="btn btn-default radius" value="&nbsp;&nbsp;取消&nbsp;&nbsp;"></input>
				</div>
			</div>
		</form>
	</article>
	<div id="menuContent" class="menuContent" style=" background:#FFFFFF;width: 250px;height: 200px; overflow-y: scroll;display:none; position: absolute;z-index:100;">
		<ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
	</div>
	<script type="text/javascript">
	
	var str = location.href; //取得整个地址栏
	var num = str.indexOf("?");
	str = str.substr(num + 1);
	var userId=strs = str.split("=")[1];
	<!--组织树,下拉框,人员信息初始化-->
		$(document).ready(function() {

		
			initializeZtree();
			initializeDropdownbox();
			
			
			//alert(str)
			var url = "users/selectByKey?" + str;
			$.ajax({
				type : "POST",
				url : url,
				async:false, //设为同步
				dataType : "json",
				success : function(result) {
					var r = "";
					//$("#userNumber").val(result.data.userNumber);
					$("#userName").val(result.data.userName);
					if((result.data.sex)=="男"){
                        $("#man").attr("checked",true)
                    }else {
                        $("#woman").attr("checked",true)
                    }
					//遍历组织列表。将当前用户拥有的组织全都展示
					for(var i=0;i<orgsdata.length;i++){
						var oId=orgsdata[i].oId;
						var oName=orgsdata[i].oName;
						if(result.data.orgId1!=null&&result.data.orgId1==oId){
							$("#orgId").val(oName);
						}
						if(result.data.orgId2!=null&&result.data.orgId2==oId){
							$("#orgId1").val(oName);					
						}
						if(result.data.orgId3!=null&&result.data.orgId3==oId){
							$("#orgId2").val(oName);
						}
					}
					//遍历角色，将当前用户拥有的角色全都展示
					for(var i=0;i<rolesdata.length;i++){
						var rId=rolesdata[i].rId;
						if(result.data.roleId1!=null&&result.data.roleId1==rId){
							//如果是分管领导，则要显示分管组织树，并选中
							if(result.data.roleId1==3){
								$("#row_orgTree").attr("class","row cl menu_block");
								//将下属的组织设置为选中
								isSelect(result.data.orgs);
							}
							 $("#roleId").find("option[value='"+result.data.roleId1+"']").attr("selected",true);  	
						}
						if(result.data.roleId2!=null&&result.data.roleId2==rId){
							 $("#roleId1").find("option[value='"+result.data.roleId2+"']").attr("selected",true);  	
						}
						if(result.data.roleId3!=null&&result.data.roleId3==rId){
							 $("#roleId2").find("option[value='"+result.data.roleId3+"']").attr("selected",true);  	
						}
					}
					
					$("#phone").val(result.data.phone);
					$("#email").val(result.data.email);
					
					$("#roleName").val(r);
					$("#loginPassword").val(result.data.loginPassword);
				}
			});

			

		});
		
		//将下属组织设置为选中
		function isSelect(orgs){
			var orgs_z=orgs.split(',');
			var treeObj = $.fn.zTree.getZTreeObj("orgTree_check");
			//获取全部节点
			var node = treeObj.getNodes();
			//全部节点设置为一个集合
			var nodes = treeObj.transformToArray(node);
			for(var i=0;i<nodes.length;i++){
				var oId=nodes[i].oId;
	            for(var y=0;y<orgs_z.length;y++){
	 				if(oId==orgs_z[y]){
	 					//console.log(oId+"--"+orgs_z[y]);
	 					nodes[i].checked = true;
	 				}
	 			}
	        }
			
		};

		//点击确定按钮修改数据
		$("#userInsert").on("click", function() {
			//var uNumber = $("#userNumber").val();
			var uName = $("#userName").val();
			var sex = $('#sex input[name="sex"]:checked ').val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var orgId = $("#orgId").attr("name");
			var roleId = $("#roleId").val();
			var orgId1 = $("#orgId1").attr("name");
			var roleId1 = $("#roleId1").val();
			var orgId2 = $("#orgId2").attr("name");
			var roleId2 = $("#roleId2").val();
			 var orgs="";
             var treeObj = $.fn.zTree.getZTreeObj("orgTree_check");
             var nodes = treeObj.getCheckedNodes(true);
             for(var i=0;i<nodes.length;i++){
             	orgs+=nodes[i].oId+',';
             }
            
/*------------------------------------------------<formCheck>---------------------------------------------------*/
           if(uName=="") {
               //alert("姓名不可以为空");
               layer.msg("姓名不可以为空", {
					icon : 5,
					time : 1000
				});
               return false;
           }
           if(sex=="") {
              // alert("性别不可以为空");
               layer.msg("性别不可以为空", {
					icon : 5,
					time : 1000
				});
               return false;
           }
           if(phone==""||phone.length!=11) {
               //alert("请输入正常的11位手机号！！");
               layer.msg("请输入正常的11位手机号！！", {
 					icon : 5,
 					time : 1000
 				});
               return false;
           }else{
               reg=/^[-+]?\d*$/;
               if(!reg.test(phone)){
                 //  alert("对不起，手机好请输入的整数!");//请将“整数类型”要换成你要验证的那个属性名称！
                   layer.msg("对不起，手机好请输入的整数!", {
      					icon : 5,
      					time : 1000
      				});
                   return false;
               }
           }
           if(email==""){
               layer.msg("邮箱不可以为空!", {
					icon : 5,
					time : 1000
              
           });
               return false;
       }
           if(email.length!=0){
               reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
               if(!reg.test(email)){
                   //alert("对不起，您输入的邮箱类型格式不正确!");
                   layer.msg("对不起，您输入的邮箱类型格式不正确!", {
   					icon : 5,
   					time : 1000
   				});
                   return false;
               }
           }
          
           if(roleId==0) {
        	   //alert("必须选择一个职位，职位不可以为空！！");
        	   layer.msg("必须选择一个职位，职位不可以为空！！", {
					icon : 5,
					time : 1000
				});
               return false;
           }
           
/*------------------------------------------------</formCheck>---------------------------------------------------*/
			$.ajax({
				type : "post",
				url : "users/update",
				data : {
					"userId" : userId,
					//"userNumber" : uNumber,
					"userName" : uName,
					"sex" : sex,
					"phone" : phone,
					"email" : email,
					"orgId1" : orgId,
					"roleId1" : roleId,
					"orgId2" : orgId1,
					"roleId2" : roleId1,
					"orgId3" : orgId2,
					"roleId3" : roleId2,
					"orgs":orgs
					//"loginPassword" : loginPassword
				},

				success : function(data) {

					if (data.success == false) {
						//alert("人员已存在！！");
						layer.msg(data.msg, {
							icon : 5,
							time : 1000
						});
					}

					if (data.success == true) {
						//alert("添加成功！！");
						//保存成功跳转到主页面
						window.location.href = ctx + "/Systempersonnel";
						window.parent.location.reload();
						//parent.layer.close(index);
					}
				},
				error : function() {
				}
			});

		});
		
		  //第一个角色select。当选择分管领导时，显示组织树。否则隐藏
        $("#roleId").change(function(){
        	if($(this).val()==3){
        		 $("#row_orgTree").attr("class","row cl menu_block");
        	}else{
        		 $("#row_orgTree").attr("class","row cl menu_none");
        	}
        });
		$("#roleId").on("click",function(){
        	
        	if($("#orgId").attr("name")==""){
        		//alert("请先选择组织");
        		layer.msg("请先选择组织", {
					icon : 5,
					time : 1000
				});
        	}
        	
        })
        $("#roleId1").on("click",function(){
        	
        	if($("#orgId1").attr("name")==""){
        		//alert("请先选择组织");
        		layer.msg("请先选择组织", {
					icon : 5,
					time : 1000
				});
        	}
        	
        })
        $("#roleId2").on("click",function(){
        	
        	if($("#orgId2").attr("name")==""){
        		//alert("请先选择组织");
        		layer.msg("请先选择组织", {
					icon : 5,
					time : 1000
				});
        	}
        	
        })
        
        	var CurInput = 0;
/* ztree的基本配置 */
		var setting = {
			view : {
				dblClickExpand : false
			},
			data : {
				key : {
					name : "oName"
				},
				simpleData : {
					enable : true,
					idKey : "oId",
					pIdKey : "parenteId",
					rootPId : "",
					nameKey : "oName"
				}
			},
			callback : {
				beforeClick : beforeClick,
				onClick : onClick
			}
		};
		
		 //多选树
        var check_setting = {
        		check: {
    				enable: true,
    			},
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
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			return treeNode;
		}

		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = zTree.getSelectedNodes(),
				v = "",
				k = "";
		//console.log(nodes);
			nodes.sort(function compare(a, b) {
				return a.id - b.id;
			});
			for(var i = 0, l = nodes.length; i < l; i++) {
				v += nodes[i].oName + ",";
				k += nodes[i].oId;
			}
			if(v.length > 0) v = v.substring(0, v.length - 1);
			var cityObj = null;
			if(CurInput == 1) {
				cityObj = $("#orgId");
				cityObj.attr("value", v);
				$("#orgId").val(v)
				cityObj.attr("name", k);
			} else if(CurInput == 2){
				cityObj = $("#orgId1");
				cityObj.attr("value", v);
				$("#orgId1").val(v)
				cityObj.attr("name", k);
			} else if(CurInput == 3){
				cityObj = $("#orgId2");
				cityObj.attr("value", v);
				$("#orgId2").val(v)
				cityObj.attr("name", k);
			}

			return false;
		}
		
		
		/*第一个组织名称 相关的下拉配置*/
		function showMenu() {
			CurInput = 1; //标记第一个文本框
			var cityObj = $("#orgId");
			var cityOffset = $("#orgId").offset();
			$("#menuContent").css({
				left: cityOffset.left + "px",
				top: cityOffset.top + cityObj.outerHeight() + "px"
			}).slideDown("fast");
			$("body").bind("mousedown", onBodyDown);
		}

		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}

		function onBodyDown(event) {
			if(!(event.target.id == "orgId" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
				hideMenu();
			}
		}
		//=============================
		/*第二个组织名称相关下拉配置*/
		function showMenuTwo() {
			CurInput = 2; //标记第二个文本框
			var cityObj = $("#orgId1");
			var cityOffset = $("#orgId1").offset();
			$("#menuContent").css({
				left: cityOffset.left + "px",
				top: cityOffset.top + cityObj.outerHeight() + "px"
			}).slideDown("fast");
			$("body").bind("mousedown", onBodyDownTwo);
		}

		function hideMenuTwo() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDownTwo);
		}

		function onBodyDownTwo(event) {
			if(!(event.target.id == "orgId1" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
				hideMenu();
			}
		}
		
		/*第三个组织名称 相关下拉配置*/
		function showMenuThree() {
			CurInput = 3; //标记第二个文本框
			var cityObj = $("#orgId2");
			var cityOffset = $("#orgId2").offset();
			$("#menuContent").css({
				left: cityOffset.left + "px",
				top: cityOffset.top + cityObj.outerHeight() + "px"
			}).slideDown("fast");
			$("body").bind("mousedown", onBodyDownThree);
		}

		function hideMenuThree() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDownThree);
		}

		function onBodyDownThree(event) {
			if(!(event.target.id == "orgId2" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
				hideMenu();
			}
		}
		/* ztree初始化函数 */
		var orgsdata=null;
		function initializeZtree() {

			$.ajax({
				type : "POST",
				url : "orgController/getOrgTree",
				data : {
					"oId" : 1
				},
				async:false, //设为同步
				dataType : "json",
				success : function(result) {
					orgsdata=result.data;
					zNodes = result.data;
					  $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                      $.fn.zTree.init($("#orgTree_check"), check_setting, zNodes);
				},
				error : function(err) {
					//alert("error");
				}
			});
		}
		/* 所有的角色 */
		var rolesdata=null;
		function initializeDropdownbox(boxId) {

			$.ajax({
				type : "POST",
				url : "users/selectAllRole",
				dataType : "json",
				async:false, //设为同步
				success : function(result) {
					var roles = result.data;
					rolesdata=result.data;
					for (var i = 0; i < roles.length; i++) {
						var roles=result.data;
                        for(var i=0;i<roles.length;i++){                 
                          var arr='<option value="'+roles[i].rId+'">'+roles[i].rName+'</option>' ;
                          $("#roleId").append(arr);
                          if(roles[i].rId!=3){
                        	  //去除掉第二、三个职位中的分管领导
                        	  $("#roleId1").append(arr);
                              $("#roleId2").append(arr);
                          }
                        }
					}

					$(boxId).append(arr);
				},
				error : function(err) {
					//alert("error");
				}
			});
		}

		/* 角色查询 */
		function selectRole(roles,roleId) {
			//alert("roleId="+roleId);
			if(roleId!=0){
				$.ajax({
					type : "POST",
					url : "role/selectByKey?rId="+roleId,
					dataType : "json",
					success : function(result) {
						
						var role = result.data.role.rName;
						//alert(role);
						//alert(roles);
						//alert(roleId);
					   $(roles).find("option[value='"+roleId+"']").attr("selected",true);  			
					},
					error : function(err) {
						//alert("error");
					}
				});
			}
		};

		$(function() {
			$(".permission-list dt input:checkbox").click(
					function() {
						$(this).closest("dl").find("dd input:checkbox").prop(
								"checked", $(this).prop("checked"));
					});
			$(".permission-list2 dd input:checkbox")
					.click(
							function() {
								var l = $(this).parent().parent().find(
										"input:checked").length;
								var l2 = $(this).parents(".permission-list")
										.find(".permission-list2 dd").find(
												"input:checked").length;
								if ($(this).prop("checked")) {
									$(this).closest("dl").find(
											"dt input:checkbox").prop(
											"checked", true);
									$(this).parents(".permission-list").find(
											"dt").first()
											.find("input:checkbox").prop(
													"checked", true);
								} else {
									if (l == 0) {
										$(this).closest("dl").find(
												"dt input:checkbox").prop(
												"checked", false);
									}
									if (l2 == 0) {
										$(this).parents(".permission-list")
												.find("dt").first().find(
														"input:checkbox").prop(
														"checked", false);
									}
								}
							});

			$("#form-admin-role-add").validate({
				rules : {
					roleNum : {
						required : true,
					},
					roleName : {
						required : true,
					},
					phone : {
						required : true,
					},
					email : {
						required : true,
						email : true
					}
				},
				onkeyup : false,
				focusCleanup : true,
				success : "valid",
				submitHandler : function(form) {
					$(form).ajaxSubmit();
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				}
			});
		});
	</script>
</body>
</html>
