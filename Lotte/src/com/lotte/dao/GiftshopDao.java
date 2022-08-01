package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lotte.dto.GiftshopDto;

public class GiftshopDao {
	public static GiftshopDto giftshopDetail(String urlname) throws SQLException {
		Connection conn = DBC.getConnection();
		
		String sql = "SELECT * FROM giftshop where name = '" + urlname + "'";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		GiftshopDto dto = null;
		
		while(rs.next()) {
			dto = new GiftshopDto();
			dto.setName(rs.getString("name"));
			dto.setContents(rs.getString("contents"));
			dto.setTag(rs.getString("tag"));
			dto.setMaingift(rs.getString("maingift"));
			dto.setPhone(rs.getString("phone"));
			dto.setGuide(rs.getString("guide"));
			dto.setLocationimage(rs.getString("locationimage"));
			dto.setLocation(rs.getString("location"));
			dto.setImage(rs.getString("image"));
			dto.setImage2(rs.getString("image2"));
			dto.setLocation_id(rs.getString("location_id"));
			dto.setTop(rs.getInt("top"));
			dto.setLeft(rs.getInt("left"));
			dto.setZoomplusleft(rs.getString("zoomplusleft"));
			dto.setZoomplustop(rs.getString("zoomplustop"));
		}
		return dto;
	}
	public static ArrayList<GiftshopDto> giftshopMain() throws SQLException {
		Connection conn = DBC.getConnection();
		
		String sql = "SELECT * FROM giftshop ORDER BY name DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<GiftshopDto> list = new ArrayList<GiftshopDto>();
		GiftshopDto dto;
		while(rs.next()) {
			dto = new GiftshopDto();
			
			dto.setName(rs.getString("name"));
			dto.setLocation(rs.getString("location"));
			dto.setImage2(rs.getString("image2"));
			
			list.add(dto);
		}
		return list;
	}
	public static Integer giftshopCnt() throws SQLException {
		Connection conn = DBC.getConnection();
		
		String sql = "SELECT count(*) FROM giftshop";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int cnt = 0;
		while(rs.next()) {
			cnt = rs.getInt(1);
		}
		return cnt;
	}
	public static ArrayList<GiftshopDto> searchGiftshop(String location) throws SQLException {
		Connection conn = DBC.getConnection();
		
		PreparedStatement pstmt;
		if(location.equals("전체")) {
			String sql = "SELECT * FROM giftshop";
			pstmt = conn.prepareStatement(sql);
		} else {
			String sql = "SELECT * FROM giftshop where location = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, location);
			
		}
		
		ArrayList<GiftshopDto> list = new ArrayList<GiftshopDto>();
		GiftshopDto dto = null;
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			dto = new GiftshopDto();
			dto.setName(rs.getString("name"));
			dto.setLocation(rs.getString("location"));
			dto.setImage2(rs.getString("image2"));
			list.add(dto);
		}
		return list;
	}
	public static ArrayList<GiftshopDto> GiftshopMain() throws SQLException{
		Connection conn = DBC.getConnection();
		
		String sql = "SELECT * FROM giftshop";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<GiftshopDto> list = new ArrayList<GiftshopDto>();
		GiftshopDto dto = null;
		while(rs.next()) {
			dto = new GiftshopDto();
			dto.setName(rs.getString("name"));
			dto.setLocation(rs.getString("location"));
			dto.setImage2(rs.getString("image2"));
			list.add(dto);
		}
		return list;
	}
}
