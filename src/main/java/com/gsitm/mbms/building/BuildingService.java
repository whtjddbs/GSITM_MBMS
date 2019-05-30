package com.gsitm.mbms.building;

import java.util.List;

import com.gsitm.mbms.employee.EmployeeDTO;

/**
 * @작성일 : 2019. 5. 23.
 * @작성자 : 김원빈
 */
public interface BuildingService {
	/** 모든 건물 조회 **/
	public List<BuildingDTO> SelectAll();

	public void buildingInsert(BuildingDTO dto);

	public void buildingDelete(int buildNo);
	
	public BuildingDTO buildingUpdateForm(int buildNo);

	public void buildingUpdate(BuildingDTO dto);
}
