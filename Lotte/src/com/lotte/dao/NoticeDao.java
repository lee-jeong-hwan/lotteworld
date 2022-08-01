package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.lotte.dto.NoticeDto;

public class NoticeDao {
		public ArrayList<NoticeDto> getNoticeListStartEnd(int startBno, int endBno) throws Exception{
			ArrayList<NoticeDto> listboard = new ArrayList<NoticeDto>();
			Connection conn = DBC.getConnection();
			String sql = "select *" 
					+" from (select rownum rnum ,b1.*" 
					+" from(select * from notice order by bno desc) b1) b2" 
					+" where rnum>=? and rnum<=?";	
			
				PreparedStatement ptmst = conn.prepareStatement(sql); 
				ptmst.setInt(1, startBno); // sql 물음표에 값 매핑
				ptmst.setInt(2, endBno);
				ResultSet rs = ptmst.executeQuery(); // sql 실행
				
				while(rs.next()) {
					int bno = rs.getInt("bno");
					String category = rs.getString("category");
					String title = rs.getString("title");
					String registrationdate = rs.getString("registrationdate");
					NoticeDto dto = new NoticeDto(bno,category,title,registrationdate);
					listboard.add(dto);
				}
				 
				ptmst.close();
				rs.close();
				return listboard;
			}
		
		public ArrayList<NoticeDto> getNoticeListStartEnd2(String Search , String sel ,int startBno , int endBno) throws Exception{
			
			ArrayList<NoticeDto> listboard2 = new ArrayList<NoticeDto>();
			Connection conn = DBC.getConnection();
			PreparedStatement ptmst =null;
			ResultSet rs = null;
			String sql;
			String notice ="공지";
			if(Search==null) {
				 sql = "select *" 
						+" from (select rownum rnum ,b1.*" 
						+" from(select * from notice where category like ? order by bno desc) b1) b2" 
						+" where rnum>=? and rnum<=?";
				 
					 	ptmst = conn.prepareStatement(sql); 
					 	
						ptmst.setString(1, '%'+notice+'%'); 
						ptmst.setInt(2, startBno); 
						ptmst.setInt(3, endBno);
						rs = ptmst.executeQuery(); 
						
						while(rs.next()) {
							int bno = rs.getInt("bno");
							String category = rs.getString("category");
							String title = rs.getString("title");
							String registrationdate = rs.getString("registrationdate");
							NoticeDto dto = new NoticeDto(bno,category,title,registrationdate);
							listboard2.add(dto);
						}
						ptmst.close();
						rs.close();
						
					
			}else {
				 sql = "select *" 
						+" from (select rownum rnum ,b1.*" 
						+" from(select * from notice where title like ? and  category like ? order by bno desc) b1) b2" 
						+" where rnum>=? and rnum<=?";	 
				 		
				 		ptmst = conn.prepareStatement(sql); 
				 		
						 if(sel.equals("전체")) {
							 ptmst.setString(1, '%'+Search+'%'); 
							 ptmst.setString(2, '%'+notice+'%');
							 ptmst.setInt(3, startBno);
							 ptmst.setInt(4, endBno);
							 rs = ptmst.executeQuery(); 
						 }else {
							 ptmst.setString(1, '%'+Search+'%'); 
							 ptmst.setString(2, '%'+sel+'%');
							 ptmst.setInt(3, startBno);
							 ptmst.setInt(4, endBno);
							 rs = ptmst.executeQuery(); 
						 }
							 while(rs.next()) {
									int bno = rs.getInt("bno");
									String category = rs.getString("category");
									String title = rs.getString("title");
									String registrationdate = rs.getString("registrationdate");
									NoticeDto dto = new NoticeDto(bno,category,title,registrationdate);
									listboard2.add(dto);
							 }
							 	ptmst.close();
								rs.close();
						 }
		 	
			return listboard2;
			}	
	
		}
