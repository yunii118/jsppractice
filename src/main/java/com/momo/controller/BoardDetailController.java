package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDao;
import com.momo.dto.BoardDto;


@WebServlet("/boardRead")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1건의 게시글 조회
		String num = request.getParameter("num");
		System.out.println("요청 게시글 번호 : " + num);
		BoardDao dao = new BoardDao();
		// 조회수 증가
		dao.visitcountUp(num);
		// 상세보기 조회
		BoardDto dto = dao.getOne(num);
		request.setAttribute("dto", dto);
		dao.close();
		// 페이지 전환
		request.getRequestDispatcher("/06session/servletEx/boardDetailEl.jsp").forward(request, response);
	}

	

}
