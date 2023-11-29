package com.momo.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.dao.BookDao;

@WebServlet("/bookReg")
public class BookRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * 도서 등록 후 메세지 처리
     */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDao bookDao = new BookDao();
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		System.out.println(request.getParameter("content"));
		System.out.println(request.getParameter("imgFile"));
		
		//int res = bookDao.regBook(title, author);
		bookDao.close();
//		if(res >0) {
//			request.setAttribute("msg", "책이 정상적으로 등록되었습니다.");
//			request.getRequestDispatcher("/book/msgbox.jsp?url=/bookList").forward(request, response);
//		}
//		else {
//			request.setAttribute("msg", "등록에 실패했습니다. 관리자에게 문의해주세요.");
//			request.getRequestDispatcher("/book/msgbox.jsp").forward(request, response);
//			
//		}
	}

}
