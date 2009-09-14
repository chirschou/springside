<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>日志高级演示</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="${ctx}/css/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="content">
<%@ include file="/common/left.jsp"%>
<div id="mainbar">
<h3>日志高级演示</h3>
<h4>技术说明：</h4>
<ul>
<li>轻量级日志异步多线程处理框架</li>
<li>JMX动态改变log4j的日志等级</li>
</ul>
<h4>用户故事：</h4>
<ul>
<li>每次进入本页面,logger都会在数据库LOGS表中增加一条记录.</li>
<li>使用JConsole动态修改log4j的日志等级.</li>
</ul>	
</div>
</div>
</body>
</html>