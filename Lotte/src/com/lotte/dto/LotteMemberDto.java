package com.lotte.dto;

public class LotteMemberDto {
	private String name;
	private String email;
	private String pw;
	private String news;
	private String phone;
	private String birth;

	public LotteMemberDto() {}
	public LotteMemberDto(String name, String email, String pw, String news, String phone, String birth) {
		this.name = name;
		this.email = email;
		this.pw = pw;
		this.news = news;
		this.phone = phone;
		this.birth = birth;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNews() {
		return news;
	}
	public void setNews(String news) {
		this.news = news;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
}
