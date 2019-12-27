package my.dao;

	import java.sql.*;
	import java.util.ArrayList;
	import java.util.List;

	import my.model.Movie;
	import my.util.JdbcUtil;

	public class MovieDao {
		
		public void insert(Connection conn, Movie movie) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("insert into movie (movieName,maker,price,movieImage,registertime)"
						+ " values(?,?,?,?,?)");
				pstmt.setString(1, movie.getMovieName());
				pstmt.setString(2, movie.getMaker());
				pstmt.setInt(3, movie.getPrice());
				pstmt.setString(4, movie.getMovieImage());
				pstmt.setTimestamp(5, 
						new Timestamp(movie.getRegisterTime().getTime()));
				pstmt.executeUpdate(); 
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
		
		public Movie selectById(Connection conn, int movieId) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			ResultSet rs = null;
			Movie movie = null; 
			try {
				pstmt = conn.prepareStatement
				("select * from movie where movieId = ?");
				pstmt.setInt(1, movieId);
				rs = pstmt.executeQuery();
				if (rs.next()){
					movie = new Movie(); 
					movie.setMovieId(rs.getInt(1));
					movie.setMovieName(rs.getString(2));
					movie.setMaker(rs.getString(3));
					movie.setPrice(rs.getInt(4));
					movie.setMovieImage(rs.getString(5));
					movie.setRegisterTime(rs.getTimestamp(6));
				}
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);
			}
			return movie;
		}
		
		public void update(Connection conn, Movie movie) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("update movie set movieName=?,maker=?,price=?,movieImage=? where movieId=?");
				
				pstmt.setString(1, movie.getMovieName());
				pstmt.setString(2, movie.getMaker());
				pstmt.setInt(3, movie.getPrice());
				pstmt.setString(4, movie.getMovieImage());
				pstmt.setInt(5, movie.getMovieId());
				pstmt.executeUpdate(); 
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
		
		public void deleteById(Connection conn, int MovieId) 
				throws SQLException {
			PreparedStatement pstmt=null; 		
			try {
				pstmt = conn.prepareStatement
				("delete from movie where movieId = ?");
				pstmt.setInt(1, MovieId);
				pstmt.executeUpdate();			
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
		
		public int selectCount(Connection conn) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from movie");
				rs.next();
				return rs.getInt(1);
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		
		public List<Movie> selectList(Connection conn) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Movie> movieList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from movie");
			
				rs  = pstmt.executeQuery(); 
				movieList = new ArrayList<Movie>();
				while (rs.next()){
					Movie movie = new Movie();
					movie.setMovieId(rs.getInt(1));
					movie.setMovieName(rs.getString(2));
					movie.setMaker(rs.getString(3));
					movie.setPrice(rs.getInt(4));
					movie.setMovieImage(rs.getString(5));
					movie.setRegisterTime(rs.getTimestamp(6));
					movieList.add(movie);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return movieList;
		}
	}

