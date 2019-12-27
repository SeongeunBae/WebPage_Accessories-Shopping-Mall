package my.model;

import java.util.Date;

public class Member {
   private int memberId;
   private String phoneNum1;
   private int phoneNum2;
   private int phoneNum3;
   private String userId;
   private String password;
   private String userName;
   private String email1;
   private String email2;
   private String gender;
   private int year;
   private int month;
   private int date;
   private String sample6_postcode;
   private String sample6_address;
   private String daddress;
   private String admitEmail;
   private Date registerTime;
   
   public Member() {
   }

   public Member(String phoneNum1, int phoneNum2, int phoneNum3, String userId, String password, String userName,
         String email1, String email2, String gender, int year, int month, int date, String sample6_postcode,
         String sample6_address, String daddress, String admitEmail, Date registerTime) {
      super();
      this.phoneNum1 = phoneNum1;
      this.phoneNum2 = phoneNum2;
      this.phoneNum3 = phoneNum3;
      this.userId = userId;
      this.password = password;
      this.userName = userName;
      this.email1 = email1;
      this.email2 = email2;
      this.gender = gender;
      this.year = year;
      this.month = month;
      this.date = date;
      this.sample6_postcode = sample6_postcode;
      this.sample6_address = sample6_address;
      this.daddress = daddress;
      this.admitEmail = admitEmail;
      this.registerTime = registerTime;
   }
   
   


   public Member(int memberId, String phoneNum1, int phoneNum2, int phoneNum3, String userId, String password,
         String userName, String email1, String email2, String gender, int year, int month, int date,
         String sample6_postcode, String sample6_address, String daddress, String admitEmail) {
      super();
      this.memberId = memberId;
      this.phoneNum1 = phoneNum1;
      this.phoneNum2 = phoneNum2;
      this.phoneNum3 = phoneNum3;
      this.userId = userId;
      this.password = password;
      this.userName = userName;
      this.email1 = email1;
      this.email2 = email2;
      this.gender = gender;
      this.year = year;
      this.month = month;
      this.date = date;
      this.sample6_postcode = sample6_postcode;
      this.sample6_address = sample6_address;
      this.daddress = daddress;
      this.admitEmail = admitEmail;
   }

   public int getMemberId() {
      return memberId;
   }

   public void setMemberId(int memberId) {
      this.memberId = memberId;
   }

   public String getPhoneNum1() {
      return phoneNum1;
   }

   public void setPhoneNum1(String phoneNum1) {
      this.phoneNum1 = phoneNum1;
   }

   public int getPhoneNum2() {
      return phoneNum2;
   }

   public void setPhoneNum2(int phoneNum2) {
      this.phoneNum2 = phoneNum2;
   }

   public int getPhoneNum3() {
      return phoneNum3;
   }

   public void setPhoneNum3(int phoneNum3) {
      this.phoneNum3 = phoneNum3;
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getUserName() {
      return userName;
   }

   public void setUserName(String userName) {
      this.userName = userName;
   }

   public String getEmail1() {
      return email1;
   }

   public void setEmail1(String email1) {
      this.email1 = email1;
   }

   public String getEmail2() {
      return email2;
   }

   public void setEmail2(String email2) {
      this.email2 = email2;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public int getYear() {
      return year;
   }

   public void setYear(int year) {
      this.year = year;
   }

   public int getMonth() {
      return month;
   }

   public void setMonth(int month) {
      this.month = month;
   }

   public int getDate() {
      return date;
   }

   public void setDate(int date) {
      this.date = date;
   }

   public String getSample6_postcode() {
      return sample6_postcode;
   }

   public void setSample6_postcode(String sample6_postcode) {
      this.sample6_postcode = sample6_postcode;
   }

   public String getSample6_address() {
      return sample6_address;
   }

   public void setSample6_address(String sample6_address) {
      this.sample6_address = sample6_address;
   }

   public String getDaddress() {
      return daddress;
   }

   public void setDaddress(String daddress) {
      this.daddress = daddress;
   }

   public String getAdmitEmail() {
      return admitEmail;
   }

   public void setAdmitEmail(String admitEmail) {
      this.admitEmail = admitEmail;
   }

   public Date getRegisterTime() {
      return registerTime;
   }

   public void setRegisterTime(Date registerTime) {
      this.registerTime = registerTime;
   }
   
   
}