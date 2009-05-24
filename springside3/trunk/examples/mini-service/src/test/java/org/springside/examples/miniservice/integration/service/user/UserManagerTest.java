package org.springside.examples.miniservice.integration.service.user;

import static org.junit.Assert.assertFalse;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.examples.miniservice.entity.user.Role;
import org.springside.examples.miniservice.entity.user.User;
import org.springside.examples.miniservice.service.user.UserManager;
import org.springside.modules.test.junit4.SpringTransactionalTestCase;

/**
 * UserManager的集成测试用例.
 * 
 * 调用实际的DAO类进行操作,默认在操作后进行回滚.
 * 
 * @author calvin
 */
public class UserManagerTest extends SpringTransactionalTestCase {

	@Autowired
	private UserManager	userManager;

	@Test
	public void saveUser() {

		User entity = new User();
		// 因为LoginName要求唯一性，因此添加random字段。
		entity.setLoginName("tester" + randomString(5));
		entity.setName("foo");
		entity.setEmail("foo@bar.com");
		entity.setPassword("foo");
		Role role = new Role();
		role.setId(1L);
		entity.getRoles().add(role);
		userManager.save(entity);
		flush();
		assertNotNull(entity.getId());
	}

	@Test(expected = org.hibernate.exception.ConstraintViolationException.class)
	public void savenNotUniqueUser() {
		User entity = new User();
		entity.setLoginName("admin");
		userManager.save(entity);
		flush();
	}

	@Test
	public void authUser() {
		assertTrue(userManager.authenticate("admin", "admin"));
		assertFalse(userManager.authenticate("admin", ""));
	}
}
