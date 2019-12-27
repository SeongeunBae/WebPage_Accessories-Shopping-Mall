package my.model;

import java.util.Date;

public class Qna {

	private int qnaId;
	private String userId;
	private String qnaKind;
	private String qnaTitle;
	private String qnaMain;
	private String qnaImage;
	private Date registerTime;
	public Qna() {
		super();
	}
	public Qna(String userId, String qnaKind, String qnaTitle, String qnaMain, String qnaImage, Date registerTime) {
		super();
		this.userId = userId;
		this.qnaKind = qnaKind;
		this.qnaTitle = qnaTitle;
		this.qnaMain = qnaMain;
		this.qnaImage = qnaImage;
		this.registerTime = registerTime;
	}
	public int getQnaId() {
		return qnaId;
	}
	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQnaKind() {
		return qnaKind;
	}
	public void setQnaKind(String qnaKind) {
		this.qnaKind = qnaKind;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaMain() {
		return qnaMain;
	}
	public void setQnaMain(String qnaMain) {
		this.qnaMain = qnaMain;
	}
	public String getQnaImage() {
		return qnaImage;
	}
	public void setQnaImage(String qnaImage) {
		this.qnaImage = qnaImage;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	
	
}
