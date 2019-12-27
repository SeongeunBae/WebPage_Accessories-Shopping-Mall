package my.dao;

	import java.sql.*;
	import java.util.ArrayList;
	import java.util.List;

	import my.model.Purchase;
	import my.util.JdbcUtil;

public class PurchaseDao {
		
		public void insert(Connection conn, Purchase purchase) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("insert into purchase (userId,productName,optionSum,count,payment,recipient,sample6_postcode,sample6_address,daddress,phoneNumber,memo,payMethod,registerTime)"
						+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1, purchase.getUserId());
				pstmt.setString(2, purchase.getProductName());
				pstmt.setString(3, purchase.getOptionSum());
				pstmt.setInt(4, purchase.getCount());
				pstmt.setInt(5, purchase.getPayment());
				pstmt.setString(6, purchase.getRecipient());
				pstmt.setString(7, purchase.getSample6_postcode());
				pstmt.setString(8, purchase.getSample6_address());
				pstmt.setString(9, purchase.getDaddress());
				pstmt.setString(10, purchase.getPhoneNumber());
				pstmt.setString(11, purchase.getMemo());
				pstmt.setString(12, purchase.getPayMethod());
				pstmt.setTimestamp(13, 
						new Timestamp(purchase.getRegisterTime().getTime()));
				pstmt.executeUpdate(); 
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
		
		public List<Purchase> selectList(Connection conn) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Purchase> purchaseList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from purchase");
			
				rs  = pstmt.executeQuery(); 
				purchaseList = new ArrayList<Purchase>();
				while (rs.next()){
					Purchase purchase = new Purchase();
					purchase.setPurchaseId(rs.getInt(1));
					purchase.setUserId(rs.getString(2));
					purchase.setProductName(rs.getString(3));
					purchase.setOptionSum(rs.getString(4));
					purchase.setCount(rs.getInt(5));
					purchase.setPayment(rs.getInt(6));
					purchase.setRecipient(rs.getString(7));
					purchase.setSample6_postcode(rs.getString(8));
					purchase.setSample6_address(rs.getString(9));
					purchase.setDaddress(rs.getString(10));
					purchase.setPhoneNumber(rs.getString(11));
					purchase.setMemo(rs.getString(12));
					purchase.setPayMethod(rs.getString(13));
					purchase.setRegisterTime(rs.getTimestamp(14));
					purchaseList.add(purchase);
				}
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return purchaseList;
		} 
		
		public List<Purchase> selectList2(Connection conn, String userId) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Purchase> purchaseList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from purchase where userId=?");
				pstmt.setString(1, userId);
				pstmt.executeUpdate();		
				rs  = pstmt.executeQuery(); 
				purchaseList = new ArrayList<Purchase>();
				while (rs.next()){
					Purchase purchase = new Purchase();
					purchase.setPurchaseId(rs.getInt(1));
					purchase.setUserId(rs.getString(2));
					purchase.setProductName(rs.getString(3));
					purchase.setOptionSum(rs.getString(4));
					purchase.setCount(rs.getInt(5));
					purchase.setPayment(rs.getInt(6));
					purchase.setRecipient(rs.getString(7));
					purchase.setSample6_postcode(rs.getString(8));
					purchase.setSample6_address(rs.getString(9));
					purchase.setDaddress(rs.getString(10));
					purchase.setPhoneNumber(rs.getString(11));
					purchase.setMemo(rs.getString(12));
					purchase.setPayMethod(rs.getString(13));
					purchase.setRegisterTime(rs.getTimestamp(14));
					purchaseList.add(purchase);
				}
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return purchaseList;
		} 
		
		public void deleteById(Connection conn, int purchaseId) 
				throws SQLException {
			PreparedStatement pstmt=null; 		
			try {
				pstmt = conn.prepareStatement
				("delete from purchase where purchaseId = ?");
				pstmt.setInt(1, purchaseId);
				pstmt.executeUpdate();			
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
		
		/*
		public Purchase selectById(Connection conn, String cid) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			ResultSet rs = null;
			Purchase purchase = null; 
			try {
				pstmt = conn.prepareStatement
				("select * from purchase where cid = ?");
				pstmt.setString(1, cid);
				rs = pstmt.executeQuery();
				if (rs.next()){
					purchase = new Purchase(); 
					purchase.setId(rs.getInt(1));
					purchase.setCid(rs.getString(2));
					purchase.setPassword(rs.getString(3));
					purchase.setEmail(rs.getString(4));
					purchase.setRegisterTime(rs.getTimestamp(5));
				}
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);
			}
			return purchase;
		}
		
		
		public void update(Connection conn, Purchase purchase) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("update purchase set password=?,email =? where cid=?");
				
				pstmt.setString(1, purchase.getPassword());
				pstmt.setString(2, purchase.getEmail());
				pstmt.setString(3, purchase.getCid());
				pstmt.executeUpdate(); 
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
		
		public void deleteById(Connection conn, String cid) 
				throws SQLException {
			PreparedStatement pstmt=null; 		
			try {
				pstmt = conn.prepareStatement
				("delete from purchase where purchaseId = ?");
				pstmt.setString(1, cid);
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
				rs = stmt.executeQuery("select count(*) from purchase");
				rs.next();
				return rs.getInt(1);
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		*/
		public List<Purchase> selectList3(Connection conn, String userId ) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Purchase> purchaseList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from purchase where userId=?");
				pstmt.setString(1, userId);
				rs  = pstmt.executeQuery(); 
				purchaseList = new ArrayList<Purchase>();
				while (rs.next()){
					Purchase purchase = new Purchase();
					purchase.setPurchaseId(rs.getInt(1));
					purchase.setUserId(rs.getString(2));
					purchase.setProductName(rs.getString(3));
					purchase.setOptionSum(rs.getString(4));
					purchase.setCount(rs.getInt(5));
					purchase.setPayment(rs.getInt(6));
					purchase.setRecipient(rs.getString(7));
					purchase.setSample6_postcode(rs.getString(8));
					purchase.setSample6_address(rs.getString(9));
					purchase.setDaddress(rs.getString(10));
					purchase.setPhoneNumber(rs.getString(11));
					purchase.setMemo(rs.getString(12));
					purchase.setPayMethod(rs.getString(13));
					purchase.setRegisterTime(rs.getTimestamp(14));
					purchaseList.add(purchase);
				}
			} finally {
				//JdbcUtil.close(conn1);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return purchaseList;
			
		} 
	}

