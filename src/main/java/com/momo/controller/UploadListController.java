package com.momo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.FileDao;
import com.momo.dto.FileDto;


@WebServlet("/upload/list")
public class UploadListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FileDao fileDao = new FileDao();
		List<FileDto> list = fileDao.getList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/10upload/list.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("method : post").append(request.getContextPath());
	}

}
