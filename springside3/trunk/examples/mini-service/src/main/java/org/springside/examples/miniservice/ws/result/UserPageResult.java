package org.springside.examples.miniservice.ws.result;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlType;

import org.springside.examples.miniservice.WsConstants;
import org.springside.examples.miniservice.ws.dto.UserDTO;
import org.springside.examples.miniservice.ws.result.base.PageResult;
import org.springside.modules.orm.Paginator;

/**
 * 包含User的分页result,从PageResult继承
 * 
 * @author calvin
 * @author badqiu
 */
@XmlType(name = "UserPageResult", namespace = WsConstants.NS)
public class UserPageResult extends PageResult {

	private List<UserDTO> userList;

	public UserPageResult() {
		super();
	}

	public UserPageResult(List<UserDTO> userList,Paginator paginator) {
		super(paginator);
		this.userList = userList;
	}

	@XmlElementWrapper(name = "userList")
	@XmlElement(name = "user")
	public List<UserDTO> getUserList() {
		return userList;
	}

	public void setUserList(List<UserDTO> userList) {
		this.userList = userList;
	}
}
