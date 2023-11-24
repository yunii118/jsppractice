package com.momo.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.dao.MemberDao;


@WebServlet("/findPw")
public class FindPasswordProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		MemberDao memberDao = new MemberDao();
		String pw = memberDao.findPw(id, email);
		memberDao.close();
		if(pw != null && !"".equals(pw)) {
			// 찾기 성공
			String msg = id + "님의 비밀번호는 " + pw+"입니다.";
			System.out.println(msg);
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/book/msgbox.jsp?url=/lib/loginForm.jsp").forward(request, response);
			
			
		}else {
			// 찾기 실패
			String msg = "아이디 또는 이메일이 올바르지 않습니다. 다시 입력해주세요.";
			System.out.println(msg);
			request.setAttribute("msg",	msg);
			
			request.getRequestDispatcher("/book/msgbox.jsp").forward(request, response);
		}
		
	}

}
