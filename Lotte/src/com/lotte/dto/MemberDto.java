package com.lotte.dto;

public class MemberDto {
	private String email;

	public MemberDto() {}
	public MemberDto(String email) {
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
