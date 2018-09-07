package entity;

public class Order {

	int id;
	int address_id;
	int user_id;
	String date;
	String code;
	double amount;
	double nowamount;
	int status;
	int assessstatus;
	String comments;
	String addrname;
	String uname;
	String address;
	String city4;
	String area4;
	String province4;
	
	public String getCity4() {
		return city4;
	}

	public void setCity4(String city4) {
		this.city4 = city4;
	}

	public String getArea4() {
		return area4;
	}

	public void setArea4(String area4) {
		this.area4 = area4;
	}

	public String getProvince4() {
		return province4;
	}

	public void setProvince4(String province4) {
		this.province4 = province4;
	}
	public static String[] statuss = {"未支付","已支付","已发货","已收货","申请退货","已退货","已拒绝退货"};
	public static String[] assessstatuss = {"未评价","已评价"};
	
	public String getStatus_name() {
		return statuss[status];
	}

	public String getAssessstatus_name() {
		return assessstatuss[assessstatus];
	}
	
	
	
	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getAddrname() {
		return addrname;
	}
	public void setAddrname(String addrname) {
		this.addrname = addrname;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getNowamount() {
		return nowamount;
	}
	public void setNowamount(double nowamount) {
		this.nowamount = nowamount;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getAssessstatus() {
		return assessstatus;
	}
	public void setAssessstatus(int assessstatus) {
		this.assessstatus = assessstatus;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
}
