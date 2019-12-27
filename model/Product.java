package my.model;

import java.util.Date;

public class Product {
   private int productId;
   private String pdKind;
   private String pdDkind;
   private String productName;
   private int price;
   private int reserve;   
   private String makeCountry;
   private String optionName1;
   private String optionName2;
   private String optionName3;
   private String optionValue1;
   private String optionValue2;
   private String optionValue3;
   private String smallImage;
   private String bigImage;
   private String detailImage1;
   private String detailImage2;
   private Date registerTime;
   
   
   
   
   public Product() {
   
   }

   public Product(String pdKind, String pdDkind, String productName, int price, int reserve, String makeCountry,
         String optionName1, String optionName2, String optionName3, String optionValue1, String optionValue2,
         String optionValue3, String smallImage, String bigImage, String detailImage1,String detailImage2, Date registerTime) {
      super();
      this.pdKind = pdKind;
      this.pdDkind = pdDkind;
      this.productName = productName;
      this.price = price;
      this.reserve = reserve;
      this.makeCountry = makeCountry;
      this.optionName1 = optionName1;
      this.optionName2 = optionName2;
      this.optionName3 = optionName3;
      this.optionValue1 = optionValue1;
      this.optionValue2 = optionValue2;
      this.optionValue3 = optionValue3;
      this.smallImage = smallImage;
      this.bigImage = bigImage;
      this.detailImage1 = detailImage1;
      this.detailImage2 = detailImage2;
      this.registerTime = registerTime;
   }
   
   
   

   public Product(int productId, String pdKind, String pdDkind, String productName, int price, int reserve,
         String makeCountry, String optionName1, String optionName2, String optionName3, String optionValue1,
         String optionValue2, String optionValue3, String smallImage, String bigImage, String detailImage1,
         String detailImage2) {
      super();
      this.productId = productId;
      this.pdKind = pdKind;
      this.pdDkind = pdDkind;
      this.productName = productName;
      this.price = price;
      this.reserve = reserve;
      this.makeCountry = makeCountry;
      this.optionName1 = optionName1;
      this.optionName2 = optionName2;
      this.optionName3 = optionName3;
      this.optionValue1 = optionValue1;
      this.optionValue2 = optionValue2;
      this.optionValue3 = optionValue3;
      this.smallImage = smallImage;
      this.bigImage = bigImage;
      this.detailImage1 = detailImage1;
      this.detailImage2 = detailImage2;
   }

   public int getProductId() {
      return productId;
   }

   public void setProductId(int productId) {
      this.productId = productId;
   }

   public String getPdKind() {
      return pdKind;
   }

   public void setPdKind(String pdKind) {
      this.pdKind = pdKind;
   }

   public String getPdDkind() {
      return pdDkind;
   }

   public void setPdDkind(String pdDkind) {
      this.pdDkind = pdDkind;
   }

   public String getProductName() {
      return productName;
   }

   public void setProductName(String productName) {
      this.productName = productName;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }

   public int getReserve() {
      return reserve;
   }

   public void setReserve(int reserve) {
      this.reserve = reserve;
   }

   public String getMakeCountry() {
      return makeCountry;
   }

   public void setMakeCountry(String makeCountry) {
      this.makeCountry = makeCountry;
   }

   public String getOptionName1() {
      return optionName1;
   }

   public void setOptionName1(String optionName1) {
      this.optionName1 = optionName1;
   }

   public String getOptionName2() {
      return optionName2;
   }

   public void setOptionName2(String optionName2) {
      this.optionName2 = optionName2;
   }

   public String getOptionName3() {
      return optionName3;
   }

   public void setOptionName3(String optionName3) {
      this.optionName3 = optionName3;
   }

   public String getOptionValue1() {
      return optionValue1;
   }

   public void setOptionValue1(String optionValue1) {
      this.optionValue1 = optionValue1;
   }

   public String getOptionValue2() {
      return optionValue2;
   }

   public void setOptionValue2(String optionValue2) {
      this.optionValue2 = optionValue2;
   }

   public String getOptionValue3() {
      return optionValue3;
   }

   public void setOptionValue3(String optionValue3) {
      this.optionValue3 = optionValue3;
   }

   public String getSmallImage() {
      return smallImage;
   }
   

   public void setSmallImage(String smallImage) {
      this.smallImage = smallImage;
   }

   public String getBigImage() {
      return bigImage;
   }

   public void setBigImage(String bigImage) {
      this.bigImage = bigImage;
   }

   public String getDetailImage1() {
      return detailImage1;
   }

   public void setDetailImage1(String detailImage) {
      this.detailImage1 = detailImage;
   }
   public String getDetailImage2() {
      return detailImage2;
   }

   public void setDetailImage2(String detailImage) {
      this.detailImage2 = detailImage;
   }

   public Date getRegisterTime() {
      return registerTime;
   }

   public void setRegisterTime(Date registerTime) {
      this.registerTime = registerTime;
   }
}