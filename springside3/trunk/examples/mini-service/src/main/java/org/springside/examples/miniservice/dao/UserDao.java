package org.springside.examples.miniservice.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Repository;
import org.springside.examples.miniservice.entity.user.User;
import org.springside.modules.orm.hibernate.HibernateDao;

/**
 * 用户对象的泛型DAO.
 * 
 * @author calvin
 */
@Repository
public class UserDao extends HibernateDao<User, Long> {
	//-- 统一定义所有以用户为主体的HQL --//
	public static final String QUERY_BY_LNAME_PASSWD = "select count(u) from User u where u.loginName=? and u.password=?";

	/**
	 * 初始化User的延迟加载关联roleList.
	 */
	public void initUser(User user) {
		Hibernate.initialize(user.getRoleList());
	}

	/**
	 * 初始化User的延迟加载关联roleList.
	 */
	public void initUserList(List<User> userList) {
		for (User user : userList) {
			initUser(user);
		}
	}
}
