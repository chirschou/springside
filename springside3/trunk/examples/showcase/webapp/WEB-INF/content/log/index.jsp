<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory" %>
<%@ include file="/common/taglibs.jsp"%>

<%
	//在log4j.xml中,本logger已被指定使用asyncAppender
	Logger logger = LoggerFactory.getLogger("org.springside.examples.showcase.log.dbLogExample");
	logger.info("helloworld");
%>

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
<h2>日志高级演示</h2>
<h4>技术说明：</h4>
轻量级日志异步多线程处理框架：<br/>
Log4j端很轻量的将Logging Evnet发送到Blocking Queue中,由归Spring统一管理JMS/DB/EMail资源的Appender Bean异步的、多线程的对事件进行处理。
可选的处理可包括：
<ul>
	<li>告警邮件发送：使用Smtp Appender发送，消息接收者将日志发送到告警邮箱。</li>
	<li>日志文件集中记录：使用JMS Appender发送，消息接收者统一记录日志到中央服务器文件。</li>
	<li>日志数据库记录：使用Jdbc Appender发送，消息接收者统一记录日志到中央数据库。</li>
</ul>

<h4>用户故事：</h4>
	每次进入本页面，本页面的logger都会在数据库LOGS表中增加一条记录。
</div>
</div>
</body>
</html>