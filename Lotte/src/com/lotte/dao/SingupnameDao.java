package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.lotte.dto.LotteMemberDto;

public class SingupnameDao {

	public ArrayList<LotteMemberDto> singup(String name) throws Exception{

		Connection conn = DBC.getConnection();
		ArrayList<LotteMemberDto> list = new ArrayList<LotteMemberDto>();
		String sql = "Select * from member where name = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			name = rs.getString("email");
			LotteMemberDto dto = new LotteMemberDto(name ,null ,null ,null ,null ,null);
			list.add(dto);
		}
		pstmt.close();
		rs.close();
		return list;
	}
}
