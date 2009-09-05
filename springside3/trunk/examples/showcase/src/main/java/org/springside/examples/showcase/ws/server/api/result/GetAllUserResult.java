package org.springside.examples.showcase.ws.server.api.result;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlType;

import org.springside.examples.showcase.ws.server.api.Constants;
import org.springside.examples.showcase.ws.server.api.dto.UserDTO;

/**
 * GetAllUser方法的返回结果类型.
 * 
 * @author calvin
 */
@XmlType(name = "GetAllUserResult", namespace = Constants.NS)
public class GetAllUserResult extends WSResult {
	private static final long serialVersionUID = 4739558570080898049L;

	private List<UserDTO> userList;

	@XmlElementWrapper(name = "userList")
	@XmlElement(name = "user")
	public List<UserDTO> getUserList() {
		return userList;
	}

	public void setUserList(List<UserDTO> userList) {
		this.userList = userList;
	}
}