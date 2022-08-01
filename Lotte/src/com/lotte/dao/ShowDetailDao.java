package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.lotte.dto.ShowDto;

public class ShowDetailDao {
	public ShowDto showTime(String name, String time) {
		ShowDto dto = new ShowDto();
		Connection conn = DBC.getConnection();
		
		String sql = "select * from performance where name=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setExplain(rs.getString("explain"));
				dto.setTag(rs.getString("tag"));
				dto.setPeriod(rs.getString("period"));
				if(time.equals("no")) {
					dto.setTime(rs.getString("notime"));
				}else {
					dto.setTime(rs.getString("time"));
				}
				dto.setLeadtime(rs.getString("leadtime"));
				dto.setLocation(rs.getString("location"));
				dto.setSurely(rs.getString("surely"));
				dto.setImage(rs.getString("image"));
				dto.setCharacteristic(rs.getString("characteristic"));
				dto.setLocation_image(rs.getString("location_image"));
				dto.setTop(rs.getInt("top"));
				dto.setLeft(rs.getInt("left"));
				dto.setHere(rs.getString("here"));
				dto.setZoomTop(rs.getDouble("zoom_top"));
				dto.setZoomLeft(rs.getDouble("zoom_left"));
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}//showTime(p2)
}
