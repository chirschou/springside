package org.springside.examples.miniservice.service.account;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.miniservice.dao.account.AccountDao;
import org.springside.examples.miniservice.entity.account.Department;
import org.springside.examples.miniservice.entity.account.User;
import org.springside.modules.orm.Page;

/**
 * 帐号管理类.
 * 
 * 实现领域对象用户及其相关实体的所有业务管理函数.
 * 使用Spring annotation定义事务管理.
 * 
 * @author calvin
 */
//Spring Service Bean的标识.
@Component
//默认将类中的所有函数纳入事务管理.
@Transactional
public class AccountManager {

	private AccountDao accountDao = null;

	@Transactional(readOnly = true)
	public Department getDepartmentDetail(Long id) {
		return accountDao.getDepartmentDetail(id);
	}

	@Transactional(readOnly = true)
	public User getUser(Long id) {
		return accountDao.getUser(id);
	}

	@Transactional(readOnly = true)
	public Page<User> searchUser(Map<String, Object> parameters,int pageNo,int pageSize) {
		return accountDao.searchUser(parameters, pageNo, pageSize);
	}
	
	public Long saveUser(User user) {
		return accountDao.saveUser(user);
	}

	@Autowired
	public void setAccountDao(AccountDao accountDao) {
		this.accountDao = accountDao;
	}
}
