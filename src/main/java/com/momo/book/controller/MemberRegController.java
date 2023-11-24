package com.momo.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.dao.MemberDao;


@WebServlet("/book/regProcess")
public class MemberRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// post 메소드는 주소표시줄에서 바로 호출하는경우
	// 기본방식(get)으로 요청이 되어지므로 405오류 발생 가능
		/**
		 * 	회원가입 진행
		 * 
		 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String pwRepeat = request.getParameter("pwRepeat");

		System.out.println("controller 들어옴");
		
		MemberDao memberDao = new MemberDao();
		int res = memberDao.regist(id, name, email, pw);
		memberDao.close();
		if(res == 99) {
			// 동일한 이메일로 가입된 아이디가 있음
			String msg = "이미 가입된 이메일입니다. 다른 이메일을 사용해주세요.";
			request.setAttribute("msg", msg);
			System.out.println("이메일");
			// 회원가입창으로 이동
			request.getRequestDispatcher("/book/msgbox.jsp").forward(request, response);
			
		}
		else if(res == 100) {
			// 동일한 아이디 존재
			String msg ="사용중인 아이디입니다.";
			request.setAttribute("msg", msg);
			System.out.println("동일아이디");
			// 회원가입창으로 이동
			request.getRequestDispatcher("/book/msgbox.jsp").forward(request, response);
		}
		else if(res == 1) {
			// 회원가입 성공
			// 로그인페이지로 이동
			String msg ="회원가입 성공! 로그인 후 이용해주세요";
			request.setAttribute("msg", msg);
			
			request.getRequestDispatcher("/book/msgbox.jsp").forward(request, response);
		}
		else {
			// 회원가입 실패
			String msg ="회원가입 실패, 관리자에게 문의해주세요.";
			request.setAttribute("msg", msg);
			
			request.getRequestDispatcher("/book/msgbox.jsp").forward(request, response);
		}
		
	
	}

}
