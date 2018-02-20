/**
 * 每个功能模块，右上方轮播菜单权限控制
 */
$(function() {
	// 从cookie拿到的数据
	var user = JSON.parse(user_cookie);
	if (user.userType == 1) {
		$("li[name='menu_carousel']").each(function() {
			$(this).attr("class", "menu_block");
		});
	} else {
		// 遍历name=menu_carousel的li
		$("li[name='menu_carousel']").each(function() {
			var menus = user.reandmenus;
			var menuname = $(this).find('a').attr('title');
			// console.log(menuname+'-------');
			for (var i = 0; i < menus.length; i++) {
				// console.log(menus[i].M_NAME.trim());
				if (menus[i].mName.trim() == menuname.trim()) {
					$(this).attr("class", "menu_block");
					break;
				}
			}
		});
	}

});