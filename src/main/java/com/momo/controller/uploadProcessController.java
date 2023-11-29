package com.momo.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.FileDao;
import com.momo.dto.FileDto;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/upload/uploadProcess")
public class uploadProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("method : get").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("request.getParameter()" + request.getParameter("name"));
		// 업로드된 파일의 정보 출력
		/*
		 * 1. MultipartRequest 객체 생성
		 * 		요청파일을 해당 경로에 저장
		 * 			- 파일을 저장할 경로를 지정해주어야 함
		 * 			- 파일의 최대 사이즈를 지정
		 * 			- 한글 깨짐이 발생할 수 있으므로 인코딩 타입을 지정
		 * 			
		 * 			객체가 정상적으로 생성되면 파일은 자동으로 지정 경로에 저장됨 
		 * */
		MultipartRequest mr = new MultipartRequest(request, "c:/upload", 1024*1000, "utf-8");
		System.out.println("mr.getParameter()" + mr.getParameter("name"));
		System.out.println("mr.getParameter()" + mr.getParameter("title"));
		System.out.println("mr.getParameter()" + mr.getParameter("cate"));

		System.out.println("mr.getParameter()" + mr.getParameterValues("cate"));
		
		// 요청 정보를 수집하여 DTO 객체 생성
		// 업로드된 정보를 DB에 저장하기 위해
		FileDto fileDto = new FileDto();
		
		fileDto.setName(mr.getParameter("name"));
		fileDto.setTitle(mr.getParameter("title"));
		fileDto.setCate(mr.getParameterValues("cate"));
		
		System.out.println("========================");
		System.out.println("fileDto" + fileDto);
		// name 속성 이용하여 파일 확인
		String fileName = mr.getFilesystemName("attatchedFile");
		/**
		 * 파일이 첨부된 경우
		 * 	- 중복된 파일을 업로드하는 경우 기존에 저장된 파일이 소실될 우려가 있으므로 파일명을 변경하여 저장
		 *  - 파일을 저장할 때에는 /년/월/일 폴더를 생성 후 파일명에 날짜를 붙여서 저장
		 *  - 파일을 저장할 때 파일명_날짜시간.확장자
		 */
		if(fileName != null && !"".equals(fileName)) {
			// 새로운 파일이름을 생성 : 원본파일명 + 시간날짜 + 확장자
			// H : 0~23, S : milisecond
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			// 첨부파일의 확장자
			String ext = fileName.substring(fileName.lastIndexOf("."));
			
		
			// 원본파일명
			String oFileName = fileName.substring(0, fileName.lastIndexOf("."));
			// 새파일명
			String newFileName = oFileName + "_" + now + ext;

			File oldFile = new File("c:/upload/" + fileName);
			File newFile = new File("c:/upload/" + newFileName);
			
			oldFile.renameTo(newFile);
			
			// 원본파일명과 변경된 파일명을 각각 DTO에 저장
			fileDto.setOfile(fileName);
			fileDto.setSfile(newFileName);
			
			
		}
		System.out.println("파일명 : " + fileName);
		
		// 입력된 내용을 DB에 저장
		FileDao dao = new FileDao();
	
		int res = dao.regFile(fileDto);
		
		if(res>0) {
			request.setAttribute("msg", "등록되었습니다.");
			//list.jsp를 바로 호출하면 데이터 호출할 수 없음
			// 서블릿 호출
			request.getRequestDispatcher("/book/msgbox.jsp?url=/upload/list").forward(request, response);
		}
		else {
			request.setAttribute("msg", "등록중 예외사항이 발생하였습니다. 관리자에게 문의해주세요.");
			request.getRequestDispatcher("/book/msgbox.jsp").forward(request, response);
		}
	}

}
