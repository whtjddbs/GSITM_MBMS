package com.gsitm.mbms.equipment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gsitm.mbms.building.BuildingDTO;
import com.gsitm.mbms.building.BuildingService;

import lombok.extern.slf4j.Slf4j;

/**
 * @작성일 : 2019. 6. 20.
 * @작성자 : 김원빈
 */
@Controller
@RequestMapping("/equipment")
@Slf4j
public class EquipmentController {

	@Inject
	EquipmentService service;
	@Inject
	BuildingService buildingService;
	
	@PostMapping("/equipmentInsert")
	public String equipmentInsert(EquipmentDTO dto,String[] roomList) {
		System.out.println(roomList.length);
		for(int i=0;i<roomList.length;i++) {
			System.out.println(roomList[i]);
			service.equipmentInsert(new EquipmentDTO(Integer.parseInt(roomList[i]),0,dto.getEqName(),dto.getEqCount()));
		}
		return "redirect:/equipment/equipmentList";
	}
	
	//equipment 목록
	@RequestMapping(value="/equipmentList", method=RequestMethod.GET)
	public String list(Model model) {
		log.trace("equipment ListPage!");
		
		List<Map<String, Object>> list= service.equipmentSelectAllwithRoom();
		
		List<BuildingDTO> buildings = buildingService.selectAllWithRooms();
		model.addAttribute("list",list);
		
		/*ArrayList<Integer> temp = new ArrayList<>();
		for(int i=0;i<buildings.size();i++) {
			for(int j=0;j<buildings.get(i).getRooms().size();j++) {
				if(buildings.get(i).getRooms().get(j).getRoomNo()==0) {
					System.out.println(buildings.get(i).getBuildName()+"ㅎㅎ인덱스"+i);
					temp.add(i);
					System.out.println(temp.toString());
				}
			}
		}
		System.out.println("빌딩사이즈"+buildings.size());
		System.out.println("템프리스트사이즈:"+temp.size());
		for(int i=temp.size()-1;i>=0;i--) {

			System.out.println(Integer.parseInt(temp.get(i).toString()));
			System.out.println(buildings.get(i).toString());
			buildings.remove(Integer.parseInt(temp.get(i).toString()));
		}
*/		
		model.addAttribute("buildings",buildings);
		System.out.println(buildings.get(3).getRooms().toString());
		return "/equipment/equipmentList";//test
	}
}
