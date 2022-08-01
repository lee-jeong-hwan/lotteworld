package lottemvc;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory() { }
	public static ActionFactory getInstance() {
		return instance;
	}
	
	Action getAction(String command) {
		Action action = null;
		switch(command) {
		case "lotteMain":
			action = new LotteMainAction();
			break;
		case "search":
			action = new SearchAction();
			break;
		case "Attraction":
			action = new AttractionAction();
			break;
		case "detailAttraction":
			action = new DetailAttraction();
			break;
		case "AttractionSearch":
			action = new AttractionSearchAction();
			break;
		case "Festival":
			action = new FestivalAction();
			break;
		case "ShowMain":
			action = new ShowMainAction();
			break;
		case "ShowDetail":
			action = new ShowDetailAction();
			break;
		case "Restaurant":
			action = new RestaurantAction();
			break;
		case "detailRestaurant":
			action = new DetailRestaurantlAction();
			break;
		case "Giftshop":
			action = new GiftshopAction();
			break;
		case "detailGiftshop":
			action = new DetailGiftshopAction();
			break;
		case "Charge":
			action = new ChargeAction();
			break;
		case "MagicPass":
			action = new MagicPassAction();
			break;
		case "Price":
			action = new PriceAction();
			break;
		case "Performance":
			action = new PerformanceAction();
			break;
		case "Suspension":
			action = new SuspensionAction();
			break;
		case "Park":
			action = new ParkAction();
			break;
		case "Facility":
			action = new FacilityAction();
			break;
		case "Comming":
			action = new CommingAction();
			break;
		case "Guidemap":
			action = new GuidemapAction();
			break;
		case "Notice":
			action = new NoticeAction();
			break;
		case "NoticeDetail" : 
			action = new NoticeDetailAction();
			break;
		case "NoticeSearch" : 
			action = new NoticeSearchAction();
			break;
		case "Faq":
			action = new FaqAction();
			break;
		case "Inquiry":
			action = new InquiryAction();
			break;
		case "Missing":
			action = new MissingAction();
			break;
		case "Reservation":
			action = new ReservationAction();
			break;
		case "LoginCheck" :
			action = new LoginAction();
			break;
		case "Logout" : 
			action = new LogoutAction();
			break;
		case "IDfind" : 
			action = new IDfindAction();
			break;
		case "PWfind" : 
			action = new PWfindAction();
			break;
		case "SignupSuccess" : 
			action = new SignupSuccessAction();
			break;
		case "IDmissing" :
			action = new IDmissingAction();
			break;
		case "PWmissing" :
			action = new PWmissingAction();
			break;
		case "Signup01" : 
			action = new Signup01Action();
			break;
		case "Signup02" : 
			action = new Signup02Action();
			break;
		case "NewMember" :
			action = new NewMemberAction();
			break;
		case "PWcheck" :
			action = new PWcheckAction();
			break;
		case "NewPw2" :
			action = new NewPw2Action();
			break;
		case "SimpleLogin" :
			action = new SimpleLoginAction();
			break;
		case "IDnotfind" : 
			action = new IDnotfindAction();
			break;
		case "Mypage":
			action = new MypageAction();
			break;
		}
		return action;
	}
}
