package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.FileDto;

public class FileDao extends DBConnPool{

	public int regFile(FileDto fileDto) {
		int res = 0;
		String sql = "insert into tbl_file(file_no, name, title, cate, ofile, sfile, postdate)\r\n"
				+ "values (seq_tbl_file_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fileDto.getName());
			pstmt.setString(2, fileDto.getTitle());
			pstmt.setString(3, fileDto.getCate());
			pstmt.setString(4, fileDto.getOfile());
			pstmt.setString(5, fileDto.getSfile());
			
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("DB에 파일 저장 실패");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public List<FileDto> getList(){
		List<FileDto> list = new ArrayList<>();
		String sql = "select * from tbl_file order by file_no desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int file_no = rs.getInt("file_no");
				String name = rs.getString("name");
				String title = rs.getString("title");
				String cate = rs.getString("cate");
				String ofile = rs.getString("ofile");
				String sfile = rs.getString("sfile");
				String postdate = rs.getString("postdate");
				
				FileDto dto = new FileDto(file_no, name, title, cate, ofile, sfile, postdate);
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			System.out.println("list 조회 실패");
			e.printStackTrace();
		}
		
		return list;
	}
	
	

}
