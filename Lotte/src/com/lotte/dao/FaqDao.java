package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.lotte.dto.FaqDto;

public class FaqDao {
	public ArrayList<FaqDto> selectAll() {
		ArrayList<FaqDto> list = new ArrayList<FaqDto>();
		FaqDto dto = null;
		Connection conn = DBC.getConnection();
		
		String sql = "SELECT * FROM faq";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new FaqDto();
				
				dto.setBno(rs.getInt("bno"));
				dto.setCategory(rs.getString("category"));
				dto.setContents(rs.getString("contents"));
				dto.setDetail(rs.getString("detail"));
				
				list.add(dto);
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll()
	
	public ArrayList<FaqDto> selectAll(int pageNum) {
		ArrayList<FaqDto> list = new ArrayList<FaqDto>();
		FaqDto dto = null;
		Connection conn = DBC.getConnection();
		
		int min = (pageNum-1)*10;
		int max = pageNum*10;
		
		String sql = "select s2.* from (select rownum rnum, s1.* from (select * from faq) s1) s2 where rnum>? and rnum<=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, min);
			pstmt.setInt(2, max);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new FaqDto();
				
				dto.setBno(rs.getInt("bno"));
				dto.setCategory(rs.getString("category"));
				dto.setContents(rs.getString("contents"));
				dto.setDetail(rs.getString("detail"));
				
				list.add(dto);
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll(p1)
	
	public ArrayList<FaqDto> selectAll(String search, String search2) {
		ArrayList<FaqDto> list = new ArrayList<FaqDto>();
		FaqDto dto = null;
		Connection conn = DBC.getConnection();
		
		String DBsearch = "%" + search + "%";
		
		String sql = "SELECT * FROM faq where contents like ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, DBsearch);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new FaqDto();
				
				dto.setBno(rs.getInt("bno"));
				dto.setCategory(rs.getString("category"));
				dto.setContents(rs.getString("contents"));
				dto.setDetail(rs.getString("detail"));
				
				list.add(dto);
			}//while
			if(search2 != null && list.size() == 0) {
				DBsearch = "%" + search2 + "%";
				sql = "SELECT * FROM faq WHERE contents LIKE ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, DBsearch);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					dto = new FaqDto();
					
					dto.setBno(rs.getInt("bno"));
					dto.setCategory(rs.getString("category"));
					dto.setContents(rs.getString("contents"));
					dto.setDetail(rs.getString("detail"));
					
					list.add(dto);
				}//while
			}else if(search2 != null) {
				DBsearch = "%" + search2 + "%";
				sql = "SELECT * FROM faq WHERE contents LIKE ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, DBsearch);
				rs = pstmt.executeQuery();
				boolean check = true;
				while(rs.next()) {
					for(int i = 0; i < list.size(); i++) {
						if(list.get(i).getContents().equals(rs.getString("contents"))) {
							check = false;
							break;
						}
					}//for
					if(check) {
						dto = new FaqDto();
						
						dto.setBno(rs.getInt("bno"));
						dto.setCategory(rs.getString("category"));
						dto.setContents(rs.getString("contents"));
						dto.setDetail(rs.getString("detail"));
						
						list.add(dto);
					}
				}//while
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll(p2)
	
	public ArrayList<FaqDto> selectAll(int pageNum, String search, String search2) {
		ArrayList<FaqDto> list = new ArrayList<FaqDto>();
		FaqDto dto = null;
		Connection conn = DBC.getConnection();
		
		String DBsearch = "%" + search + "%";
		int min = (pageNum-1)*10;
		int max = pageNum*10;
		
		String sql = "select s2.* from (select rownum rnum, s1.* from (select * from faq where contents like ?) s1) s2 where rnum>? and rnum<=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, DBsearch);
			pstmt.setInt(2, min);
			pstmt.setInt(3, max);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new FaqDto();
				
				dto.setBno(rs.getInt("bno"));
				dto.setCategory(rs.getString("category"));
				dto.setContents(rs.getString("contents"));
				dto.setDetail(rs.getString("detail"));
				
				list.add(dto);
			}//while
			if(search2 != null && list.size() == 0) {
				DBsearch = "%" + search2 + "%";
				sql = "select s2.* from (select rownum rnum, s1.* from (select * from faq where contents like ?) s1) s2 where rnum>? and rnum<=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, DBsearch);
				pstmt.setInt(2, min);
				pstmt.setInt(3, max);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					dto = new FaqDto();
					
					dto.setBno(rs.getInt("bno"));
					dto.setCategory(rs.getString("category"));
					dto.setContents(rs.getString("contents"));
					dto.setDetail(rs.getString("detail"));
					
					list.add(dto);
				}//while
			}else if(search2 != null) {
				DBsearch = "%" + search2 + "%";
				sql = "select s2.* from (select rownum rnum, s1.* from (select * from faq where contents like ?) s1) s2 where rnum>? and rnum<=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, DBsearch);
				pstmt.setInt(2, min);
				pstmt.setInt(3, max);
				rs = pstmt.executeQuery();
				boolean check = true;
				while(rs.next()) {
					for(int i = 0; i < list.size(); i++) {
						if(list.get(i).getContents().equals(rs.getString("contents"))) {
							check = false;
							break;
						}
					}//for
					if(check) {
						dto = new FaqDto();
						
						dto.setBno(rs.getInt("bno"));
						dto.setCategory(rs.getString("category"));
						dto.setContents(rs.getString("contents"));
						dto.setDetail(rs.getString("detail"));
						
						list.add(dto);
					}
				}//while
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll(p3)
	
	public ArrayList<FaqDto> select(String culrum) {
		ArrayList<FaqDto> list = new ArrayList<FaqDto>();
		FaqDto dto = null;
		Connection conn = DBC.getConnection();
		
		String sql = "SELECT * FROM faq WHERE category = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, culrum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new FaqDto();
				
				dto.setBno(rs.getInt("bno"));
				dto.setCategory(rs.getString("category"));
				dto.setContents(rs.getString("contents"));
				dto.setDetail(rs.getString("detail"));
				
				list.add(dto);
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//select(p1)
	
	public ArrayList<FaqDto> select(String culrum, String search, String search2) {
		ArrayList<FaqDto> list = new ArrayList<FaqDto>();
		FaqDto dto = null;
		Connection conn = DBC.getConnection();
		
		String DBsearch = "%" + search + "%";
		
		String sql = "SELECT * FROM faq WHERE category = ? and contents like ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, culrum);
			pstmt.setString(2, DBsearch);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new FaqDto();
				
				dto.setBno(rs.getInt("bno"));
				dto.setCategory(rs.getString("category"));
				dto.setContents(rs.getString("contents"));
				dto.setDetail(rs.getString("detail"));
				
				list.add(dto);
			}//while
			if(search2 != null && list.size() == 0) {
				DBsearch = "%" + search2 + "%";
				sql = "SELECT * FROM faq WHERE category = ? and contents like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, culrum);
				pstmt.setString(2, DBsearch);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					dto = new FaqDto();
					
					dto.setBno(rs.getInt("bno"));
					dto.setCategory(rs.getString("category"));
					dto.setContents(rs.getString("contents"));
					dto.setDetail(rs.getString("detail"));
					
					list.add(dto);
				}//while
			}else if(search2 != null) {
				DBsearch = "%" + search2 + "%";
				sql = "SELECT * FROM faq WHERE category = ? and contents like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, culrum);
				pstmt.setString(2, DBsearch);
				rs = pstmt.executeQuery();
				boolean check = true;
				while(rs.next()) {
					for(int i = 0; i < list.size(); i++) {
						if(list.get(i).getContents().equals(rs.getString("contents"))) {
							check = false;
							break;
						}
					}//for
					if(check) {
						dto = new FaqDto();
						
						dto.setBno(rs.getInt("bno"));
						dto.setCategory(rs.getString("category"));
						dto.setContents(rs.getString("contents"));
						dto.setDetail(rs.getString("detail"));
						
						list.add(dto);
					}
				}//while
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//select(p3)
	
	public ArrayList<FaqDto> select(String culrum, int pageNum) {
		ArrayList<FaqDto> list = new ArrayList<FaqDto>();
		FaqDto dto = null;
		Connection conn = DBC.getConnection();
		
		int min = (pageNum-1)*10;
		int max = pageNum*10;
		
		String sql = "select s2.* from (select rownum rnum, s1.* from (select * from faq where category = ?) s1) s2 where rnum>? and rnum<=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, culrum);
			pstmt.setInt(2, min);
			pstmt.setInt(3, max);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new FaqDto();
				
				dto.setBno(rs.getInt("bno"));
				dto.setCategory(rs.getString("category"));
				dto.setContents(rs.getString("contents"));
				dto.setDetail(rs.getString("detail"));
				
				list.add(dto);
			}//while
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//select(p2)
	
	public ArrayList<FaqDto> select(String culrum, int pageNum, String search, String search2) {
		ArrayList<FaqDto> list = new ArrayList<FaqDto>();
		FaqDto dto = null;
		Connection conn = DBC.getConnection();
		
		String DBsearch = "%" + search + "%";
		int min = (pageNum-1)*10;
		int max = pageNum*10;
		
		String sql = "select s2.* from (select rownum rnum, s1.* from (select * from faq where category = ? and contents like ?) s1) s2 where rnum>? and rnum<=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, culrum);
			pstmt.setString(2, DBsearch);
			pstmt.setInt(3, min);
			pstmt.setInt(4, max);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new FaqDto();
				
				dto.setBno(rs.getInt("bno"));
				dto.setCategory(rs.getString("category"));
				dto.setContents(rs.getString("contents"));
				dto.setDetail(rs.getString("detail"));
				
				list.add(dto);
			}//while
			if(search2 != null && list.size() == 0) {
				DBsearch = "%" + search2 + "%";
				sql = "select s2.* from (select rownum rnum, s1.* from (select * from faq where category = ? and contents like ?) s1) s2 where rnum>? and rnum<=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, culrum);
				pstmt.setString(2, DBsearch);
				pstmt.setInt(3, min);
				pstmt.setInt(4, max);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					dto = new FaqDto();
					
					dto.setBno(rs.getInt("bno"));
					dto.setCategory(rs.getString("category"));
					dto.setContents(rs.getString("contents"));
					dto.setDetail(rs.getString("detail"));
					
					list.add(dto);
				}//while
			}else if(search2 != null) {
				DBsearch = "%" + search2 + "%";
				sql = "select s2.* from (select rownum rnum, s1.* from (select * from faq where category = ? and contents like ?) s1) s2 where rnum>? and rnum<=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, culrum);
				pstmt.setString(2, DBsearch);
				pstmt.setInt(3, min);
				pstmt.setInt(4, max);
				rs = pstmt.executeQuery();
				boolean check = true;
				while(rs.next()) {
					for(int i = 0; i < list.size(); i++) {
						if(list.get(i).getContents().equals(rs.getString("contents"))) {
							check = false;
							break;
						}
					}//for
					if(check) {
						dto = new FaqDto();
						
						dto.setBno(rs.getInt("bno"));
						dto.setCategory(rs.getString("category"));
						dto.setContents(rs.getString("contents"));
						dto.setDetail(rs.getString("detail"));
						
						list.add(dto);
					}
				}//while
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//select(p4)
}
