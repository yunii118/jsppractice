package com.momo.book.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.dao.BookDao;
import com.momo.book.service.FileUploadService;
import com.momo.dto.FileDto;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/book/regFileupload")
public class BookRegFileUpoadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("method : get").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 첨부파일 저장
		FileUploadService fileUploadService = new FileUploadService();
		MultipartRequest mr = fileUploadService.fileUpload(request, "img", "book");
	}

}
