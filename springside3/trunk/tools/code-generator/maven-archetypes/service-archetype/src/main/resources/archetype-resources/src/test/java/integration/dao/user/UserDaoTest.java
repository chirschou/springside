#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.integration.dao.user;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import ${package}.dao.UserDao;
import ${package}.data.UserData;
import ${package}.entity.user.Role;
import ${package}.entity.user.User;
import org.springside.modules.test.spring.SpringTxTestCase;

/**
 * UserManager的集成测试用例.
 * 
 * 调用实际的DAO类进行操作,默认在操作后进行回滚.
 * 
 * @author calvin
 */
public class UserDaoTest extends SpringTxTestCase {

	@Autowired
	private UserDao entityDao;

	@Test
	//如果你需要真正插入数据库,将Rollback设为false
	//@Rollback(false) 
	public void crudEntity() {
		//新建并保存用户.
		User entity = UserData.getRandomUser();
		entityDao.save(entity);
		//强制执行sql语句
		flush();

		//查找用户
		User entityFromDB = entityDao.findUniqueBy("id", entity.getId());
		assertReflectionEquals(entity, entityFromDB);

		//删除用户
		entityDao.delete(entity.getId());
		flush();
		entity = entityDao.findUniqueBy("id", entity.getId());
		assertNull(entity);
	}

	@Test
	public void crudEntityWithRole() {
		//保存带角色的用户
		User user = UserData.getRandomUser();
		Role role = UserData.getAdminRole();
		user.getRoles().add(role);

		entityDao.save(user);
		flush();

		user = entityDao.findUniqueBy("id", user.getId());
		assertEquals(1, user.getRoles().size());

		//删除用户的角色
		user.getRoles().remove(role);
		flush();
		user = entityDao.findUniqueBy("id", user.getId());
		assertEquals(0, user.getRoles().size());
	}

	@Test(expected = org.hibernate.exception.ConstraintViolationException.class)
	public void savenNotUniqueUser() {
		User user = UserData.getRandomUser();
		user.setLoginName("admin");

		entityDao.save(user);
		flush();
	}
}