package com.momo.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.dao.MemberDao;


@WebServlet("/regProcess")
public class MemberRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String pwRepeat = request.getParameter("pwRepeat");
		
		MemberDao memberDao = new MemberDao();
		int res = memberDao.regist(id, name, email, pw, pwRepeat);
		memberDao.close();
		if(res == 99) {
			// 동일한 이메일로 가입된 아이디가 있음
			String msg = "이미 가입된 이메일입니다. 다른 이메일을 사용해주세요.";
			request.setAttribute("msg", msg);
			// 회원가입창으로 이동
			request.getRequestDispatcher("book/register.html").forward(request, response);
			
		}
		else if(res == 100) {
			// 동일한 아이디 존재
			String msg ="사용중인 아이디입니다.";
			request.setAttribute("msg", msg);
			// 회원가입창으로 이동
			request.getRequestDispatcher("book/register.html").forward(request, response);
		}
		else if(res == 101) {
			// 패스워드와 패스워드repeat이 같지 않음
			String msg ="두 비밀번호가 같지 않습니다. 다시 확인해주세요.";
			request.setAttribute("msg", msg);
			// 회원가입창으로 이동
			request.getRequestDispatcher("book/register.html").forward(request, response);
			
		}
		else {
			// 회원가입 성공
			// 로그인페이지로 이동
			response.sendRedirect("/lib/loginForm.jsp");
		}
		
	
	}

}
