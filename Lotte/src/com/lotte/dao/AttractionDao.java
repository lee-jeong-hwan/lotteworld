package com.lotte.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import com.lotte.dto.Attraction_dto;
import com.lotte.dao.*;

public class AttractionDao {
	public Attraction_dto attractionDetail(String aname) throws ClassNotFoundException, SQLException {
		Connection conn = DBC.getConnection();
		
		String sql = "select * from attraction where name ='" + aname + "'";

		PreparedStatement pstmt = conn.prepareStatement(sql); // 터미널
		ResultSet rs = pstmt.executeQuery(); // 값 받는 역할 
		  
		  Attraction_dto dto = null;
		 while(rs.next()) {
			 dto = new Attraction_dto();
			 
			  dto.setName(rs.getString("name"));
			  dto.setExplanation(rs.getString("explanation"));
			  dto.setTags(rs.getString("tags")) ;
			  dto.setPlease(rs.getString("please"));
			  dto.setHoliday(rs.getString("holiday"));
			  dto.setHoliday2(rs.getString("holiday2"));
			  dto.setPerson(rs.getString("person"));
			  dto.setInformation(rs.getString("information"));
			  dto.setRestrict(rs.getString("restrict"));
			  dto.setLocation(rs.getString("location"));
			  dto.setHeretop(rs.getInt("heretop"));
			  dto.setHereleft(rs.getInt("hereleft"));
			  dto.setImage(rs.getString("image"));
			  dto.setAroundattraction(rs.getString("aroundattraction"));
			  dto.setMoney(rs.getString("money"));
			  dto.setMapurl(rs.getString("mapurl"));
			  dto.setHere(rs.getString("here"));
			  dto.setMax_top(rs.getInt("max_top"));
			  dto.setMax_left(rs.getInt("max_left"));
		
			   
	}
		 return dto;
}
	public static ArrayList<Attraction_dto> attractionMain() throws SQLException {
		Connection conn = DBC.getConnection();
		
		String sql = "SELECT * FROM attraction";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<Attraction_dto> list1 = new ArrayList<Attraction_dto>();
		Attraction_dto dto = null;
		
		while(rs.next()) {
			dto = new Attraction_dto();
			 
			dto.setName(rs.getString("name"));
			dto.setSearch(rs.getString("search"));
			dto.setPictureurl(rs.getString("pictureurl"));
			list1.add(dto);
		}
		return list1;
	}
	public ArrayList<Attraction_dto> Attraction_main_dao() throws SQLException, ClassNotFoundException {
		 Connection conn = DBC.getConnection();
		 
		 String sql = "select * from attraction";
		 
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 ResultSet rs = pstmt.executeQuery();
		 
		 Attraction_dto dto = null;
		 ArrayList<Attraction_dto> list = new ArrayList<Attraction_dto>();
		 while(rs.next()) {
			 dto = new Attraction_dto();
			 
			 dto.setName(rs.getString("name"));
			 dto.setSearch(rs.getString("search"));
			 dto.setPictureurl(rs.getString("pictureurl"));
			 list.add(dto);
		 }
		 
		return list;
	}

	
// 조건검색 구현 --------------------------------------------------------------------------------------------------------------------------------------------
	// loc에 '전체'는 "*"을 넣어줘야 함.
	public static ArrayList<Attraction_dto> attractionSearch(String location, String age, int tall, String parent) throws SQLException, ClassNotFoundException {
		Connection conn = DBC.getConnection();
		ArrayList<Attraction_dto> list = new ArrayList<Attraction_dto>();
		ArrayList<Attraction_dto> list1 = new ArrayList<Attraction_dto>();
		ArrayList<Attraction_dto> list2 = new ArrayList<Attraction_dto>();
		ArrayList<Attraction_dto> list3 = new ArrayList<Attraction_dto>();
		ArrayList<Attraction_dto> list4 = new ArrayList<Attraction_dto>();
		
		String sql = "SELECT * FROM attraction";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		Attraction_dto dto = null;
		while(rs.next()) {
			dto = new Attraction_dto();
			
			dto.setName(rs.getString("name"));
			dto.setSearch(rs.getString("search"));
			dto.setPictureurl(rs.getString("pictureurl"));
			dto.setAge(rs.getString("age"));
			dto.setGuardioan(rs.getString("guardioan"));
			dto.setL_max(rs.getInt("l_max"));
			dto.setL_min(rs.getInt("l_min"));
			dto.setP_max(rs.getInt("p_max"));
			dto.setP_min(rs.getInt("p_min"));
			
			list.add(dto);
		}
		// 위치 조건검색
		if(location.equals("전체")) {
			list1.addAll(list);
		} else {
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).getSearch().equals(location)) {
					dto = new Attraction_dto();
					
					dto.setName(list.get(i).getName());
					dto.setSearch(list.get(i).getSearch());
					dto.setPictureurl(list.get(i).getPictureurl());
					dto.setAge(list.get(i).getAge());
					dto.setGuardioan(list.get(i).getGuardioan());
					dto.setL_max(list.get(i).getL_max());
					dto.setL_min(list.get(i).getL_min());
					dto.setP_max(list.get(i).getP_max());
					dto.setP_min(list.get(i).getP_min());
					
					list1.add(dto);
					
				} // if
			} // for
		}
		// 나이 조건검색
		if(age.equals("전체")) {
			list2.addAll(list1);
		}
		for(int i = 0; i < list1.size(); i++) {
			if(list1.get(i).getAge().contains(age)) {
				dto = new Attraction_dto();
				
				dto.setName(list1.get(i).getName());
				dto.setSearch(list1.get(i).getSearch());
				dto.setPictureurl(list1.get(i).getPictureurl());
				dto.setAge(list1.get(i).getAge());
				dto.setGuardioan(list1.get(i).getGuardioan());
				dto.setL_max(list1.get(i).getL_max());
				dto.setL_min(list1.get(i).getL_min());
				dto.setP_max(list1.get(i).getP_max());
				dto.setP_min(list1.get(i).getP_min());
				
				list2.add(dto);
			} // if
		} // for
		// 키 조건검색
		if(tall != 0) {
			for(int i = 0; i < list2.size(); i++) {
				if(parent.equals('y')) {
					if(((Integer)list2.get(i).getP_min() != null && list2.get(i).getP_min() < tall) && list2.get(i).getP_max() > tall) {
						dto = new Attraction_dto();
						
						dto.setName(list2.get(i).getName());
						dto.setSearch(list2.get(i).getSearch());
						dto.setPictureurl(list2.get(i).getPictureurl());
						dto.setAge(list2.get(i).getAge());
						dto.setGuardioan(list2.get(i).getGuardioan());
						dto.setL_max(list2.get(i).getL_max());
						dto.setL_min(list2.get(i).getL_min());
						dto.setP_max(list2.get(i).getP_max());
						dto.setP_min(list2.get(i).getP_min());
						
						list3.add(dto);
					}
				} else if(parent.equals("n")) {
					if(list2.get(i).getL_min() < tall && list2.get(i).getL_max() > tall) {
						dto = new Attraction_dto();
						
						dto.setName(list2.get(i).getName());
						dto.setSearch(list2.get(i).getSearch());
						dto.setPictureurl(list2.get(i).getPictureurl());
						dto.setAge(list2.get(i).getAge());
						dto.setGuardioan(list2.get(i).getGuardioan());
						dto.setL_max(list2.get(i).getL_max());
						dto.setL_min(list2.get(i).getL_min());
						dto.setP_max(list2.get(i).getP_max());
						dto.setP_min(list2.get(i).getP_min());
						
						list3.add(dto);
					} // if
				} // if
			} // for
		} else {
			list3.addAll(list2);
		}
		// 보호자 동반 조건검색
		if(parent.equals("y")) {
			for(int i = 0; i < list3.size(); i++) {
				if(list3.get(i).getGuardioan().equals(parent)) {
					dto = new Attraction_dto();
					
					dto.setName(list3.get(i).getName());
					dto.setSearch(list3.get(i).getSearch());
					dto.setPictureurl(list3.get(i).getPictureurl());
					
					list4.add(dto);
				} // if
			} // for
		} else {
			list4.addAll(list3);
		}
		return list4;
		
	}
	
	
	
	static String gar;
	static Scanner sc = new Scanner(System.in);
	static String location() {
		String a = "";
		System.out.println("-------------위치-----------------");
		System.out.println("0. 전체");
		System.out.println("1. 어드벤처 1층");
		System.out.println("2. 어드벤처 2층");
		System.out.println("3. 어드벤처 3층");
		System.out.println("4. 어드벤처 4층");
		System.out.println("5. 매직아일랜드");
		System.out.println("6. 언더랜드 B1층");
		System.out.println("7. 키디존");
		System.out.println("8. 파크 외 1층");
		System.out.println("9. 파크 외 B3층");
		
		int userLocation = sc.nextInt();
		gar = sc.nextLine();
		switch(userLocation) {
		case 0:
			a = "*";
			break;
		case 1:
			a = "어드벤처 1층";
			break;
		case 2:
			a = "어드벤처 2층";
			break;
		case 3:
			a = "어드벤처 3층";
			break;
		case 4:
			a = "어드벤처 4층";
			break;
		case 5:
			a = "매직아일랜드";
			break;
		case 6:
			a = "언더랜드 B1층";
			break;
		case 7:
			a = "키디존";
			break;
		case 8:
			a = "파크 외 1층";
			break;
		case 9:
			a = "파크 외 B3층";
			break;
		}//switch
		
		return a;
	}
	
	static String age() {
		String a = "";
		System.out.println("-------------나이-----------------");
		System.out.println("0. 전체");
		System.out.println("1. 0~4세");
		System.out.println("2. 5~64세");
		System.out.println("3. 65세 이상");
		
		int userAge = sc.nextInt();
		gar = sc.nextLine();
		switch(userAge) {
		case 0:
			a = "*";
			break;
		case 1:
			a = "0~4세";
			break;
		case 2:
			a = "5~64세";
			break;
		case 3:
			a = "65세 이상";
			break;
		}//switch
		
		return a;
		
	}
	
	static int length() {
		System.out.println("-------------키-----------------");
		int len = sc.nextInt();
		String gar = sc.nextLine();
		return len;
		
	}
	static String guardioan() {
		System.out.println("-------------보호자 동반---------------");
		System.out.println("y , n");
		String guar = sc.nextLine();
		return guar;
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {

		
//		attraction();
		 
		  
	}

	
}
