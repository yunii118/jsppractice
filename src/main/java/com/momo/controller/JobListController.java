package com.momo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.JobDao;
import com.momo.dto.JobDto;

/**
 * 사용자가 /JobListController 경로를 요청하면
 * 요청 URL 매핑에 의해 서블릿 실행
 * 
 * 요청 전달된 메서드에 의해 실행될 메서드가 결정됨
 * - 사용자가 지정하지 않은 경우 get 방식(링크 클릭, 주소창에서 직접 입력)
 * 
 * get 방식의 요청에 의해서는 doGet 메서드 호출
 * post 방식의 요청에 의해서는 doPost 메서드 호출됨
 * 해당 요청 방식이 구현되어 있지 않은 경우, 오류가 발생한다.
 * 
 * 서블릿이 아닌 java파일을 서버를 통해 실행할 경우, 404 오류 발생
 * 
 */
@WebServlet("/jobList") // 요청 URL 매핑
public class JobListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * DB로부터 직급 목록을 리스트로 전달 받아서 화면에 출력
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 직급 목록을 조회
		// 2. 화면에 직급 목록 출력
		
		// jsp의 내장객체 applicaiton = request.getServletContext()
		JobDao jobDao = new JobDao(request.getServletContext());                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
		List<JobDto> list = jobDao.getList();
		System.out.println("=========jobList");
		System.out.println(list);
		
		request.setAttribute("jobList", list);
		request.getRequestDispatcher("/jdbc/jobList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
