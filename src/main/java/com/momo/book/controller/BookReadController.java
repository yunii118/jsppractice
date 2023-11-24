package com.momo.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.lib.dao.BookDao;
import com.momo.lib.dto.BookDto;


@WebServlet("/bookRead")
public class BookReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		
		BookDao bookDao = new BookDao();
		BookDto bookDto = bookDao.getOne(no);
		
		request.setAttribute("bookDto", bookDto);
		System.out.println("no : "+no);
		bookDao.close();
		request.getRequestDispatcher("/lib/bookRead.jsp").forward(request, response);
		
	}

}
