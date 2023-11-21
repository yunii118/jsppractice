package com.momo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.dto.BoardDto;

@WebServlet("/boardWrite")
public class boardWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 정보 확인
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 후 게시글을 작성할 수 있습니다.')");
			out.print("</script>");
		}
		// 파라메터 수집

		String title = request.getParameter("title");			
		String content = request.getParameter("content");			
		
		BoardDto dto = new BoardDto();
		
		dto.setId(session.getId());
		dto.setTitle(title);
		dto.setContent(content);
	}
}
