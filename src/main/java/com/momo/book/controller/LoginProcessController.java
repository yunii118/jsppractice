package com.momo.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.book.dao.MemberDao;
import com.momo.book.dto.MemberDto;




@WebServlet("/login")
public class LoginProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		MemberDao memberDao = new MemberDao();
		MemberDto memberDto = memberDao.getLogin(id, pw);
		memberDao.close();
		if(memberDto != null) {
			String url = "";
			if(request.getParameter("from") != null && !"".equals(request.getParameter("from"))) {
				url = request.getParameter("from");
			}else {
				url = "/bookList";
			}
			System.out.println("url : " + url);
			HttpSession session = request.getSession();
			session.setAttribute("userId", memberDto.getId());
			
			response.sendRedirect(url);
		}else {
			response.sendRedirect("/lib/loginForm.jsp?isError=1");
		}
	}

}
