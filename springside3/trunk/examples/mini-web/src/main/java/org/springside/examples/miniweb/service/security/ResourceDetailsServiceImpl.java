package org.springside.examples.miniweb.service.security;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.miniweb.entity.security.Authority;
import org.springside.examples.miniweb.entity.security.Resource;
import org.springside.modules.security.springsecurity.ResourceDetailsService;
import org.springside.modules.security.springsecurity.SpringSecurityUtils;

/**
 * 从数据库查询URL--授权定义Map的实现类.
 * 
 * @author calvin
 */
@Transactional(readOnly = true)
public class ResourceDetailsServiceImpl implements ResourceDetailsService {
	@Autowired
	private SecurityEntityManager securityEntityManager;

	/**
	 * @see ResourceDetailsService#getRequestMap()
	 */
	public LinkedHashMap<String, String> getRequestMap() throws Exception {//NOSONAR
		List<Resource> resourceList = securityEntityManager.getUrlResourceWithAuthorities();

		LinkedHashMap<String, String> requestMap = new LinkedHashMap<String, String>(resourceList.size());
		for (Resource resource : resourceList) {
			List<String> authorityList = new ArrayList<String>();
			for (Authority authority : resource.getAuthorityList()) {
				authorityList.add(SpringSecurityUtils.AUTH_PREFIX + authority.getName());
			}
			requestMap.put(resource.getValue(), StringUtils.join(authorityList, ','));
		}
		return requestMap;
	}
}
