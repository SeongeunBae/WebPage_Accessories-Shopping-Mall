package my.model;

import java.util.Date;

public class Movie {
	private int movieId;
	private String movieName;
	private String maker;
	private int price;
	private String movieImage;
	private Date registerTime;
	
	public Movie(){} //기본생성자
	
	
	
	public Movie(String movieName, String maker, int price, String movieImage, Date registerTime) {
		super();
		this.movieName = movieName;
		this.maker = maker;
		this.price = price;
		this.movieImage = movieImage;
		this.registerTime = registerTime;
	}//파라미터 생성자



	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMovieImage() {
		return movieImage;
	}
	public void setMovieImage(String movieImage) {
		this.movieImage = movieImage;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	
	
	
	
}
