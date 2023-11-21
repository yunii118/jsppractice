package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.dao.MemberDao;
import com.momo.dto.MemberDto;

/**
 * Servlet implementation class loginController
 */
@WebServlet("/06session/ex/loginProcess")
public class loginProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청 파라메터 수집
		MemberDao dao = new MemberDao();
		// 사용자 인증
		MemberDto memberDto = dao.login(request.getParameter("user_id"), request.getParameter("user_pw"));
		if(memberDto != null) {
			// session 영역에 memberDto 저장
			HttpSession session = request.getSession();
			//세션의 만료기간이 남아있고 웹브라우저를 닫을 때 까지 세션 정보가 서버에 유지
			session.setAttribute("memberDto", memberDto);
			session.setAttribute("userId", memberDto.getId());
			request.getRequestDispatcher("/06session/ex/main.jsp").forward(request, response);
		}
		else {
			response.sendRedirect("loginForm.jsp?loginErr=1");
		}
	}

}
