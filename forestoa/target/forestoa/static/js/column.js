var tjwqTitleVal = $('.tjwqtitle').text().trim();
if($(".listbtnz").hasClass("tjwqActive")) {
	var secVal = $('.tjwqActive').text();
}
if(secVal == undefined) {
	$('#tjwqtitlenav').text('欢迎登陆本系统！您当前的位置为:' + tjwqTitleVal);
} else {
	$('#tjwqtitlenav').text('欢迎登陆本系统！您当前的位置为:' + tjwqTitleVal + ' > ' + secVal);
}

$('#tjwqBtn div').click(function() {

	var self = $(this);
	if(self.attr("url") != undefined && self.attr("url") != "") {
		var url = self.attr("url");
		//alert(url);
		$("#mainFrame").attr("src", url);
	}

})
$('#tjwqBtn .listbtnz').click(function() {
	if($(this).next().is(".list_hidegrp")) {
		if($(this).is(".on_xk")) {
			$(this).removeClass("on_xk");
			$(this).next(".list_hidegrp").stop().animate({
				"height": 0
			}, 300);
		} else {
			$(this).addClass("on_xk").siblings(".listbtnz").removeClass("on_xk");
			var _thisheight_ = $(this).next(".list_hidegrp").stop().height();
			var _thisaim_ = $(this).next(".list_hidegrp").css("height", "auto").height();
			$(this).next(".list_hidegrp").css("height", _thisheight_).animate({
				"height": _thisaim_
			}, 300);
			$(this).next(".list_hidegrp").siblings(".list_hidegrp").stop().animate({
				"height": 0
			}, 300);
		}
	} else {
		$(this).addClass("on_xk").siblings(".listbtnz").removeClass("on_xk");
		$(this).siblings(".list_hidegrp").stop().animate({
			"height": 0
		}, 300);
		$('#tjwqBtn .listbtnz').removeClass('tjwqActive');
		$(this).addClass('tjwqActive');
		var tjwqTitleVal = $('.tjwqtitle').text().trim();
		if($(".listbtnz").hasClass("tjwqActive")) {
			var secVal = $('.tjwqActive').children("div").text();
		}
		if(secVal == undefined) {
			$('#tjwqtitlenav').text('欢迎登陆本系统！您当前的位置为:' + tjwqTitleVal);
		} else {
			$('#tjwqtitlenav').text('欢迎登陆本系统！您当前的位置为:' + tjwqTitleVal + ' > ' + secVal);
		}
	}
});
var linkjump = {
	"公文-发文管理":'Filedocumentsendadd',
	"公文-收文管理":'Filedocumentreceive',
	"简报-发文管理": 'Filebriefingsendadd',
	"简报-收文管理": 'Filebriefingreceive',
	"公文管理": 'Filedocumentmanager',
	"我的公文": 'Filedocumentsearch',
	"我的任务": 'WorkmyTask',
	
	"权限管理": 'Systempower',
	"组织管理": 'Systemorganization',
	"人员管理": 'Systempersonnel',
	"公文查询": 'StatisticssearchInfo',
	"回退查询":'Statisticsfallback',
	"档案管理": 'Workarchivesmanage',
	"值班表": 'todo',
	"考核表": 'statisticsCheck',
	"工作计划": 'Workplan',
	"通知通告": 'Workbulletin',
	"收发单位管理": 'unitfilemanagement',
	"公文文号管理": 'sendNumber',

}
$(document).on("click", "[frameHref]", function() {
	var _thishref_ = $(this).attr("frameHref");
	if(_thishref_ == undefined || _thishref_ == null || _thishref_ == "") {
		if($(this).children("div").length) {
			_thishref_ = $(this).children("div").text();
		} else {
			_thishref_ = $(this).text();
		}

	}
	if(linkjump[_thishref_] != undefined && linkjump[_thishref_] != null && linkjump[_thishref_] != "") {
		_thishref_ = linkjump[_thishref_];
	}
	try {
		if(_thishref_.indexOf("todo")<0){
			$("#mainFrame").attr("src", _thishref_);
		}else{
			layer.msg('功能正在完善中...', {
				icon : 5
			});
		}
	} catch(e) {
		//TODO handle the exception
	}
})

window.onload = function() {
	var oDiv = document.getElementById('roll');
	var oUl = oDiv.getElementsByTagName('ul')[0];
	var aLi = $("#roll li[class='menu_block']");
	//var aLi = oUl.getElementsByTagName('li');
	var speed = -4;
	var oBtn1 = oDiv.getElementsByTagName('a')[0];//btn_left
	var oBtn2 = oDiv.getElementsByTagName('a')[1];//btn_right
	var roll_timer = null;

	//oUl.innerHTML += oUl.innerHTML;
	//oUl.style.width = aLi[0].offsetWidth * aLi.length + 'px';
	oUl.style.width = aLi.eq(0)[0].offsetWidth * aLi.size() + 'px';

	//左
	oBtn1.onclick = function() {
		speed = 82;
		if(oUl.offsetLeft==0){
			oUl.style.left = -speed+'px';
		}else if(oUl.offsetLeft<0){
			if(-oUl.offsetLeft==(oUl.offsetWidth-speed)){
				oUl.style.left =0+'px';
			}else{
				oUl.style.left = oUl.offsetLeft-speed+'px';
			}
		}
	}
	//右
	oBtn2.onclick = function() {
		speed = -82;
		oUl.style.left = oUl.offsetLeft + speed + 'px';
		if(oUl.offsetLeft < -oUl.offsetWidth / 2) {
			oUl.style.left = 0 + 'px';
		} else if(oUl.offsetLeft > (0)) {
			oUl.style.left = -oUl.offsetWidth / 2 + 'px';
		}
	}
};

/*--------------------------------*/
/*左侧菜单列表收缩、展开*/
function fnDisplayNavBar(obj) {
	var hw = $(window).width();
	var lWrap = $('#tjwqBtn').width();
	if($(obj).hasClass("open")) {
		$(obj).removeClass("open");
		$("body").removeClass("big-page");
		$('#tjwqBtn').show();
		$('#tjwqMainframe').css('width', '85%');
	} else {
		$(obj).addClass("open");
		$("body").addClass("big-page");
		$('#tjwqBtn').hide();
		$('#tjwqMainframe').css('width', '100%')
	}
};
/*监听窗口大小、设置右侧容器宽度*/
function resizeWindow() {
	var hw = $(window).width();
	var lWrap = $('#tjwqBtn').width();
	$('#tjwqMainframe').css('width', (hw - lWrap - 2));
};
resizeWindow();


function resizeBody() {
	var bodyH = $(window).height();
	var headerH = $('#tjwq_header').height();
	var navH = $('#nav').height();
	//console.log(bodyH);
	//console.log(bodyH -headerH -navH );
	$('.pagewrap').css('height', (bodyH - headerH - navH));
	$('#tjwqMainframe_bodybox').css('height', (bodyH - headerH - navH));
};
resizeBody();

function resizeWarp() {
	$('.pngfix').addClass("open");
	$("body").addClass("big-page");
	$('#tjwqBtn').hide();
	$('#tjwqMainframe').css('width', '100%')
}
resizeWarp();

$(window).resize(function() {
	resizeWindow();
	resizeBody();
	resizeWarp();
});

