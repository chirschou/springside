package org.springside.modules.integration.log;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springside.modules.jmx.JmxClient;
import org.springside.modules.log.Log4jMBean;
import org.springside.modules.test.spring.SpringContextTestCase;

/**
 * sprinside-jee中Log4jMBean的测试用例.
 * 
 * @author calvin
 */
@ContextConfiguration(locations = { "/jmx/applicationContext-jmx-server.xml", "/log/applicationContext-log.xml" })
public class Log4jMBeanTest extends SpringContextTestCase {

	private JmxClient jmxClient;

	@Before
	public void setUp() throws Exception {
		jmxClient = new JmxClient("service:jmx:rmi:///jndi/rmi://localhost:1098/showcase");
	}

	@Test
	public void getRootLoggerLevel() {
		assertEquals("WARN", jmxClient.getAttribute(Log4jMBean.LOG4J_MBEAN_NAME, "RootLoggerLevel"));
	}

	@Test
	public void setRootLoggerLevel() {
		jmxClient.setAttribute(Log4jMBean.LOG4J_MBEAN_NAME, "RootLoggerLevel", "ERROR");
		assertEquals("ERROR", Logger.getRootLogger().getLevel().toString());
		jmxClient.setAttribute(Log4jMBean.LOG4J_MBEAN_NAME, "RootLoggerLevel", "WARN");
	}

	@Test
	public void getLoggerLevel() {
		assertEquals("INFO", jmxClient.invoke(Log4jMBean.LOG4J_MBEAN_NAME, "getLoggerLevel",
				new Object[] { "org.springside" }, new String[] { "java.lang.String" }));
	}

	@Test
	public void SetLoggerLevel() {
		jmxClient.invoke(Log4jMBean.LOG4J_MBEAN_NAME, "setLoggerLevel", new Object[] { "org.springside", "ERROR" },
				new String[] { "java.lang.String", "java.lang.String" });

		assertEquals("ERROR", Logger.getLogger("org.springside").getLevel().toString());

		jmxClient.invoke(Log4jMBean.LOG4J_MBEAN_NAME, "setLoggerLevel", new Object[] { "org.springside", "INFO" },
				new String[] { "java.lang.String", "java.lang.String" });
	}

	@Test
	public void getLoggerAppenders() {
		List<String> list = jmxClient.invoke(Log4jMBean.LOG4J_MBEAN_NAME, "getLoggerAppenders",
				new Object[] { "org.springside" }, new String[] { "java.lang.String" });

		assertEquals(2, list.size());
		assertEquals("stdout(parent)", list.get(0));
		assertEquals("logfile(parent)", list.get(1));

		list = jmxClient.invoke(Log4jMBean.LOG4J_MBEAN_NAME, "getLoggerAppenders", new Object[] { "DBLogExample" },
				new String[] { "java.lang.String" });

		assertEquals(2, list.size());
		assertEquals("stdout", list.get(0));
		assertEquals("dblog", list.get(1));

	}
}
