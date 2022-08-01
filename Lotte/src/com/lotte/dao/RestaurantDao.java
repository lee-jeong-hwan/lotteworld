package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lotte.dto.RestaurantDto;

public class RestaurantDao {
	public RestaurantDto restaurantDetail(String urlname) throws SQLException {
		Connection conn = DBC.getConnection();
		String sql = "select * from restaurant where name = '" + urlname + "'";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		RestaurantDto Dto = null;
		
		while(rs.next()) {
			Dto = new RestaurantDto();
			Dto.setName(rs.getString("name"));
			Dto.setMapurl(rs.getString("mapurl"));
			Dto.setLeft(rs.getInt("left"));
			Dto.setTop(rs.getInt("top"));
			Dto.setAroundrestaurant(rs.getString("aroundrestaurant"));
			Dto.setAroundgift(rs.getString("aroundgift"));
			Dto.setAroundattrac(rs.getString("aroundattrac"));
			Dto.setTags(rs.getString("tags"));
			Dto.setDetaillocation(rs.getString("detaillocation"));
			Dto.setLocation(rs.getString("location"));
			Dto.setMainurl(rs.getString("mainurl"));
			Dto.setImagine(rs.getString("imagine"));
			Dto.setCategory(rs.getString("category"));
			Dto.setGroupmeal(rs.getString("groupmeal"));
			Dto.setExplain(rs.getString("explain"));
			Dto.setMenu(rs.getString("menu"));
			Dto.setTime(rs.getString("time"));
			Dto.setPhonenumber(rs.getString("phonenumber"));
			Dto.setGuide(rs.getString("guide"));
			Dto.setHere(rs.getString("here"));
			Dto.setAroundattracimg(rs.getString("aroundattracimg"));
			Dto.setAroundattraclocation(rs.getString("aroundattraclocation"));
			Dto.setAroundrestaurantimg(rs.getString("aroundrestaurantimg"));
			Dto.setAroundrestaurantlocation(rs.getString("aroundrestaurantlocation"));
			Dto.setAroundgiftshopimg(rs.getString("aroundgiftshopimg"));
			Dto.setAroundgiftshoplocation(rs.getString("aroundgiftshoplocation"));
			Dto.setZoomplus(rs.getNString("zoomplus"));
			Dto.setZoomminus(rs.getString("zoomminus"));
			
		}
		return Dto;
	}
	
	public static ArrayList<RestaurantDto> restaurantMain() throws SQLException {
		Connection conn = DBC.getConnection();
		
		String sql = "SELECT * FROM restaurant ORDER BY name desc";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<RestaurantDto> list = new ArrayList<RestaurantDto>();
		
		RestaurantDto dto = null;
		while(rs.next()) {
			dto = new RestaurantDto();
			dto.setName(rs.getString("name"));
			dto.setLocation(rs.getString("location"));
			dto.setMenu(rs.getString("menu"));
			dto.setMainurl(rs.getString("mainurl"));
			dto.setGroupmeal(rs.getString("groupmeal"));
			list.add(dto);
		}
		return list;
	}
	public ArrayList<RestaurantDto> restaurantSearch(String location, String menu, String groupmeal) throws SQLException {
		Connection conn = DBC.getConnection();
		PreparedStatement pstmt = null;
		if(groupmeal.equals("O")) {
			if(location.equals("전체") && menu.equals("전체")) {
				String sql = "SELECT * FROM restaurant WHERE groupmeal = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, groupmeal);
			} else if (location.equals("전체")) {
				String sql = "SELECT * FROM restaurant WHERE category = ? AND groupmeal = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, menu);
				pstmt.setString(2, groupmeal);
			} else if (menu.equals("전체")) {
				String sql = "SELECT * FROM restaurant WHERE location = ? AND groupmeal = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, location);
				pstmt.setString(2, groupmeal);
			} else {
				String sql = "SELECT * FROM restaurant WHERE location = ? AND category = ? and groupmeal = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, location);
				pstmt.setString(2, menu);
				pstmt.setString(3, groupmeal);
			}
		} else {
			if(location.equals("전체") && menu.equals("전체")) {
				String sql = "SELECT * FROM restaurant";
				pstmt = conn.prepareStatement(sql);
			} else if (location.equals("전체")) {
				String sql = "SELECT * FROM restaurant WHERE category = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, menu);
			} else if (menu.equals("전체")) {
				String sql = "SELECT * FROM restaurant WHERE location = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, location);
			} else {
				String sql = "SELECT * FROM restaurant WHERE location = ? AND category = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, location);
				pstmt.setString(2, menu);
			}
		}
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
		return list;
		
	}
	public static Integer restaurantCnt() throws SQLException {
		Connection conn = DBC.getConnection();
		
		String sql = "SELECT count(*) FROM restaurant";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		int cnt = 0;
		while(rs.next()) {
			cnt = rs.getInt(1);
		}
		
		return cnt;
	}
	public static ArrayList<RestaurantDto> RestaurantMain() throws SQLException {
		Connection conn = DBC.getConnection();
	
		String sql = "SELECT * FROM restaurant";
		
		ArrayList<RestaurantDto> list = new ArrayList<RestaurantDto>();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		RestaurantDto dto = null;
		while(rs.next()) {
			dto = new RestaurantDto();
			
			dto.setName(rs.getString("name"));
			dto.setLocation(rs.getString("location"));
			dto.setMainurl(rs.getString("mainurl"));
			list.add(dto);
		}
		return list;
	}
}
