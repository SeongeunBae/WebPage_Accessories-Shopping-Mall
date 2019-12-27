package my.model;
import java.util.Date;
public class Purchase {
	private int purchaseId;
	private String userId;
	private String productName;
	private String optionSum;
	private int count;
	private int payment;
	private String recipient;
	private String sample6_postcode;
	private String sample6_address;
	private String daddress;
	private String phoneNumber;
	private String memo;
	private String payMethod;
	private Date registerTime;
	
	public Purchase() {
		super();
	}


	public Purchase(String userId, String productName, String optionSum, int count, int payment, String recipient,
			String sample6_postcode, String sample6_address, String daddress, String phoneNumber, String memo,
			String payMethod, Date registerTime) {
		super();
		this.userId = userId;
		this.productName = productName;
		this.optionSum = optionSum;
		this.count = count;
		this.payment = payment;
		this.recipient = recipient;
		this.sample6_postcode = sample6_postcode;
		this.sample6_address = sample6_address;
		this.daddress = daddress;
		this.phoneNumber = phoneNumber;
		this.memo = memo;
		this.payMethod = payMethod;
		this.registerTime = registerTime;
	}


	public int getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(int purchaseId) {
		this.purchaseId = purchaseId;
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

	public void setOptionSum(String eoptionSum) {
		this.optionSum = eoptionSum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int paymemt) {
		this.payment = paymemt;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public Date getRegisterTime() {
		return registerTime;
	}


	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	
}
