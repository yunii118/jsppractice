package com.momo.book.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.momo.dao.FileDao;
import com.momo.dto.FileDto;
import com.oreilly.servlet.MultipartRequest;

public class FileUploadService {
	private int maxSize = 1024 * 1000;
	private String uploadDir = "c:/upload";
	private String encode = "UTF-8";
	
	public FileUploadService() {}

	public FileUploadService(int maxSize, String uploadDir, String encode) {
		this.maxSize = maxSize;
		this.uploadDir = uploadDir;
		this.encode = encode;
	};
	
	public MultipartRequest fileUpload(HttpServletRequest request, String uploadFile, String cate) {
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, uploadDir, maxSize, encode);
			String fileName = mr.getFilesystemName(uploadFile);
			if(fileName != null && !"".equals(fileName)) {
				String oFileName = rename(fileName);
				
				FileDto fileDto = new FileDto();
				fileDto.setCate(cate);
				fileDto.setSfile(oFileName);
				fileDto.setName("");
				fileDto.setOfile(fileName);
				fileDto.setTitle("");
				
				
				// 저장된 파일의 이력 관리 위해 Db에 저장
				FileDao dao = new FileDao();
				dao.regFile(fileDto);
				
			}
			
		} catch (IOException e) {
			System.out.println("fileuploadservice.java 오류 발생");
			e.printStackTrace();
		}
		return mr;
		
	}
	
	public String rename(String fileName) {
		
		String oFileName = "";
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String ext = fileName.substring(fileName.lastIndexOf("."));
		// 원본파일명
		oFileName = fileName.substring(0, fileName.lastIndexOf("."));
		String newFileName = oFileName + now + ext;
		File oldFile = new File("c:/upload/" + fileName);
		File newFile = new File("c:/upload/" + newFileName);
		
		oldFile.renameTo(newFile);
		return newFileName;
	}
	
}
