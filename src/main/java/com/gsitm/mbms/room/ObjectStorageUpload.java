package com.gsitm.mbms.room;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.AccessControlList;
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.CompleteMultipartUploadRequest;
import com.amazonaws.services.s3.model.CompleteMultipartUploadResult;
import com.amazonaws.services.s3.model.Grantee;
import com.amazonaws.services.s3.model.GroupGrantee;
import com.amazonaws.services.s3.model.InitiateMultipartUploadRequest;
import com.amazonaws.services.s3.model.InitiateMultipartUploadResult;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PartETag;
import com.amazonaws.services.s3.model.Permission;
import com.amazonaws.services.s3.model.UploadPartRequest;
import com.amazonaws.services.s3.model.UploadPartResult;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.TransferManagerBuilder;
import com.amazonaws.services.s3.transfer.Upload;
import com.amazonaws.services.s3.transfer.model.UploadResult;


public class ObjectStorageUpload {

	private MultipartFile targetFile;
	private int seqNum;
	
	final String endPoint = "https://kr.object.ncloudstorage.com";
	final String regionName = "kr-standard";
	final String accessKey = "";
	final String secretKey = ""; // object storage 접속에 필요한 파라미터
	
	
	
	
	
	public ObjectStorageUpload(MultipartFile file, int seqNum){
		this.targetFile=file;
		this.seqNum=seqNum;
	} // 생성자
	
	
	

	public String sendRequest() throws AmazonClientException, InterruptedException{ //버킷에 올리는데 필요한 매서드

		String bucketName = "bucket-image";
		String extention = targetFile.getOriginalFilename().split("\\.")[1].toLowerCase(); // 확장자 추출 및 소문자 변경 
		String fileNum = convertString(seqNum);
		String objectName = "room"+fileNum+"."+extention; //room000.xxx형태
		File realFile = new File(targetFile.getOriginalFilename());
		
		//ROOM_NO값 가져와서 이거가지고 파일명을 만든다. ex) room000.xxx
		
		try {
			targetFile.transferTo(realFile);
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		} // multipart to normal file
		
		ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentType("image/"+extention);
		long contentLength = realFile.length();
		long partSize = 10 * 1024 * 1024;
		
		try {
            AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
            		.withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
        		    .withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey, secretKey)))
                    .build();
            TransferManager tm = TransferManagerBuilder.standard()
                    .withS3Client(s3Client)
                    .build();
            

            InputStream targetStream = null;
            try {
				targetStream = new FileInputStream(realFile);
			} catch (FileNotFoundException e) {

				e.printStackTrace();
			}
            Upload upload = tm.upload(bucketName, objectName, targetStream, metadata);
            System.out.println("Object upload started");
    

            upload.waitForCompletion();
            System.out.println("Object upload complete");
            
            AccessControlList acl = s3Client.getObjectAcl(bucketName, objectName);


            acl.grantPermission(GroupGrantee.AllUsers, Permission.Read);
            s3Client.setObjectAcl(bucketName, objectName, acl);
        }
        catch(AmazonServiceException e) {
            e.printStackTrace();
        }
        catch(SdkClientException e) {
            e.printStackTrace();
        }
		return "www.hiroo.kr/"+objectName;
	}
	
	public String convertString(int seq) {
		String seqStr="";
		if(seq<10) {
			seqStr = "00"+seq;
		}else if(seq<100) {
			seqStr = "0"+seq;
		}else
			seqStr = ""+seq;
		return seqStr;
	}
}
