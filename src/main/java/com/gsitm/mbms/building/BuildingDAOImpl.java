package com.gsitm.mbms.building;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @작성일 : 2019. 5. 23.
 * @작성자 : 김원빈
 */


@Repository
public class BuildingDAOImpl implements BuildingDAO{

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<BuildingDTO> SelectAll() {
		// TODO Auto-generated method stub
		System.out.println("다오"+sqlSession.selectList("buildingMapper.allBuilding"));
		return sqlSession.selectList("buildingMapper.allBuilding");
	}
	
	
}
