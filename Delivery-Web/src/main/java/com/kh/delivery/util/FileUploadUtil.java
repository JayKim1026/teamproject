package com.kh.delivery.util;

import java.io.File;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class FileUploadUtil implements Codes, Keys {
	
	// s3 버킷 이름
	private static String BUCKET = "delivery-img2";
	
	// s3 엑세스
	private static AmazonS3 access() {
		AWSCredentials credentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);
		ClientConfiguration clientConfig = new ClientConfiguration();
		clientConfig.setProtocol(Protocol.HTTP);
		
		// 대희 계정에 접속? 오라클 접속이랑 비슷
		final AmazonS3 s3 = new AmazonS3Client(credentials, clientConfig);
		s3.setEndpoint("s3.ap-northeast-2.amazonaws.com");
		
		return s3;
	}
	
	// 이미지 파일인지 확인하기
	// 예시 FileUploadUtil.isImage(fileName);
	public static boolean isImage(String fileName) {
		int dotIndex = fileName.lastIndexOf(".");
		String extName = fileName.substring(dotIndex+1);
		String upper = extName.toUpperCase();
		if(!upper.equals("JPG") && !upper.equals("PNG") && !upper.equals("GIF")) {
			return false;
		} else {
			return true;
		}
	}
	
	// 파일 업로드
	// 예시 FileUploadUtil.upload(file, FileUploadUtil.DLVR_IMG);
	public static void upload(File file, String fileName) {
		AmazonS3 s3 = access();
		PutObjectRequest putObjectRequest = new PutObjectRequest(BUCKET, fileName, file);
		putObjectRequest.setCannedAcl(CannedAccessControlList.PublicReadWrite);
		s3.putObject(putObjectRequest);
	}
	
	// 파일 삭제
	// 예시 FileUploadUtil.delete("dog.jpg", FileUploadUtil.DLVR_IMG);
	public static void delete(String fileName) {
		AmazonS3 s3 = access();
		s3.deleteObject(BUCKET, fileName);
	}
	
	// 파일 이름 수정
	// 예시 FileUploadUtil.modify("dog.jpg", "dog2.jpg", FileUploadUtil.DLVR_IMG);
	public static void modify(String org_fileName, String mod_fileName) {
		AmazonS3 s3 = access();
		CopyObjectRequest copyObjectRequest = new CopyObjectRequest(BUCKET, org_fileName, BUCKET, mod_fileName);
		copyObjectRequest.setCannedAccessControlList(CannedAccessControlList.PublicReadWrite);
		s3.copyObject(copyObjectRequest);
		s3.deleteObject(BUCKET, org_fileName);
	}
	
	
}
