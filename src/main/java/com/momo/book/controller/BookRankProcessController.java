package com.momo.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.dao.BookDao;
import com.momo.book.dto.BookDto;


@WebServlet("/bookRank")
public class BookRankProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDao bookDao = new BookDao();
		List<BookDto> list = bookDao.getRank();
		bookDao.close();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/book/popularBook.jsp").forward(request, response);
	}

}
