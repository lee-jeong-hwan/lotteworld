package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.lotte.dto.ShowDto;

public class ShowDao {
	public ArrayList<ShowDto> all(){
		ShowDto dto = null;
		ArrayList<ShowDto> list = new ArrayList<ShowDto>();
		Connection conn = DBC.getConnection();
		
		String sql = "select * from performance";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new ShowDto();
				
				dto.setName(rs.getString("name"));
				dto.setExplain(rs.getString("explain"));
				dto.setTime(rs.getString("notime"));
				dto.setLocation(rs.getString("location"));
				dto.setCharacteristic(rs.getString("characteristic"));
				dto.setMain_image(rs.getString("main_image"));
				
				list.add(dto);
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//all()
	
	public ArrayList<ShowDto> all(String chart){
		ShowDto dto = null;
		ArrayList<ShowDto> list = new ArrayList<ShowDto>();
		Connection conn = DBC.getConnection();
		
		String sql = "select * from performance where characteristic = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chart);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new ShowDto();
				
				dto.setName(rs.getString("name"));
				dto.setExplain(rs.getString("explain"));
				dto.setTime(rs.getString("notime"));
				dto.setLocation(rs.getString("location"));
				dto.setCharacteristic(rs.getString("characteristic"));
				dto.setMain_image(rs.getString("main_image"));
				
				list.add(dto);
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//all(p1)
	
	public ArrayList<ShowDto> doSelectAll(String day) {
		ShowDto dto = null;
		ArrayList<ShowDto> list = new ArrayList<ShowDto>();
		Connection conn = DBC.getConnection();
		
		String sql = "select s.name, t.time, p.location \r\n" + 
				"from performance p, schedule s, time t\r\n" + 
				"where p.name = s.name\r\n" + 
				"and p.name = t.name\r\n" + 
				"and s." + day + " = 'y'\r\n" + 
				"order by t.time asc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new ShowDto();
				
				dto.setName(rs.getString("name"));
				dto.setLocation(rs.getString("location"));
				dto.setTime(rs.getString("time"));
				
				list.add(dto);
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//doSelectAll(p1)
	
	public ArrayList<ShowDto> doSelectAll(String day, String chart) {
		ShowDto dto = null;
		ArrayList<ShowDto> list = new ArrayList<ShowDto>();
		Connection conn = DBC.getConnection();
		
		String sql = "select s.name, t.time, p.location \r\n" + 
				"from performance p, schedule s, time t\r\n" + 
				"where p.name = s.name\r\n" + 
				"and p.name = t.name\r\n" + 
				"and s." + day + " = 'y'\r\n" +
				"and p.characteristic = ?\r\n" +
				"order by t.time asc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chart);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new ShowDto();
				
				dto.setName(rs.getString("name"));
				dto.setLocation(rs.getString("location"));
				dto.setTime(rs.getString("time"));
				
				list.add(dto);
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//doSelectAll(p2)
	
	public ArrayList<ShowDto> selectAll(String day) {
		ArrayList<ShowDto> allList = all();
		Connection conn = DBC.getConnection();
		
		String sql = "select p.*\r\n"
				+ "from schedule s, performance p\r\n"
				+ "where s.name = p.name\r\n"
				+ "and s." + day + " = 'y'";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {				
				for(int i = 0; i < allList.size(); i++) {
					if(allList.get(i).getName().equals(rs.getString("name"))) {
						allList.get(i).setTime(rs.getString("time"));
					}
				}//for
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return allList;
	}//selectAll(p1)
	
	public ArrayList<ShowDto> selectAll(String day, String chart) {
		ArrayList<ShowDto> allList = all(chart);
		Connection conn = DBC.getConnection();
		
		String sql = "select p.*\r\n"
				+ "from schedule s, performance p\r\n"
				+ "where s.name = p.name\r\n"
				+ "and s." + day + " = 'y'\r\n"
				+ "and p.characteristic = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chart);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {				
				for(int i = 0; i < allList.size(); i++) {
					if(allList.get(i).getName().equals(rs.getString("name"))) {
						allList.get(i).setTime(rs.getString("time"));
					}
				}//for
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return allList;
	}//selectAll(p2)
}
