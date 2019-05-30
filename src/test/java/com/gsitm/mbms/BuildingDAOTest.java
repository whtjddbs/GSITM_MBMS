
package com.gsitm.mbms;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gsitm.mbms.building.BuildingDAO;
import com.gsitm.mbms.building.BuildingDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class BuildingDAOTest {

	@Inject
	private BuildingDAO dao;

	Logger logger = Logger.getLogger(BuildingDAOTest.class);

	@Test
	public void TestWaitingList() {

		List<BuildingDTO> list = dao.SelectAll();

		for (BuildingDTO buildingDTO : list) {
			logger.info(buildingDTO);
		}

	}
	
	@Test
	public void TestBuildingSelectList() {

		logger.info(dao.buildingSelect(113));
	}

}