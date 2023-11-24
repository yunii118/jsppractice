package com.momo.lib.contorller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dto.Criteria;
import com.momo.dto.PageDto;
import com.momo.lib.dao.BookDao;
import com.momo.lib.dto.BookDto;


@WebServlet("/bookList")
public class BookListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 도서목록 조회 후 request영역에 저장
     * bookList.jsp로 페이지 forward
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDao bookDao = new BookDao();
		Criteria cri = new Criteria(request.getParameter("pageNo"), request.getParameter("amount"),
										request.getParameter("searchField"), request.getParameter("searchWord"));
		
		List<BookDto> list = bookDao.getList(cri);
		int totalCnt = bookDao.getTotalCnt(cri);
		PageDto pageDto = new PageDto(totalCnt, cri);
		System.out.println("pageNo" + request.getParameter("pageNo"));
		System.out.println("totalCnt" + totalCnt);
		request.setAttribute("list", list);
		request.setAttribute("pageDto", pageDto);
		
		bookDao.close();
		request.getRequestDispatcher("/lib/bookList.jsp").forward(request, response);
	}

	

}
