package org.springside.examples.miniservice.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Repository;
import org.springside.examples.miniservice.entity.user.User;
import org.springside.modules.orm.hibernate.HibernateDao;

/**
 * 用户的泛型DAO.
 * 
 * @author calvin
 */
@Repository
public class UserDao extends HibernateDao<User, Long> {
	// 统一定义所有以用户为主体的HQL.
	public static final String QUERY_BY_LNAME_PASSWD = "select count(u) from User u where u.loginName=? and u.password=?";

	/**
	 * 关联对象初始化函数.
	 */
	public void initAllProperty(User user) {
		Hibernate.initialize(user.getRoles());
	}

	/**
	 * 关联对象初始化函数.
	 */
	public void initAllProperty(List<User> userList) {
		for (User user : userList) {
			initAllProperty(user);
		}
	}
}
