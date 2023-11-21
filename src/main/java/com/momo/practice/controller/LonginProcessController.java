package com.momo.practice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.dao.MemberDao;


@WebServlet("/loginPractice")
public class LonginProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		String id = request.getParameter("user_id").toString();
		String pw = request.getParameter("user_pw").toString();
		if(dao.login(id, pw)!= null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
			request.getRequestDispatcher("/practice/boardMain.jsp").forward(request, response);
		}
		else {
			// 로그인 실패
			// 다시 로그인폼으로 이동, 에러메세지
			response.sendRedirect("/practice/loginForm.jsp?isErr=1");
		}
	}

}
