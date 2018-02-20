<%@ page contentType="text/html; charset=utf-8"%>
<div id="tjwq_header">
	<div></div>
</div>
<div class="roll" id="roll">
		<a href="javascript:void(0);" class="btn_left"></a>
		<a href="javascript:void(0);" class="btn_right"></a>
		<div class="wrap">
			<ul>
				<li class="menu_block" name="menu_carousel">
					<a href="${ctx}/index.html" title="首页">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/home.png" width="70px" height="70px" />
					</div>
				</a>
			</li>
			<li class="menu_none" name="menu_carousel">
				<a href="${ctx}/Filehandle" title="公文办理">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/8.png" width="70px" height="70px" />
					</div>
				</a>
			</li>
			<li class="menu_none" name="menu_carousel">
				<a href="${ctx}/Systemsetup" title="系统管理">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/13.png" width="70px" height="70px" />
					</div>
				</a>
			</li>
			<li class="menu_none" name="menu_carousel">
				<a href="${ctx}/SearchInfo" title="统计查询">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/7.png" width="70px" height="70px" />
					</div>
				</a>
			</li>
			<li class="menu_none" name="menu_carousel">
				<a href="${ctx}/Workcheck" title="考勤管理">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/14.png" width="70px" height="70px" />
					</div>
				</a>
			</li>
			<li class="menu_none" name="menu_carousel">
				<a href="${ctx}/Workprogram" title="工作计划">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/10.png" width="70px" height="70px" />
					</div>
				</a>
			</li>
			<li class="menu_none" name="menu_carousel">
				<a href="${ctx}/Workarchives" title="档案管理">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/15.png" width="70px" height="70px" />
					</div>
				</a>
			</li>
			<li class="menu_none" name="menu_carousel">
				<a href="${ctx}/Worknotice" title="通知通告">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/11.png" width="70px" height="70px" />
					</div>
				</a>
			</li>
			<li class="menu_none" name="menu_carousel">
				<a href="javascript:void(0);" title="工作日志">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/17.png" width="70px" height="70px" />
					</div>
				</a>
			</li>
			<li class="menu_none" name="menu_carousel">
				<a href="javascript:void(0);" title="办公用品">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/6.png" width="70px" height="70px" />
					</div>
				</a>
			</li>
			<li class="menu_none" name="menu_carousel">
				<a href="javascript:void(0);" title="通讯录">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/5.png" width="70px" height="70px" />
					</div>
				</a>
			</li>
			<li class="menu_none" name="menu_carousel">
				<a href="javascript:void(0);" title="设备管理">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/3.png" width="70px" height="70px" />
					</div>
				</a>
			</li>
			<li class="menu_none" name="menu_carousel">
				<a href="javascript:void(0);" title="车辆管理">
					<div class="target-button">
						<img src="${ctxStatic}/images/index/2.png" width="70px" height="70px" />
						</div>
					</a>
				</li>
			</ul>
		</div>
	</div>
<div id="nav">
	<span id="tjwqtitlenav" style="margin-left:16px;">欢迎登陆本系统！您当前的位置为：首页</span>
	<div style="float:right;">
		<span style="margin-right:40px;" id="login_user_name">您好！</span>
		<a onclick="editPwd('修改密码','${ctx}/Syschangepassword','600','300')" href="javascript:;" style="margin-right:16px;">[修改密码]</a>
		<a href="${ctx}/quit" style="margin-right:16px;">[登出]</a>
	</div>
</div>