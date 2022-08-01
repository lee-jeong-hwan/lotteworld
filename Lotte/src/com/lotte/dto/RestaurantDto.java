package com.lotte.dto;

public class RestaurantDto {
	private String name, mapurl, aroundrestaurant, aroundgift, aroundattrac, tags, detaillocation, location, mainurl, imagine, category,
	groupmeal, explain, menu, time, phonenumber, guide, here,
	aroundattracimg, aroundattraclocation, aroundrestaurantimg, aroundrestaurantlocation, aroundgiftshopimg, aroundgiftshoplocation, zoomplus, zoomminus;
	private int left, top;
	
	private String[] arr = null;	
	private String[] aroundAN = null;
	private String[] aroundRN = null;
	private String[] aroundGN = null;
	private String[] imageArr = null;
	private String[] aroundAI = null;
	private String[] aroundAL = null;
	private String[] aroundRI = null;
	private String[] aroundRL = null;
	private String[] aroundGI = null;
	private String[] aroundGL = null;
	
	public RestaurantDto() { }

	public RestaurantDto(String name, String mapurl, String aroundrestaurant, String aroundgift, String aroundattrac,
			String tags, String detaillocation, String location, String mainurl, String imagine, String category,
			String groupmeal, String explain, String menu, String time, String phonenumber, String guide, String here,
			String aroundattracimg, String aroundattraclocation, String aroundrestaurantimg, String aroundrestaurantlocation,
			String aroundgiftshopimg, String aroundgiftshoplocation, String zoomplus, String zoomminus,
			int left, int top) {
		super();
		this.name = name;
		this.mapurl = mapurl;
		this.aroundrestaurant = aroundrestaurant;
		this.aroundgift = aroundgift;
		this.aroundattrac = aroundattrac;
		this.tags = tags;
		this.detaillocation = detaillocation;
		this.location = location;
		this.mainurl = mainurl;
		this.imagine = imagine;
		this.category = category;
		this.groupmeal = groupmeal;
		this.explain = explain;
		this.menu = menu;
		this.time = time;
		this.phonenumber = phonenumber;
		this.guide = guide;
		this.here = here;
		this.left = left;
		this.top = top;
		this.aroundattracimg = aroundattracimg;
		this.aroundattraclocation = aroundattraclocation;
		this.aroundrestaurantimg = aroundrestaurantimg;
		this.aroundrestaurantlocation = aroundrestaurantlocation;
		this.aroundgiftshopimg = aroundgiftshopimg;
		this.aroundgiftshoplocation = aroundgiftshoplocation;
		this.zoomplus = zoomplus;
		this.zoomminus = zoomminus;
	}
	public String[] getImageArr() {
		return imageArr;
	}
	public String[] getArr() {
		return arr;
	}
	public String[] getAroundAI() {
		return aroundAI;
	}
	public String[] getAroundAL() {
		return aroundAL;
	}
	public String[] getAroundRI() {
		return aroundRI;
	}
	public String[] getAroundRL() {
		return aroundRL;
	}
	public String[] getAroundGI() {
		return aroundGI;
	}
	public String[] getAroundGL() {
		return aroundGL;
	}
	public String[] getAroundAN() {
		return aroundAN;
	}
	public String[] getAroundRN() {
		return aroundRN;
	}
	public String[] getAroundGN() {
		return aroundGN;
	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMapurl() {
		return mapurl;
	}

	public void setMapurl(String mapurl) {
		this.mapurl = mapurl;
	}

	public String getAroundrestaurant() {
		return aroundrestaurant;
	}

	public void setAroundrestaurant(String aroundrestaurant) {
		this.aroundrestaurant = aroundrestaurant;
		if(aroundrestaurant != null)
		this.aroundRN = aroundrestaurant.split(",<br/>");
	}

	public String getAroundgift() {
		return aroundgift;
	}

	public void setAroundgift(String aroundgift) {
		this.aroundgift = aroundgift;
		if(aroundgift != null)
		this.aroundGN = aroundgift.split(",<br/>");
	}

	public String getAroundattrac() {
		return aroundattrac;
	}

	public void setAroundattrac(String aroundattrac) {
		this.aroundattrac = aroundattrac;
		if(aroundattrac != null)
		this.aroundAN = aroundattrac.split(",<br/>");
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
		if(tags!=null) {
			this.arr = tags.split(",");
		}
	}

	public String getDetaillocation() {
		return detaillocation;
	}

	public void setDetaillocation(String detaillocation) {
		this.detaillocation = detaillocation;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getMainurl() {
		return mainurl;
	}

	public void setMainurl(String mainurl) {
		this.mainurl = mainurl;
	}

	public String getImagine() {
		return imagine;
	}

	public void setImagine(String imagine) {
		this.imagine = imagine;
		this.imageArr = imagine.split(",<br/>");
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getGroupmeal() {
		return groupmeal;
	}

	public void setGroupmeal(String groupmeal) {
		this.groupmeal = groupmeal;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}

	public String getHere() {
		return here;
	}

	public void setHere(String here) {
		this.here = here;
	}

	public int getLeft() {
		return left;
	}

	public void setLeft(int left) {
		this.left = left;
	}

	public int getTop() {
		return top;
	}

	public void setTop(int top) {
		this.top = top;
	}

	public String getAroundattracimg() {
		return aroundattracimg;
	}

	public void setAroundattracimg(String aroundattracimg) {
		this.aroundattracimg = aroundattracimg;
		if(aroundattracimg != null)
		this.aroundAI = aroundattracimg.split(",");
	}

	public String getAroundattraclocation() {
		return aroundattraclocation;
	}

	public void setAroundattraclocation(String aroundattraclocation) {
		this.aroundattraclocation = aroundattraclocation;
		if(aroundattraclocation != null)
		this.aroundAL = aroundattraclocation.split(",");
	}

	public String getAroundrestaurantimg() {
		return aroundrestaurantimg;
	}

	public void setAroundrestaurantimg(String aroundrestaurantimg) {
		this.aroundrestaurantimg = aroundrestaurantimg;
		if(aroundrestaurant != null) this.aroundRI = aroundrestaurantimg.split(",");
	}

	public String getAroundrestaurantlocation() {
		return aroundrestaurantlocation;
	}

	public void setAroundrestaurantlocation(String aroundrestaurantlocation) {
		this.aroundrestaurantlocation = aroundrestaurantlocation;
		if(aroundrestaurantlocation != null)
		this.aroundRL = aroundrestaurant.split(",");
	}

	public String getAroundgiftshopimg() {
		return aroundgiftshopimg;
	}

	public void setAroundgiftshopimg(String aroundgiftshopimg) {
		this.aroundgiftshopimg = aroundgiftshopimg;
		if(aroundgiftshopimg != null)
		this.aroundGI = aroundgiftshopimg.split(",");
	}

	public String getAroundgiftshoplocation() {
		return aroundgiftshoplocation;
	}

	public void setAroundgiftshoplocation(String aroundgiftshoplocation) {
		this.aroundgiftshoplocation = aroundgiftshoplocation;
		if(aroundgiftshoplocation != null)
		this.aroundGL = aroundgiftshoplocation.split(",");
	}
	
	public String getZoomplus() {
		return zoomplus;
	}
	
	public void setZoomplus(String zoomplus) {
		this.zoomplus = zoomplus;
	}
	
	public String getZoomminus() {
		return zoomminus;
	}
	
	public void setZoomminus(String zoomminus) {
		this.zoomminus = zoomminus;
	}
}
