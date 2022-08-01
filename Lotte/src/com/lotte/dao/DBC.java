package com.lotte.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBC {
	private static Connection conn = null;
	public static Connection getConnection() {
		if(conn!=null) {
			return conn;
		} else {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@192.168.1.14:1521:xe";
			String dbId = "lotte";
			String dbPw = "7!7!7!7!";
			
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, dbId, dbPw);
			} catch(Exception e) {
				e.printStackTrace();
			}
			return conn;
		}		
	}
}
