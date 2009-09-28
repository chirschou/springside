<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Dojo Base演示</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<link href="${ctx}/css/main.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/js/dojo/dojo.js" type="text/javascript"></script>
	<script type="text/javascript">
		//载入js/showcase/shape.js
		dojo.require("showcase.shape");

		//演示函数,显示Circle对象的内容.
		function demo(){
			c1 = new Circle("red",100);
			dojo.byId("demoContent").innerHTML = c1.generateContent();  
		}
	</script>
</head>
<body>
<div id="content">
<%@ include file="/common/left.jsp"%>
<div id="mainbar">
<h3>Dojo Base演示</h3>
<h4>技术说明：</h4>
<p>演示基于Dojo Base的Javascript文件Package化与Script方法OO化.</p>
</div>
	<p><input type="button" value="演示" onclick="demo();" /></p>

	<p>演示内容：</p>

	<div id="demoContent"></div>
</div>
</body>
</html>