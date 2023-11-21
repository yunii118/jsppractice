package com.momo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.DeptDao;
import com.momo.dto.DeptDto;

/**
 * url 매핑(/deptList 페이지를 요청하면 실행)
 * - 요청 메서드에 따라서 실행되는 메서드가 결정
 * 
 * 주소표시줄, 링크 - > get방식 -> doGet메서드 실행
 * 
 * Controller
 * - 사용자의 요청 정보 수집
 * - 비지니스 로직(서비스로 만듬) 호출
 * - View로 페이지 전환
 */
@WebServlet("/deptList")
public class DeptListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeptListController() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// DB에 접근해서 리스트를 조회
		DeptDao dao = new DeptDao(request.getServletContext());
		List<DeptDto> list = dao.getList();
		
		request.setAttribute("list", list);
		// Controller에서 화면을 구성하는 태그를 자성하는 것은
		// 매우 번거롭기 때문에 JSP 이용하여 화면 작성 후 페이지 전환
		request.getRequestDispatcher("deptList.jsp").forward(request, response);
		
		
	}



}
