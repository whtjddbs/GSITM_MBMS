package com.gsitm.mbms.room;


import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gsitm.mbms.building.BuildingController;
import com.gsitm.mbms.building.BuildingDTO;
import com.gsitm.mbms.building.BuildingService;
import com.gsitm.mbms.employee.EmployeeDAO;
import com.gsitm.mbms.equipment.EquipmentDTO;
import com.gsitm.mbms.equipment.EquipmentService;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 3.
 * @작성자 : 김원빈
 */
@Controller
@RequestMapping("/room")
public class RoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(BuildingController.class);
	
	@Inject
	private BuildingService buildingService;
	@Inject
	private RoomService roomService;
	@Inject
	private EquipmentService equipmentService;
	@Inject
	private EmployeeDAO eDao;
	
	@Resource(name="uploadPath")
	private String uploadPath; 
	
	//Room 목록
	@RequestMapping(value="/roomManageList", method=RequestMethod.GET)
	public String list(Model model) {
		logger.info("Room ListPage!");
		List<RoomDTO> rooms = roomService.selectAllWithEquipments();
		//List<RoomDTO> rooms = roomService.selectAllRoom();
		List<BuildingDTO> buildings = buildingService.selectAll();
		
		model.addAttribute("rooms", rooms);
		model.addAttribute("buildings", buildings);

		return "/room/roomManageList";
	}
	
	//Room 등록화면이동
	@RequestMapping(value="/roomInsertForm",method=RequestMethod.GET)
	public String roomInsertForm(Model model)  {
		logger.info("Room Insert Form!");
		
		List<BuildingDTO> buildings = buildingService.selectAll();
		model.addAttribute("buildings", buildings);
		
		List<EquipmentDTO> equipments = equipmentService.equipmentDistinctSelect();
		model.addAttribute("equipments",equipments);
		return "/room/roomInsertForm";	
	}
	
	//Room 등록
		@RequestMapping(value="/roomInsert",method=RequestMethod.POST)
		public String roomInsert(RoomDTO dto, String eqNameList,String eqCountList,MultipartFile file, HttpServletRequest request) throws Exception {
			logger.info("Room Insert Action!");
			String imgpUploadPath = request.getSession().getServletContext().getRealPath("/resources/") + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgpUploadPath);
			String fileName = null;
			if(file !=null) {
				fileName = UploadFileUtils.fileUpload(imgpUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			}
			else {
				fileName=uploadPath+File.separator+"images"+File.separator+"non.png";
			}
			
			dto.setRoomImg(File.separator +"imgUpload"+ymdPath+File.separator+fileName);
			System.out.println(dto.getRoomImg());
			roomService.roomInsert(dto);
			
			StringTokenizer nameToken = new StringTokenizer(eqNameList, ",");
			StringTokenizer countToken = new StringTokenizer(eqCountList, ",");
			
			 while(nameToken.hasMoreTokens()) {	 
				 EquipmentDTO equipmentDTO = new EquipmentDTO(dto.getRoomNo(),0, nameToken.nextToken(),Integer.parseInt(countToken.nextToken()));
				 equipmentService.equipmentInsert(equipmentDTO);
			 }
		
			return "redirect:/room/roomManageList";	
		}
		
		@RequestMapping(value="/getEmployeeSearch",method=RequestMethod.POST)
		public ModelAndView getEmployeeList(Model model) {
			
			List<Map<String, Object>> employees = eDao.getEmployeeList();
			System.out.println(employees.size());
			System.out.println(employees.toString());
			ModelAndView mav = new ModelAndView();
			mav.addObject("employees",employees);
			mav.setViewName("jsonView");
			return mav;
		}
}
