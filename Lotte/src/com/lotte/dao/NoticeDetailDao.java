package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.lotte.dto.NoticeDto;

public class NoticeDetailDao {
	
	public ArrayList<NoticeDto> getNoticeListDetail(int num) throws Exception{
		ArrayList<NoticeDto> listboard = new ArrayList<NoticeDto>();
		Connection conn = DBC.getConnection();
		String sql = "select * from notice where bno =?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,num);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			int bno = rs.getInt("bno");
			String category = rs.getString("category");
			String title = rs.getString("title");
			String registrationdate = rs.getString("registrationdate");
			NoticeDto dto = new NoticeDto(bno,category,title,registrationdate);
			listboard.add(dto);
		}
		pstmt.close();
		rs.close();
		return listboard;
	}
}
