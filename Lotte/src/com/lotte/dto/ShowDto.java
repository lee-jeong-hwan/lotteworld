package com.lotte.dto;

public class ShowDto {
	private String name, explain, period, time, notime, leadtime, location, surely, main_image, characteristic,
	location_image, here, main;
	private int top, left;
	private String[] timeArr, tag, image;
	private double zoomTop, zoomLeft;
	
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}
	public double getZoomTop() {
		return zoomTop;
	}
	public void setZoomTop(double zoomTop) {
		this.zoomTop = zoomTop;
	}
	public double getZoomLeft() {
		return zoomLeft;
	}
	public void setZoomLeft(double zoomLeft) {
		this.zoomLeft = zoomLeft;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String[] getTag() {
		return tag;
	}
	public void setTag(String tag) {
		if(tag!=null) {
			this.tag = tag.split(",");
		}
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
		this.timeArr = time.split("<br/>");
	}
	public String getNotime() {
		return notime;
	}
	public void setNotime(String notime) {
		this.notime = notime;
	}
	public String getLeadtime() {
		return leadtime;
	}
	public void setLeadtime(String leadtime) {
		this.leadtime = leadtime;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSurely() {
		return surely;
	}
	public void setSurely(String surely) {
		this.surely = surely;
	}
	public String getMain_image() {
		return main_image;
	}
	public void setMain_image(String main_image) {
		this.main_image = main_image;
	}
	public String[] getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image.split(",<br/>");
	}
	public String getCharacteristic() {
		return characteristic;
	}
	public void setCharacteristic(String characteristic) {
		this.characteristic = characteristic;
	}
	public String getLocation_image() {
		return location_image;
	}
	public void setLocation_image(String location_image) {
		this.location_image = location_image;
	}
	public String getHere() {
		return here;
	}
	public void setHere(String here) {
		this.here = here;
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
	public String[] getTimeArr() {
		return timeArr;
	}
	
}
