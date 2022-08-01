package com.lotte.dto;

public class NoticeTitleDto {
	private String title;
	private int bno;
	
	public NoticeTitleDto() {}
	public NoticeTitleDto(String title, int bno) {
		this.title = title;
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	
}
