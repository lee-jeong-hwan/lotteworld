package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import com.lotte.dto.Attraction_dto;
import com.lotte.dto.GiftshopDto;
import com.lotte.dto.RestaurantDto;
import com.lotte.dto.ShowDto;

public class SearchDao {
	public static ArrayList<RestaurantDto> searchRestaurant(String name) throws SQLException {
		Connection conn = DBC.getConnection();
		ArrayList<RestaurantDto> list = new ArrayList<RestaurantDto>();
		
		String sql = "select * from restaurant";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		RestaurantDto dto = null;
		while(rs.next()) {
			if(rs.getString("name").contains(name) ||
					(rs.getString("tags")!=null && rs.getString("tags").contains(name))) {
				dto = new RestaurantDto();
				
				dto.setName(rs.getString("name"));
				dto.setLocation(rs.getString("location"));
				dto.setMainurl(rs.getString("mainurl"));
				dto.setTags(rs.getString("tags"));
				
				list.add(dto);
			}
		}
		
		if(list.size()>0) {
			return list;
		}
		return null;
	}
	public static ArrayList<GiftshopDto> searchGiftshop(String name) throws SQLException {
		Connection conn = DBC.getConnection();
		
		ArrayList<GiftshopDto> list = new ArrayList<GiftshopDto>();
		ArrayList<GiftshopDto> list1 = new ArrayList<GiftshopDto>();
		String sql = "SELECT * FROM giftshop";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		GiftshopDto dto = null;
		while(rs.next()) {
			if(rs.getString("name").contains(name) || 
					(rs.getString("tag")!=null && rs.getString("tag").contains(name))) {
				dto = new GiftshopDto();
				
				dto.setName(rs.getString("name"));
				dto.setLocation(rs.getString("location"));
				dto.setImage2(rs.getString("image2"));
				dto.setTag(rs.getString("tag"));
				
				list.add(dto);
			}
		}
		
		if(list.size() > 0) {
			return list;
		}
		return null;
	}
	public static ArrayList<Attraction_dto> searchAttraction(String name) throws SQLException {
		Connection conn = DBC.getConnection();
		ArrayList<Attraction_dto> list = new ArrayList<Attraction_dto>();
		String sql = "SELECT * FROM attraction";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		Attraction_dto dto = null;
		while(rs.next()) {
			if(rs.getString("name").contains(name) ||  
					(rs.getString("tags") != null && rs.getString("tags").contains(name))) {
				dto = new Attraction_dto();
				
				dto.setName(rs.getString("name"));
				dto.setSearch(rs.getString("search"));
				dto.setPictureurl(rs.getString("pictureurl"));
				
				list.add(dto);
			}
		}
		if(list.size() > 0) {
			return list;
		}
		return null;
	}
	public static ArrayList<ShowDto> searchShow(String name) throws SQLException {
		Connection conn = DBC.getConnection();
		ArrayList<ShowDto> list = new ArrayList<ShowDto>();
		
		String sql = "select * from performance";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		ShowDto dto = null;
		while(rs.next()) {
			if(rs.getString("name").contains(name) ||
					(rs.getString("tag")!=null && rs.getString("tag").contains(name))) {
				dto = new ShowDto();
				
				dto.setName(rs.getString("name"));
				dto.setLocation(rs.getString("location"));
				dto.setMain(rs.getString("main"));
				dto.setTag(rs.getString("tag"));
				dto.setTime(rs.getString("time"));
				
				list.add(dto);
			}
		}
		
		if(list.size()>0) {
			return list;
		}
		return null;
	}
	public static ArrayList<ShowDto> finalSearchShow(String name) throws SQLException {
		Connection conn = DBC.getConnection();
		ArrayList<ShowDto> list = searchShow(name);
		
		Calendar cal = Calendar.getInstance();
		int dayOfTheWeek = cal.get(Calendar.DAY_OF_WEEK);
		String day = null;
		switch(dayOfTheWeek) {
		case 1:
			day = "su";
			break;
		case 2:
		case 3:
		case 4:
			day = "mtw";
			break;
		case 5:
		case 6:
			day = "tf";
			break;
		case 7:
			day = "sa";
			break;
		}//switch
		
		String sql = "select * from performance p, schedule s where p.name = s.name and s." + day + "='n'";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
			if(rs.getString("name").contains(name) ||
					(rs.getString("tag")!=null && rs.getString("tag").contains(name))) {
				for(int i = 0; i < list.size(); i++) {
					if(rs.getString("name").equals(list.get(i).getName())) {
						list.get(i).setTime(rs.getString("notime"));
					}
				}//for
			}
		}
		
		if(list!=null && list.size()>0) {
			return list;
		}
		return null;
	}
}
