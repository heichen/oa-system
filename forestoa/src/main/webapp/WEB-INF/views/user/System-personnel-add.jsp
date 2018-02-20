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
			<form action="" method="post" class="form form-horizontal" id="userInsertForm">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>警号：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="" placeholder="" id="userNumber" name="userNumber">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>姓名：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="" placeholder="" id="userName" name="userName">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
					<div class="formControls col-xs-8 col-sm-9 skin-minimal" id="sex">
						<div class="radio-box">
							<label><input name="sex" type="radio" class="input-radio" value="男"/>男</label>

						</div>
						<div class="radio-box">
							<label><input name="sex" type="radio" class="input-radio" value="女"/>女</label>
						</div>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="" placeholder="" id="phone" name="phone">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>邮箱：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" placeholder="@" name="email" id="email">
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
					<div class="formControls col-xs-8 col-sm-9">
						<div id="orgTree_check"  class="ztree">
						
						</div>
					</div>
				</div>	
			
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
						<input type="button" id="userInsert"  class="btn btn-primary radius" value="保存"/>
						<input type="button" onClick="layer_close();" class="btn btn-default radius" value="&nbsp;&nbsp;取消&nbsp;&nbsp;"></input>
					</div>
				</div>
			</form>
		</article>
		<div id="menuContent" class="menuContent" style=" background:#FFFFFF;width: 250px;height: 200px; overflow-y: scroll;display:none; position: absolute;z-index:100;">
			<ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
		</div>
	<script type="text/javascript">
            //点击确定按钮向后台添加数据
            $("#userInsert").on("click", function () {
                var uNumber = $("#userNumber").val();
                var uName = $("#userName").val();
                var sex = $('#sex input[name="sex"]:checked ').val();
                var phone = $("#phone").val();
                var email = $("#email").val();
                var orgId = $("#orgId").attr("name");
                var roleId=$("#roleId").val();
                var orgId1 = $("#orgId1").attr("name");
                var roleId1=$("#roleId1").val();
                var orgId2 = $("#orgId2").attr("name");
                var roleId2=$("#roleId2").val();
                var orgs="";
                var treeObj = $.fn.zTree.getZTreeObj("orgTree_check");
                var nodes = treeObj.getCheckedNodes(true);
                for(var i=0;i<nodes.length;i++){
                	orgs+=nodes[i].oId+',';
                }
/*------------------------------------------------<formCheck>---------------------------------------------------*/
                 if(uNumber=="") {
                   // alert("警号不可以为空");
                    layer.msg("警号不可以为空", {
						icon : 5,
						time : 1000
					});
                    return false;
                }
                else{
                    reg=/^[0-9]*$/;
                    if(!reg.test(uNumber)){
                        layer.msg("对不起，警号必须输入整数!", {
    						icon : 5,
    						time : 1000
    					});
                        return false;
                    }
                }
                if(uName=="") {
                   // alert("姓名不可以为空");
                    layer.msg("姓名不可以为空", {
						icon : 5,
						time : 1000
					});
                    return false;
                }
                if(sex==null) {
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
                        //alert("对不起，手机好请输入的整数!");
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
                   // alert("必须选择一个职位，职位不可以为空！！");
                   layer.msg("必须选择一个职位，职位不可以为空！！", {
    							icon : 5,
    							time : 1000
    				});
                    return false;
                }
                
                
/*------------------------------------------------</formCheck>---------------------------------------------------*/
                $.ajax({
                    type: "post",
                    url: "users/insert",
                    data:{
                        "userNumber":uNumber,
                        "userName":uName,
                        "sex":sex,
                        "phone":phone,
                        "email":email,
                        "orgId1":orgId,
                        "roleId1":roleId,
                        "orgId2":orgId1,
                        "roleId2":roleId1,
                        "orgId3":orgId2,
                        "roleId3":roleId2,
                        "orgs":orgs
                    },

                    success: function (data) {

                        if (data.success == false) {
                        	layer.msg(data.msg, {
    							icon : 5,
    							time : 1000
    						});
                        }

                        if (data.success==true) {
                            window.location.href = ctx+"/Systempersonnel";//人员添加成功则跳转到人员管理主页面
                            window.parent.location.reload();
                            //parent.layer.close(index);
                        }
                    },
                    error: function () {
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
            		layer.msg("请先选择组织", {
    					icon : 5,
    					time : 1000
    				});
            	}
            	
            })
            $("#roleId1").on("click",function(){
            	
            	if($("#orgId1").attr("name")==""){
            		layer.msg("请先选择组织", {
    					icon : 5,
    					time : 1000
    				});
            	}
            	
            })
            $("#roleId2").on("click",function(){
            	
            	if($("#orgId2").attr("name")==""){
            		layer.msg("请先选择组织", {
    					icon : 5,
    					time : 1000
    				});
            	}
            	
            })

            //点击树
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
            
            //多选树
            var check_setting = {
            		check: {
        				enable: true
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
					/* k += nodes[i].oId+ ","; */
					k += nodes[i].oId;
				}
				if(v.length > 0) v = v.substring(0, v.length - 1);
				var cityObj = null;
				if(CurInput == 1) {
					cityObj = $("#orgId");
					cityObj.attr("value", v);
					cityObj.attr("name", k);
				} else if(CurInput == 2){
					cityObj = $("#orgId1");
					cityObj.attr("value", v);
					cityObj.attr("name", k);
				} else if(CurInput == 3){
					cityObj = $("#orgId2");
					cityObj.attr("value", v);
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
            function initializeZtree(){
            	
            	 $.ajax({
                     type: "POST",
                     url: "orgController/getOrgTree",
                     data: {
                         "oId": 1
                     },
                     dataType: "json",
                     success: function (result) {
                         zNodes = result.data;
                         $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                      //   $.fn.zTree.init($("#treeDemo1"), setting, zNodes);
                       //  $.fn.zTree.init($("#treeDemo2"), setting, zNodes);
                         $.fn.zTree.init($("#orgTree_check"), check_setting, zNodes);
                         
                     },
                     error: function (err) {
                         //alert("error");
                     }
                 });
            }
            /* 下拉框初始化函数 */
            function initializeDropdownbox(){
            	$.ajax({
                    type: "POST",
                    url: "users/selectAllRole",
                    dataType: "json",
                    success: function (result) {
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
                    },
                    error: function (err) {
                        //alert("error");
                    }
                });
           }      
            <!--组织树的初始化-->
            $(document).ready(function () {
            	initializeZtree();
            	initializeDropdownbox();
            });


			
		</script>
</body>
</html>
