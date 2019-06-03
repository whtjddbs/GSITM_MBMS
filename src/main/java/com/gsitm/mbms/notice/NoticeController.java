package com.gsitm.mbms.notice;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gsitm.mbms.employee.EmployeeDTO;

/**
 * @주제 :
 * @작성일 : 2019. 5. 16.
 * @작성자 : 송민기
 */

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeService service;

	/**
	 * 공지사항
	 * 목록-------------------------------------------------------------------------------------
	 * 
	 * @throws Exception
	 */

	// 공지사항 리스트
	// 전체보기-----------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(Model model, HttpServletRequest request) throws Exception {

		List<NoticeDTO> noticeList = service.selectAll();
		model.addAttribute("noticeList", noticeList);

		return "notice/noticeList";
	}


	// 글 작성 폼 보기--------------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeInsertForm", method = RequestMethod.POST)
	public void noticeInsertForm(Model model) throws Exception {
		
	}

	// 글 작성 submit
	@RequestMapping(value = "/noticeInsert", method = RequestMethod.POST)
	public String noticeInsert(NoticeDTO noticeDTO, Model model , HttpSession session /*, MultipartFile file, ModelAndView mav*/) throws Exception {
		/*logger.info("Method-Post Notice write -> writing ", locale);
		logger.info("파일이름 : " + file.getOriginalFilename());
		logger.info("파일크기 : " + file.getSize());
		logger.info("컨텐츠 타입 : " + file.getContentType());

		String savedName = file.getOriginalFilename();
		savedName = uploadFile(savedName, file.getBytes());

		String dbroute = "/resources/img/noticeimg/" + savedName;
		noticeVO.setNotice_image(dbroute);*/
		
		//현재 로그인 정보 가져와서 작성자로 넣기
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("login");
		String empNo = employeeDTO.getEmpNo();
		noticeDTO.setWriterEmpNo(empNo);
		
		
		
		service.insert(noticeDTO);
		return "redirect:/notice/noticeList";
	}

	// 공지사항 글 상세보기-----------------------------------------------------------------------------
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public void noticeDetail(@RequestParam("noticeNo") int noticeNo, Model model) throws Exception {
		
		model.addAttribute("noticeDTO", service.selectByNoticeNo(noticeNo));
	}

	// delete----------------------------------------------------------------------------------------------------
	// 글삭제
	@RequestMapping(value = "/noticeDelete", method = RequestMethod.POST)
	public String noticeDelete(@RequestParam("noticeNo") int noticeNo, Model model) throws Exception {

		service.delete(noticeNo);
		return "redirect:/notice/noticeList";
	}

	// update-----------------------------------------------------------------------------------------------------
	// 글 수정 폼 보기
	@RequestMapping(value = "/noticeUpdateForm", method = RequestMethod.POST)
	public void noticeUpdateForm(@RequestParam("noticeNo") int noticeNo, Model model) throws Exception {
		model.addAttribute("noticeDTO", service.selectByNoticeNo(noticeNo));
	}

	// 글 수정 submit
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String updateSubmit(NoticeDTO noticeDTO, Model model) throws Exception {

		service.update(noticeDTO);

		return "redirect:/notice/noticeList";
	}
	
	
	
	
	
	//파일업로드-----------------------------------------------------------------------------------
	
	
	@RequestMapping(value = "/fileupload",method = RequestMethod.POST)
	public String upload(MultipartFile uploadedfile, HttpServletRequest request){
//	    logger.info("upload() POST 호출");
//	    logger.info("파일 이름: {}", uploadedfile.getOriginalFilename());
//	    logger.info("파일 크기: {}", uploadedfile.getSize());
		final String UPLOAD_PATH = request.getSession().getServletContext().getRealPath("") + "resources\\uploadfiles";
	    //System.out.println(UPLOAD_PATH);
		UploadMyTool.saveFile(uploadedfile, UPLOAD_PATH);
		
	    return "redirect:/notice/noticeList";
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
