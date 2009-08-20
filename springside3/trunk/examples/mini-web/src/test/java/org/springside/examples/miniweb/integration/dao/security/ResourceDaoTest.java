package org.springside.examples.miniweb.integration.dao.security;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.examples.miniweb.dao.security.ResourceDao;
import org.springside.examples.miniweb.data.SecurityData;
import org.springside.examples.miniweb.entity.security.Resource;
import org.springside.modules.test.spring.SpringTxTestCase;

public class ResourceDaoTest extends SpringTxTestCase {
	@Autowired
	private ResourceDao entityDao;

	@Test
	public void crudEntity() {
		//new entity and save it. 
		Resource entity = SecurityData.getRandomResource();
		entityDao.save(entity);
		flush();

		//find entity.
		Resource entityFromDB = entityDao.findUniqueBy("id", entity.getId());
		assertReflectionEquals(entity, entityFromDB);

		//delete entity.
		entityDao.delete(entity.getId());
		flush();
		entity = entityDao.findUniqueBy("id", entity.getId());
		assertNull(entity);
	}
}