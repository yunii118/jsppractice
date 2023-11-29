package com.momo.book.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.book.dto.BookDto;
import com.momo.common.DBConnPool;
import com.momo.dao.FileDao;
import com.momo.dto.Criteria;
import com.momo.dto.FileDto;

public class BookDao extends DBConnPool {
	
	/**
	 * 조건을 만족하는 리스트 출력
	 * @param cri
	 * @return
	 */
	
	public List<BookDto> getList(Criteria cri) {
		List<BookDto> list = new ArrayList<>();
		// 제목이 ㅇㅇ인 / 작가가 ㅇㅇ인
		String where = "";
		if(!"".equals(cri.getSearchField()) 
				&& !"".equals(cri.getSearchWord())) {
			where = "where " + cri.getSearchField() + " like '%" + cri.getSearchWord()+"%'";
		}
		if("available".equals(cri.getSearchRent())) {
			where = where + " and rentyn ='N'";
		}
		String sql = "select * from book\r\n"
				+ where
				+ "\r\n order by no desc";
		
		
		try {
			sql = pageingQuery(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cri.getStartNum());
			pstmt.setInt(2, cri.getEndNum());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("no");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String rentyn = rs.getString("rentyn");
				int visitcount = rs.getInt("visitcount");
				
				BookDto bookDto = new BookDto(no, title, author, rentyn, visitcount);
				list.add(bookDto);
			}
		} catch (SQLException e) {
			System.out.println("list 조회 실패");
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 *  위 조건을 만족하는 총 게시물 갯수
	 */
	public int getTotalCnt(Criteria cri) {
		String where = "";
		int res = 0;
		
		if(!"".equals(cri.getSearchField()) && !"".equals(cri.getSearchWord())) {
			where="where " + cri.getSearchField() + " like '%" + cri.getSearchWord() + "%'";
		}
		
		String sql = "select count(*) from(\r\n"
				+ "select rownum rnum, b.* from\r\n"
				+ "(select * from book\r\n"
				+ where
				+ ")b)";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("totalcount 실패");
			e.printStackTrace();
		}
		return res;
		
	}
	
	/**
	 * 게시글 하나를 조회하는 함수
	 */
	public BookDto getOne(String num) {
		String sql = "select * from book\r\n"
				+ "where no = ?";
		BookDto bookDto = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String no = rs.getString("no");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String rentyn = rs.getString("rentyn");
				int visitcount = rs.getInt("visitcount");

				bookDto = new BookDto(no, title, author, rentyn, visitcount);
			}
			
		} catch (SQLException e) {
			System.out.println("게시글 하나 조회 실패");
			e.printStackTrace();
		}
		
		return bookDto;
	}
	
	public int[] regBook(String title, String author, FileDto fileDto) {
		FileDao fileDao = new FileDao();
		int fRes = fileDao.regFile(fileDto);
		
		String sql = "insert into book(no, title, rentyn, author)\r\n"
				+ "     values (seq_book_no.nextval, ?, 'N', ?)";
		int res = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, author);
			
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("책 업데이트 실패");
			e.printStackTrace();
		}
		int[] result = {res, fRes};
		
		return result;
	}
	/*
	 * 게시글 조회수 상승
	 * */
	public int visitcountUp(String no) {
		String sql = "update book\r\n"
				+ "set visitcount = visitcount +1\r\n"
				+ "where no = ?";
		int res = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("countup 실패");
			e.printStackTrace();
		}
		return res;
	}
	
	public List<BookDto> getRank() {
		String sql = "select rownum as rnum, b.* from( \r\n"
				+ "select * from book\r\n"
				+ "order by visitcount desc) b\r\n"
				+ "where rownum <=5";
		List<BookDto> list = new ArrayList<>();
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String no = rs.getString("no");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String rentYn = rs.getString("rentYn");
				int visitcount = rs.getInt("visitcount");
				
				BookDto bookDto = new BookDto(no, title, author, rentYn, visitcount);
				list.add(bookDto);
			}
			
		} catch (SQLException e) {
			System.out.println("순위 집계 실패");
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	
}
