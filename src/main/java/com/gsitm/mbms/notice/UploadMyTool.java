package com.gsitm.mbms.notice;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

/**
 * @주제 :
 * @작성일 : 2019. 5. 16.
 * @작성자 : 송민기
 */

public class UploadMyTool {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	public static String saveFile(MultipartFile file, String uploadPath){
		
		
		// 디렉토리가 존재하면
        if (new File(uploadPath).exists()){
            
        }else { // 디렉토리가 존재하지 않으면
        	File dirPath = new File(uploadPath);
        	dirPath.mkdir(); //디렉토리 생성
        }
       
		
	    // 파일 이름 변경
	    UUID uuid = UUID.randomUUID();
	    String saveName = uuid + "_" + file.getOriginalFilename();

	    logger.info("saveName: {}",saveName);

	    // 저장할 File 객체를 생성(껍데기 파일)
	    File saveFile = new File(uploadPath,saveName); // 저장할 폴더 이름, 저장할 파일 이름

	    try {
	        file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘(파일 이름, 경로 지정하기 위해)
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }
	    logger.info("saveName2: {}",saveName);

	    return saveName;
	} // end saveFile(
	
	
}
