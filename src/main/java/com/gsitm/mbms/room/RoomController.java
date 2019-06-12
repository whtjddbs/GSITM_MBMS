package com.gsitm.mbms.room;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.gsitm.mbms.building.BuildingController;
import com.gsitm.mbms.building.BuildingDTO;
import com.gsitm.mbms.building.BuildingService;

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
	
	@Resource(name="uploadPath")
	private String uploadPath; //여기까지해쑴
	
	//Room 목록
	@RequestMapping(value="/roomManageList", method=RequestMethod.GET)
	public String list(Model model) {
		logger.info("Room ListPage!");
		
		List<RoomDTO> rooms = roomService.SelectAll();
		List<BuildingDTO> buildings = buildingService.SelectAll();
		
		model.addAttribute("rooms", rooms);
		model.addAttribute("buildings", buildings);

		return "/room/roomManageList";
	}
	
	//Room 등록
	@RequestMapping(value="/roomInsertForm",method=RequestMethod.GET)
	public String roomInsertForm()  {
		logger.info("Room Insert Form!");
		
		
		return "/room/roomInsertForm";	
	}
	
	//Room 등록
		@RequestMapping(value="/roomInsert",method=RequestMethod.POST)
		public String roomInsert(RoomDTO dto, MultipartFile file) throws Exception {
			logger.info("Room Insert Action!");
			String imgpUploadPath = uploadPath + File.separator + "imgUpload";
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
		
			return "redirect:/room/roomManageList";	
		}
	
}
