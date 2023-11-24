package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDao;
import com.momo.dto.Criteria;
import com.momo.dto.PageDto;


// 06session - servletEx
/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/boardList")
public class BoardListController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("검색어" + request.getParameter("searchWord"));
		System.out.println("검색필드" + request.getParameter("searchField"));
		
		// 리스트를 조회하기 위한 파라메터 수집
		Criteria cri = new Criteria(request.getParameter("pageNo"), 
									request.getParameter("amount"),
									request.getParameter("searchField"),
									request.getParameter("searchWord"));
		
		// 리스트 조회 후 리퀘스트 영역에 저장
		BoardDao dao = new BoardDao();
		request.setAttribute("list", dao.getList(cri));
		System.out.println(cri);
		
		
		// 페이지 블럭 생성 위해 필요한 정보 저장
		// 조회조건 세팅하지 않으면 조회되는 게시글의 건수와 페이지블럭이 다르게 표시될 수 있음
	
		PageDto pageDto = new PageDto(dao.getTotalCnt(cri), cri);
		request.setAttribute("pageDto", pageDto);
		
		dao.close();
		// 페이지 전환
		// forward 방식으로 전환하므로 request 영역 공유됨
		request.getRequestDispatcher("/06session/servletEx/board.jsp").forward(request, response);
	
	}


}
