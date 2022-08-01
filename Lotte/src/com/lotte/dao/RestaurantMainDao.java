package com.lotte.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lotte.dto.RestaurantDto;

public class RestaurantMainDao {
	public static RestaurantDto restaurantMain() throws SQLException {
		Connection conn = DBC.getConnection();
		
		String sql = "SELECT * FROM restaurant";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<RestaurantDto> list = new ArrayList<RestaurantDto>();
		
		RestaurantDto dto = null;
		while(rs.next()) {
			dto = new RestaurantDto();
			dto.setName(rs.getString("name"));
			dto.setLocation(rs.getString("location"));
			dto.setMainurl(rs.getString("mainurl"));
			list.add(dto);
		}
		return dto;
	}
}
