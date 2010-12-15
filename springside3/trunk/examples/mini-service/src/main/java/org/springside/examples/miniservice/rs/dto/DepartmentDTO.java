package org.springside.examples.miniservice.rs.dto;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

import org.apache.commons.lang.builder.ToStringBuilder;

import com.google.common.collect.Lists;

/**
 * Web Service传输Department信息的DTO.
 * 
 * @author calvin
 */
@XmlRootElement(name = "department")
public class DepartmentDTO {

	private String name;
	private UserDTO manager;
	private List<UserDTO> userList = Lists.newArrayList();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public UserDTO getManager() {
		return manager;
	}

	public void setManager(UserDTO manager) {
		this.manager = manager;
	}

	//配置输出xml为<userList><user><id>1</id></user></userList>
	@XmlElementWrapper(name = "userList")
	@XmlElement(name = "user")
	public List<UserDTO> getUserList() {
		return userList;
	}

	public void setUserList(List<UserDTO> userList) {
		this.userList = userList;
	}

	/**
	 * 重新实现toString()函数方便在日志中打印DTO信息.
	 */
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}