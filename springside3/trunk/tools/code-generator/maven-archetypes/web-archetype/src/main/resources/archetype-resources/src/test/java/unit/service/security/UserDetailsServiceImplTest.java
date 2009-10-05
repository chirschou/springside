#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.unit.service.security;

import org.easymock.classextension.EasyMock;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.security.GrantedAuthorityImpl;
import org.springframework.security.userdetails.UserDetails;
import org.springframework.security.userdetails.UsernameNotFoundException;
import ${package}.data.SecurityEntityData;
import ${package}.entity.security.Authority;
import ${package}.entity.security.Role;
import ${package}.entity.security.User;
import ${package}.service.security.SecurityEntityManager;
import ${package}.service.security.UserDetailsServiceImpl;
import org.springside.modules.utils.ReflectionUtils;

/**
 * UserDetailsServiceImpl的单元测试用例, 测试Service层的业务逻辑. 
 * 
 * 使用EasyMock对UserManager进行模拟.
 * 
 * @author calvin
 */
public class UserDetailsServiceImplTest extends Assert {

	private UserDetailsServiceImpl userDetailService = new UserDetailsServiceImpl();
	private SecurityEntityManager securityEntityManager = null;

	@Before
	public void setUp() {
		securityEntityManager = EasyMock.createNiceMock(SecurityEntityManager.class);
		ReflectionUtils.setFieldValue(userDetailService, "securityEntityManager", securityEntityManager);
	}

	@After
	public void tearDown() {
		EasyMock.verify(securityEntityManager);
	}

	@Test
	public void loadUserExist() {

		String authName = "A_foo";
		//准备数据
		User user = SecurityEntityData.getRandomUser();
		Role role = SecurityEntityData.getRandomRole();
		user.getRoleList().add(role);
		Authority auth = new Authority();
		auth.setName(authName);
		role.getAuthorityList().add(auth);

		//录制脚本
		EasyMock.expect(securityEntityManager.findUserByLoginName(user.getLoginName())).andReturn(user);
		EasyMock.replay(securityEntityManager);

		//执行测试
		UserDetails userDetails = userDetailService.loadUserByUsername(user.getLoginName());

		//校验结果
		assertEquals(user.getLoginName(), userDetails.getUsername());
		assertEquals(user.getPassword(), userDetails.getPassword());
		assertEquals(1, userDetails.getAuthorities().length);
		assertEquals(new GrantedAuthorityImpl(authName), userDetails.getAuthorities()[0]);
	}

	@Test(expected = UsernameNotFoundException.class)
	public void loadUserNotExist() {
		//录制脚本
		EasyMock.expect(securityEntityManager.findUserByLoginName("userNameNotExist")).andReturn(null);
		EasyMock.replay(securityEntityManager);
		//执行测试
		userDetailService.loadUserByUsername("userNameNotExist");
	}
}