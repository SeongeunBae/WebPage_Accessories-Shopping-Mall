package my.model;

public class Cart {
private int cartId;
private String userId;
private String productName;
private String optionSum;
private int price;
public Cart() {
	super();
}

public Cart(String userId,String productName,String optionSum, int price) {
	super();
	this.userId = userId;
	this.productName = productName;
	this.optionSum = optionSum;
	this.price = price;
}
public int getCartId() {
	return cartId;
}
public void setCartId(int cartId) {
	this.cartId = cartId;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}

public String getProductName() {
	return productName;
}
public void setProductName(String productName) {
	this.productName = productName;
}

public String getOptionSum() {
	return optionSum;
}

public void setOptionSum(String optionSum) {
	this.optionSum = optionSum;
}
public int getPrice() {
	return price;
}

public void setPrice(int price) {
	this.price = price;
}



}
