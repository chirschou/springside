package org.springside.modules.log;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.AppenderSkeleton;
import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggingEvent;

/**
 * 在List中保存日志的Appender,用于测试日志输出.
 * 
 * @author calvin
 */
public class InMemoryAppender extends AppenderSkeleton {

	private List<LoggingEvent> logs = new ArrayList<LoggingEvent>();

	/**
	 * 返回之前append的log事件列表.
	 */
	public List<LoggingEvent> getLogs() {
		return logs;
	}

	/**
	 * 返回之前append的log事件列表.
	 */
	public void clearLogs() {
		logs.clear();
	}

	/**
	 * 将本Appender添加到logger中.
	 */
	public void addToLogger(String loggerName) {
		Logger logger = Logger.getLogger(loggerName);
		logger.addAppender(this);
	}

	/**
	 * 将本Appender添加到logger中.
	 */
	public void addToLogger(Class<?> loggerClass) {
		Logger logger = Logger.getLogger(loggerClass);
		logger.addAppender(this);
	}

	/**
	 * 实现append函数,将log事件加入到内部事件列表.
	 */
	@Override
	protected void append(LoggingEvent event) {
		logs.add(event);
	}

	public void close() {
	}

	public boolean requiresLayout() {
		return false;
	}
}
