package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.lotte.dto.LotteMemberDto;

public class LoginDao {
	public String LoginDao(String email) throws Exception{
		String name = null;
		Connection conn = DBC.getConnection();
		String sql = "select name from member WHERE email=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,email);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			 name = rs.getString("name");
		}
		pstmt.close();
		rs.close();
		return name;
	}
}
