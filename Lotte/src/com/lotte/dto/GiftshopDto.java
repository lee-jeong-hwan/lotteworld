package com.lotte.dto;

public class GiftshopDto {
	private String name, contents, tag, maingift, phone, guide, locationimage, location, image, image2, location_id, zoomplusleft, zoomplustop;
	private int top, left;
	
	private String[] tagArr = null;
	private String[] imageArr= null;
	
	public GiftshopDto() { }
	public GiftshopDto(String name, String contents, String tag, String maingift, String phone, String guide,
			String locationimage, String location, String image, String image2, String location_id, String zoomplusleft, String zoomplustop, int top, int left) {
		super();
		this.name = name;
		this.contents = contents;
		this.tag = tag;
		this.maingift = maingift;
		this.phone = phone;
		this.guide = guide;
		this.locationimage = locationimage;
		this.location = location;
		this.image = image;
		this.image2 = image2;
		this.location_id = location_id;
		this.top = top;
		this.left = left;
		this.zoomplusleft = zoomplusleft;
		this.zoomplustop = zoomplustop;
	}
	
	
	public String[] getTagArr() {
		return tagArr;
	}
	public String[] getImageArr() {
		return imageArr;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String content) {
		this.contents = content;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
		if(tag != null)
		this.tagArr = tag.split(",");
	}
	public String getMaingift() {
		return maingift;
	}
	public void setMaingift(String maingift) {
		this.maingift = maingift;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGuide() {
		return guide;
	}
	public void setGuide(String guide) {
		this.guide = guide;
	}
	public String getLocationimage() {
		return locationimage;
	}
	public void setLocationimage(String locationimage) {
		this.locationimage = locationimage;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
		if(image != null)
		this.imageArr = image.split(",<br/>");
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getLocation_id() {
		return location_id;
	}
	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}
	public int getLeft() {
		return left;
	}
	public void setLeft(int left) {
		this.left = left;
	}
	public String getZoomplusleft() {
		return zoomplusleft;
	}
	public void setZoomplusleft(String zoomplusleft) {
		this.zoomplusleft = zoomplusleft;
	}
	public String getZoomplustop() {
		return zoomplustop;
	}
	public void setZoomplustop(String zoomplustop) {
		this.zoomplustop = zoomplustop;
	}
	
	
	
}
