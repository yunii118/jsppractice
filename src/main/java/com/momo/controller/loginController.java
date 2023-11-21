package com.momo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.dao.BoardDao;
import com.momo.dao.MemberDao;
import com.momo.dto.BoardDto;
import com.momo.dto.MemberDto;


@WebServlet("/loginProcess")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  /**
   * Controller의 역할
   *  - 파라메터 수집
   *  - 페이지 전환(jsp로 요청 위임)
   * 
   * 
   * 사용자의 로그인 요청을 처리
   * 1. 파라메터 수집(id, pw)
   * 2. DB로부터 해당 사용자가 존재하는지 확인
   * 3. 존재하면 로그인 처리(세션에 사용자 정보 저장)
   * 4. 사용자가 존재하지 않으면 이전페이지로 넘어가서 오류메세지 출력
   */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("user_id"); 
		String pw = request.getParameter("user_pw");
		
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.login(id, pw);
		
		if(dto != null) {
			session.setAttribute("userId", id);
			session.setAttribute("memberDto", dto);
			
			// 게시글 조회 후 request에 담아줌
			//BoardDao boardDao = new BoardDao();
			//List<BoardDto> list = boardDao.getList();
			//request.setAttribute("list", list);
			
			// sendRedirect 룰 이용할 경우 request 영역이 공유되지 않음
			// list값을 전달할 수 없기 때문에 forward 방식을 이용해야함
			
			//request.getRequestDispatcher("/06session/servletEx/board.jsp").forward(request, response);
			response.sendRedirect("/boardList");
		}
		else {
			dao.close();
			request.getRequestDispatcher("/06session/servletEx/loginForm.jsp?isError=1").forward(request, response);
		}
	}

}
