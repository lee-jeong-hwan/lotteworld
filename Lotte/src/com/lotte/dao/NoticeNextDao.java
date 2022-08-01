package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.lotte.dto.NoticeTitleDto;


public class NoticeNextDao {
	public ArrayList<NoticeTitleDto> getNoticeListNext(int next) throws Exception{
		ArrayList<NoticeTitleDto> listboard = new ArrayList<NoticeTitleDto>();
		Connection conn = DBC.getConnection();
		String sql = "select * from notice where bno =(?+1)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,next);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			int bno = rs.getInt("bno");
			String title = rs.getString("title");
			NoticeTitleDto dto = new NoticeTitleDto(title,bno);
			listboard.add(dto);
		}
		pstmt.close();
		rs.close();
		return listboard;
	}
	
}
