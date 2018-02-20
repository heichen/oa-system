//用户对象
//var user=JSON.parse(loginuser);  
//右上角轮播菜单
function right_menu_init(user){
	$("#login_user_name").text('您好！'+user.userName);
	//设置右上角轮播菜单
	if (user.userType == 1) {
		$("ul li").each(function() {
			$(this).attr("class", "menu_block");
		});
	}else{
		$("ul li").each(function() {
			//当前用户菜单
			//用户菜单对象
			var menus=user.reandmenus;
			for(var i=0;i<menus.length;i++){
				var menu=menus[i];
				var menu_title=$(this).find('a').attr("title");
				//如果title和菜单名称匹配上，则显示
				if(menu.mName.trim()==menu_title.trim()){
					$(this).attr("class", "menu_block");
					break;
				}
			}
		});
	};
};

//左侧菜单列表显示隐藏
function left_menu_init(user,current_model_name){
	//设置左侧菜单列表
	if (user.userType == 1) {
		$("#tjwqBtn").children('div').each(function(index,element){
			if(index!=0){
				$(this).removeClass("menu_none");
				$(this).addClass("menu_block");
			}
		});
	} else {
		//当前用户菜单树
		var menus=user.reandmenus;
		//定义当前模块菜单对象集合
		var current_menus=new Array();
		//根据当前大模块名称找到当前大模块下的菜单树
		for(var i=0;i<menus.length;i++){
			if(menus[i].mName.trim()==current_model_name.trim()){
				current_menus=menus[i].childMenus;
				break;
			}
		}
		
		// 遍历左侧菜单
		$("#tjwqBtn").children('div').each(function(index,element) {
			//当前菜单名称
			var menuname = $(this).find('div').text();
			//console.log('---'+menuname);
			for (var i = 0; i < current_menus.length; i++) {
				var menu_name=current_menus[i].mName;
				//console.log(menu_name);
				if (menu_name.trim() == menuname.trim()) {
					$(this).attr("class", "listbtnz menu_block");
					break;
				}
			}
		});
	}
	
	//设置一个标识，标识是否设置了左侧菜单栏第一个为默认选中
	var size=0;
	//循环左侧菜单列表，设置样式为选中，mainFrame窗体内容为该页面
	$("#tjwqBtn").children('div').each(function(index,element){
		//查到显示的菜单，设置样式之后，break
		if($(this).hasClass("menu_block")&&size==0){
			var m_url=$(this).attr("m_url");
			//console.log(m_url);
			//设置菜单为选中样式
			$(this).addClass("on_xk tjwqActive");
			$("#mainFrame").attr('src',ctx+'/'+m_url);
			size=1;
		}
	});
};