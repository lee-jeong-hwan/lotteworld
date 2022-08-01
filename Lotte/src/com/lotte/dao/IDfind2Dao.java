package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.lotte.dto.MemberDto;

public class IDfind2Dao {

	public ArrayList<MemberDto> getAllBoardList(String email) throws Exception{

		Connection conn = DBC.getConnection();
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		String sql = "Select * from member where email = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			email = rs.getString("email");
			MemberDto dto = new MemberDto(email);
			list.add(dto);
		}
		pstmt.close();
		rs.close();
		return list;
	}
}
