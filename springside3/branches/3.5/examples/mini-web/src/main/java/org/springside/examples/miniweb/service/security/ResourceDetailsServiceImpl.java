package org.springside.examples.miniweb.service.security;

import java.util.LinkedHashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.miniweb.entity.security.Resource;
import org.springside.modules.security.springsecurity.ResourceDetailsService;

/**
 * 从数据库查询URL--授权定义Map的实现类.
 * 
 * @author calvin
 */
@Transactional(readOnly = true)
public class ResourceDetailsServiceImpl implements ResourceDetailsService {
	@Inject
	private SecurityEntityManager securityEntityManager;

	/**
	 * @see ResourceDetailsService#getRequestMap()
	 */
	public LinkedHashMap<String, String> getRequestMap() throws Exception {//NOSONAR
		List<Resource> resourceList = securityEntityManager.getUrlResourceWithAuthorities();

		LinkedHashMap<String, String> requestMap = new LinkedHashMap<String, String>(resourceList.size());
		for (Resource resource : resourceList) {
			requestMap.put(resource.getValue(), resource.getPrefixedAuthNames());
		}
		return requestMap;
	}
}