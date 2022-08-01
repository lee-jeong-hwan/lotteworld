package com.lotte.dto;

public class NoticeDto {
	private int bno;
	private String category;
	private String title;
	private String registrationdate;
	
	public NoticeDto() {}
	public NoticeDto(int bno, String category, String title, String registrationdate) {
		this.bno = bno;
		this.category = category;
		this.title = title;
		this.registrationdate = registrationdate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegistrationdate() {
		return registrationdate;
	}
	public void setRegistrationdate(String registrationdate) {
		this.registrationdate = registrationdate;
	}
}
