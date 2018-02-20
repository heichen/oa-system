var Angel;

window.Angel = Angel = {};

Angel.VERSION = '1.0.0';

Angel.Static = false;

Angel.Contants = {};

Angel.Config || (Angel.Config = {});

Angel.ServiceType = '';

Angel.Service = (function(ar, $, layer) {
	var _ajax, _ajaxId, post, get, getPath;
	/**
	 * @method _ajax
	 * @param url
	 * @param data
	 * @param type
	 * @param success
	 * @returns {*}
	 * @private
	 */
	_ajax = function(url, data, type, success, fail) {
		var dataType = 'json';
		if ('jsonp' == type) {
			type = 'GET';
			dataType = 'jsonp';
		}
		var lotm;
		_ajaxId = $.ajax({
			url : url,
			data : data,
			type : type,
			dataType : dataType,
			cache : false,
			beforeSend : function() {
				lotm = layer.load(5, 0);
			},
			complete : function(XMLHttpRequest, textStatus) {
				layer.close(lotm);
			},
			success : function(data) {
				layer.close(lotm);
				if (success) {
					success(data);
				}
			},
			error : function(data) {
				if (fail) {
					fail(data);
				}
			}
		});
	};
	getPath = function(api) {
		var _api = ar.Constants.Config.Api[api];
		if(_api==undefined||_api==null){
			alert('api路径不存在,' + _api);
			return;
		}
		return _api.path;
	};
	/**
	 * 调试本地挡板数据
	 * 
	 * @param api
	 * @param data
	 * @param success
	 * @returns {*}
	 */
	getLocal = function(api, data, success) {
		var url = ar.Constants.Config.Api[api];

		if (url == undefined) {
			alert('api路径不存在,' + api);
			return false;
		}
		return _ajax(url.localPath, data, 'GET', success);
	};
	/**
	 * Load data from the server using a HTTP POST request.
	 * 
	 * @param url
	 * @param data
	 * @param success
	 * @param fail
	 * @returns {*}
	 */
	post = function(url, data, success, fail) {
		// var _url = getPath(url);
		return _ajax(url, data, 'POST', success, fail);
	};
	get = function(api, data, success, fail, type) {
		if (ar.Static) {// 制作静态版本全局控制变量
			return getLocal(api, data, success);
		}
		var url = getPath(api);
		type = type == undefined ? ar.ServiceType : type;
		if (ar.Debug || "http" == type) {
			return _ajax(url, data, 'jsonp', success, fail);
		}
		if ("httppost" == type) {
			return post(url, data, success, fail);
		} else {
			return _ajax(url, data, 'GET', success, fail);
		}
	};
	return {
		get : get,
		getLocal : getLocal,
		post : post
	};

})(Angel, jQuery, layer);

Angel.Util = (function(ar, $, layer) {
	// type:0 删除 1:更新
	var functionExc = function(fun, options) {
		var defaults = {
			confirmFlag : true,
			type : 0,
			delMsg : '您确认要删除当前数据吗？',
			upMsg : '您确认要更新当前数据吗？',
			otherMsg : ''
		};
		var opts = $.extend({}, defaults, options);
		if (opts.confirmFlag) {// 若需要进行确认弹出
			var conMsg = "确认对当前数据进行操作吗？";
			if (opts.type == 0) {
				conMsg = opts.delMsg;
			} else if (opts.type == 1) {
				conMsg = opts.upMsg;
			} else {
				conMsg = opts.otherMsg != "" ? opts.otherMsg : conMsg;
			}
			layer.confirm(conMsg, function(index) {
				layer.close(index);
				fun();
			});
		} else {
			fun();
		}
	};
	// 引入js和css文件
	var include = function(id, path, file) {
		if (document.getElementById(id) == null) {
			var files = typeof file == "string" ? [ file ] : file;
			for (var i = 0; i < files.length; i++) {
				var name = files[i].replace(/^\s|\s$/g, "");
				var att = name.split('.');
				var ext = att[att.length - 1].toLowerCase();
				var isCSS = ext == "css";
				var tag = isCSS ? "link" : "script";
				var attr = isCSS ? " type='text/css' rel='stylesheet' "
						: " type='text/javascript' ";
				var link = (isCSS ? "href" : "src") + "='" + path + name + "'";
				document.write("<" + tag + (i == 0 ? " id=" + id : "") + attr
						+ link + "></" + tag + ">");
			}
		}
	};
	
	//为含有aresrequired属性的元素追加*号
	//不能对checkbox及radio元素进行操作
	var appendstar=function(){
		$("[aresrequired]").each(function(){
			var type = $(this).attr("type");
			if(type!="checkbox"&&type!="radio"){
				var $required = $("<span class='c-red'>*</span>");
				var $a = $(this).parent();
				if($a.attr("class")=="select-box"){
					$a = $a.parent();
				}
				$a.prev().prepend($required);
			}
		});
	};
	//对含有aresrequired属性的元素进行验证
	//需要填入aresmsg属性，错误信息
	//不能对checkbox及radio标签进行验证
	var validate = function(){
		var resFlag = true;
		$("[aresrequired]").each(function(index,obj){
			var a = $(this).attr("aresrequired");
			if(a!=undefined||a!='undefined'){
				var msg = $(this).attr("aresmsg");
				var type = $(this).attr("type");
				if(type!="checkbox"&&type!="radio"&&$(this).val()==""){
					layer.msg(msg);
					resFlag = false;
					$(this).focus();
					return false;
				}
			}
		});
		return resFlag;
	};

	return {
		functionExc : functionExc,
		include : include,
		appendstar:appendstar,
		validate:validate
	};
})(Angel, jQuery, layer);

$(document).ready(function() {
	try {
		// 链接去掉虚框
		$("a").bind("focus", function() {
			if (this.blur) {
				this.blur()
			}
			;
		});
	} catch (e) {
		// blank
	}
});

(function($) {
	/**
	 * 序列号Json,将复选框，多选下来列表框序列化为数组
	 */
	$.fn.serializeJson = function() {
		var serializeObj = {};
		var array = this.serializeArray();
		$(array).each(
				function() {
					if (serializeObj[this.name]) { // 若已经包含这个Key
						if ($.isArray(serializeObj[this.name])) {
							serializeObj[this.name].push(this.value);
						} else {
							serializeObj[this.name] = [
									serializeObj[this.name], this.value ];
						}
					} else {
						serializeObj[this.name] = this.value;
					}
				});
		return serializeObj;
	}
})(jQuery);
