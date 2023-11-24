package com.momo.lib.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.Criteria;
import com.momo.lib.dto.BookDto;

public class BookDao extends DBConnPool{
	
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
				
				BookDto bookDto = new BookDto(no, title, author, rentyn);
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

				bookDto = new BookDto(no, title, author, rentyn);
			}
			
		} catch (SQLException e) {
			System.out.println("게시글 하나 조회 실패");
			e.printStackTrace();
		}
		
		return bookDto;
	}
	
	
}
