package com.momo.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.BoardDto;
import com.momo.dto.Criteria;

// DBConnPool : 톰캣에서 제공해주는 기능 사용. 커넥션 풀이라는 공간에 커넥션 객체를 미리 생성해놓고 사용
//				main 메서드 사용 불가능. 서버가 실행되어야 사용 가능
// 만약, main 메서드를 이용해야 한다면 DBConnection을 사용해야함
public class BoardDao extends DBConnPool{
	// data access object
	
	//public int insertBoard(BoardDto dto) {
	//	return 1;
	//}
	
	/**
	 * 게시글 삭제
	 */
	public int deleteBoard(String num) {
		String sql = "delete from board where num = ?";
		int res = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	/**
	 * 게시글의 조회수를 1 증가시켜줌
	 * insert, update, delete의 반환타입은 int(몇건이 처리되었는지 반환)
	 * 반환타입을 int로 설정
	 * 
	 * @return
	 */
	public int visitcountUp(String num) {
		String sql = "update board\r\n"
				+ "set visitcount = visitcount +1\r\n"
				+ "where num = ?";
		int res = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	/**
	 * 한건의 게시글을 조회하여 반환
	 * @return BoardDto
	 */
	public BoardDto getOne(String num) {
		BoardDto dto = null;
		String sql = "select * from board where num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDto();
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setTitle(rs.getString("title"));
				dto.setPostdate(rs.getString("Postdate"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	/**
	 * 게시글 목록을 반환 
	 * @return List<BoardDto>
	 */
	public List<BoardDto> getList(Criteria cri){
		List<BoardDto> list = new ArrayList<>();
		String where = "";
		if(cri.getSearchField() != null && !"".equals(cri.getSearchField())
				&&cri.getSearchWord() != null && !"".equals(cri.getSearchWord())) {
			where = "where "+cri.getSearchField()+" like '%" + cri.getSearchWord() + "%'\r\n";
		}
		// 컬럼명은 ?로 처리 안됌		
		System.out.println(where);
		
		try {
			String sql = "select * \r\n"
					+ "from (\r\n"
					+ "       select rownum rnum, b.* \r\n"
					+ "       from (\r\n"
					+ "                select * from board\r\n"
					+				   where
					+ "                order by num desc) b\r\n"
					+ "        )\r\n"
					+ "where rnum between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cri.getStartNum());
			pstmt.setInt(2, cri.getEndNum());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("Title"));
				dto.setContent(rs.getString("Content"));
				dto.setId(rs.getString("Id"));
				dto.setPostdate(rs.getString("Postdate"));
				dto.setVisitcount(rs.getString("Visitcount"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("리스트 조회 실패");
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	/**
	 * 게시글의 총 건수를 조회 후반환
	 *  - 집계함수 이용
	 * @return 게시글의 총 건수
	 */
	public int getTotalCnt(Criteria cri) {
		int res = 0;
		String where="";
		
		if(!"".equals(cri.getSearchField())
				&& !"".equals(cri.getSearchWord())) {
			where = "where " + cri.getSearchField() 
							+ " like '%" + cri.getSearchWord() + "%'";
		}
		String sql = "select count(*) from board " + where;
		System.out.println("sql : " + sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("getTotalCnt 수행중 예외 발생");
			e.printStackTrace();
		}
		
		return res;
	}
	
	
}
