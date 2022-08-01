package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.lotte.dto.MainDto;
import com.lotte.dto.ShowDto;

public class MainDao {
	public ArrayList<ShowDto> selectAll() {
		Connection conn = DBC.getConnection();
		ShowDto dto = null;
		ArrayList<ShowDto> list = new ArrayList<ShowDto>();
		
		String sql = "select * from performance";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new ShowDto();
				
				dto.setName(rs.getString("name"));
				dto.setExplain(rs.getString("explain"));
				dto.setTime(rs.getString("notime"));
				dto.setMain(rs.getString("main"));
				
				list.add(dto);
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll()
	
	public ArrayList<MainDto> mainAttraction() {
		Connection conn = DBC.getConnection();
		MainDto dto = null;
		ArrayList<MainDto> list = new ArrayList<MainDto>();
		
		String sql = "select * from main_attraction";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new MainDto();
				
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setImage(rs.getString("image"));
				
				list.add(dto);
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//mainAttraction()
	
	public ArrayList<ShowDto> mainShow(String day) {
		Connection conn = DBC.getConnection();
		ArrayList<ShowDto> listAll = selectAll();
		
		String sql = "select * from performance p, schedule s where s.name = p.name and s." + day + " = 'y'";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				for(int i = 0; i < listAll.size(); i++) {
					if(listAll.get(i).getName().equals(rs.getString("name"))) {
						listAll.get(i).setTime(rs.getString("time"));
					}
				}//for
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return listAll;
	}//mainShow(p1)
}
