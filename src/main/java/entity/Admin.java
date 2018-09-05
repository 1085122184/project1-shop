package entity;

import jsonInfo.MD5;

public class Admin {
   public static String[] sexs= {"男","女"};
   public static String[] powers= {"超级管理员","普通管理员"};
   public static String[] statuss= {"在职","离职"};
	int id;
	int sex;
	int power;
	String nike;
	String name;
	String tel;
	String comments;
	int status;
	String password;
	String count;
	
	
	
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getPassword() {
		return password;
	}
	public String getMd5() {
		return MD5.MD5(password);
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStatus_name() {
		return statuss[status];
	}
	public String getSex_name() {
		return sexs[sex];
	}
	public String getPower_name() {
		return powers[power];
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public String getNike() {
		return nike;
	}
	public void setNike(String nike) {
		this.nike = nike;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
