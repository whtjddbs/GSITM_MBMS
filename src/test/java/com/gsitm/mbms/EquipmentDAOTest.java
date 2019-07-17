package com.gsitm.mbms;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gsitm.mbms.equipment.EquipmentDAO;
import com.gsitm.mbms.equipment.EquipmentDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 19.
 * @작성자 : 조성윤
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class EquipmentDAOTest {

	@Autowired
	EquipmentDAO equipmentDAO;
	
	@Test
	public void test() {
		assertThat(equipmentDAO, is(notNullValue()));
	}
	
	@Test
	public void selectOneByRoomNoTest() {
		List<EquipmentDTO> list = equipmentDAO.selectOneByRoomNo(101);
		System.out.println("equipment list: "+ list);
	}

}
