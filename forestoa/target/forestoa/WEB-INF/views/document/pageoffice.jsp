<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*"
	pageEncoding="UTF-8"%>
<%
	PageOfficeCtrl poCtrl = (PageOfficeCtrl) request.getAttribute("poCtrl");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>打开文件</title>
<body>
	<div style="width: 100%; height: 100%;">
		<%=poCtrl.getHtmlCode("PageOfficeCtrl1")%>
	</div>
	<!-- <div>
	  <input id="Hidden1" type="text" name="userName" hidden="true" value="李四" />
	</div> -->
	<script type="text/javascript">
		function AfterDocumentOpened() {
			// 全屏打开文件
			document.getElementById("PageOfficeCtrl1").FullScreen = true;
		}
		function Save() {
			document.getElementById("PageOfficeCtrl1").WebSave();
			document.getElementById("PageOfficeCtrl1").Alert("文件保存成功");
		}
		//关闭pageoffice
		function DocumentClose() {
			window.external.close();
		}
		function BeforeBrowserClosed(){    
            if (document.getElementById("PageOfficeCtrl1").IsDirty){
                if(confirm("提示：文档已被修改，是否继续关闭放弃保存 ？"))
                {
                    return  true;
                    
                }else{
                
                    return  false;
                }
	         	
            }
        }
		//关闭里面的内容 不关闭pageoffice
 		/* function DocumentClose() {
			document.getElementById("PageOfficeCtrl1").Close();
		} */

			function InsertSeal() {
				try {
					document.getElementById("PageOfficeCtrl1").ZoomSeal.AddSeal();
				} catch(e) {}
			}

			function AddHandSign() {
				document.getElementById("PageOfficeCtrl1").ZoomSeal.AddHandSign();
			}

			function VerifySeal() {
				document.getElementById("PageOfficeCtrl1").ZoomSeal.VerifySeal();
			}

			function ChangePsw() {
				document.getElementById("PageOfficeCtrl1").ZoomSeal.ShowSettingsBox();
			}
			  
	</script>
</body>
</html>
