package my.dao;

	import java.sql.*;
	import java.util.ArrayList;
	import java.util.List;

	import my.model.Qna;
	import my.util.JdbcUtil;

	public class QnaDao {
		
		public void insert(Connection conn, Qna qna) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("insert into qna (userId,qnaTitle,qnaKind,qnaMain,qnaImage,registerTime)"
						+ " values(?,?,?,?,?,?)");
				pstmt.setString(1, qna.getUserId());
				pstmt.setString(2, qna.getQnaTitle());
				pstmt.setString(3, qna.getQnaKind());
				pstmt.setString(4, qna.getQnaMain());
				pstmt.setString(5, qna.getQnaImage());
				pstmt.setTimestamp(6, 
						new Timestamp(qna.getRegisterTime().getTime()));
				pstmt.executeUpdate(); 
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
	
		public Qna selectById(Connection conn, int qnaId) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			ResultSet rs = null;
			Qna qna = null; 
			try {
				pstmt = conn.prepareStatement
				("select * from qna where qnaId = ?");
				pstmt.setInt(1, qnaId);
				rs = pstmt.executeQuery();
				if (rs.next()){
					qna = new Qna();
					qna.setQnaId(rs.getInt(1));
					qna.setUserId(rs.getString(2));
					qna.setQnaKind(rs.getString(3));
					qna.setQnaTitle(rs.getString(4));
					qna.setQnaMain(rs.getString(5));
					qna.setQnaImage(rs.getString(6));
					qna.setRegisterTime(rs.getTimestamp(7));
				}
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);
			}
			return qna;
		}
		
		public void deleteById(Connection conn, int qnaId) 
				throws SQLException {
			PreparedStatement pstmt=null; 		
			try {
				pstmt = conn.prepareStatement
				("delete from qna where qnaId = ?");
				pstmt.setInt(1, qnaId);
				pstmt.executeUpdate();			
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
	
		public List<Qna> selectList(Connection conn, String qnaKind) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Qna> qnaList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from qna where qnaKind=?");
				pstmt.setString(1, qnaKind);
				rs  = pstmt.executeQuery(); 
				qnaList = new ArrayList<Qna>();
				while (rs.next()){
					Qna qna = new Qna();
					qna.setQnaId(rs.getInt(1));
					qna.setUserId(rs.getString(2));
					qna.setQnaKind(rs.getString(3));
					qna.setQnaTitle(rs.getString(4));
					qna.setQnaMain(rs.getString(5));
					qna.setQnaImage(rs.getString(6));
					qna.setRegisterTime(rs.getTimestamp(7));
					qnaList.add(qna);
				}
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return qnaList;
		}
		public List<Qna> selectList2(Connection conn, String userId) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Qna> qnaList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from qna where userId=?");
				pstmt.setString(1, userId);
				rs  = pstmt.executeQuery(); 
				qnaList = new ArrayList<Qna>();
				while (rs.next()){
					Qna qna = new Qna();
					qna.setQnaId(rs.getInt(1));
					qna.setUserId(rs.getString(2));
					qna.setQnaKind(rs.getString(3));
					qna.setQnaTitle(rs.getString(4));
					qna.setQnaMain(rs.getString(5));
					qna.setQnaImage(rs.getString(6));
					qna.setRegisterTime(rs.getTimestamp(7));
					qnaList.add(qna);
				}
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return qnaList;
		}
		public List<Qna> selectList3(Connection conn) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Qna> qnaList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from qna");
				rs  = pstmt.executeQuery(); 
				qnaList = new ArrayList<Qna>();
				while (rs.next()){
					Qna qna = new Qna();
					qna.setQnaId(rs.getInt(1));
					qna.setUserId(rs.getString(2));
					qna.setQnaKind(rs.getString(3));
					qna.setQnaTitle(rs.getString(4));
					qna.setQnaMain(rs.getString(5));
					qna.setQnaImage(rs.getString(6));
					qna.setRegisterTime(rs.getTimestamp(7));
					qnaList.add(qna);
				}
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return qnaList;
		}
		
		/*
		public void update(Connection conn, Qna qna) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("update qna set password=?,email =? where cid=?");
				
				pstmt.setString(1, qna.getPassword());
				pstmt.setString(2, qna.getEmail());
				pstmt.setString(3, qna.getCid());
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
				rs = stmt.executeQuery("select count(*) from qna");
				rs.next();
				return rs.getInt(1);
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
	*/
	}

