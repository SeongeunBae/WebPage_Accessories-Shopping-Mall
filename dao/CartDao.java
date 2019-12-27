package my.dao;

	import java.sql.*;
	import java.util.ArrayList;
	import java.util.List;

	import my.model.Cart;
	import my.util.JdbcUtil;

	public class CartDao {
		
		public void insert(Connection conn, Cart cart) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("insert into cart (userId,productName,optionSum,price)"
						+ " values(?,?,?,?)");
				pstmt.setString(1, cart.getUserId());
				pstmt.setString(2, cart.getProductName());
				pstmt.setString(3, cart.getOptionSum());
				pstmt.setInt(4, cart.getPrice());
				pstmt.executeUpdate(); 
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
		
		public Cart selectById(Connection conn, String userId) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			ResultSet rs = null;
			Cart cart = null; 
			try {
				pstmt = conn.prepareStatement
				("select * from cart where userId = ?");
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				if (rs.next()){
					cart = new Cart(); 
					cart.setCartId(rs.getInt(1));
					cart.setUserId(rs.getString(2));
					cart.setProductName(rs.getString(3));
					cart.setOptionSum(rs.getString(4));
					cart.setPrice(rs.getInt(5));
				}
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);
			}
			return cart;
		}
		public List<Cart> selectListById(Connection conn, String userId) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Cart> cartList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from cart where userId=?");
				pstmt.setString(1, userId);
				rs  = pstmt.executeQuery(); 
				cartList = new ArrayList<Cart>();
				while (rs.next()){
					Cart cart = new Cart();
					cart.setCartId(rs.getInt(1));
					cart.setUserId(rs.getString(2));
					cart.setProductName(rs.getString(3));
					cart.setOptionSum(rs.getString(4));
					cart.setPrice(rs.getInt(5));
					cartList.add(cart);
				}
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return cartList;
		}
		
		public void deleteById(Connection conn, int cartId) 
				throws SQLException {
			PreparedStatement pstmt=null; 		
			try {
				pstmt = conn.prepareStatement
				("delete from cart where cartId = ?");
				pstmt.setInt(1, cartId);
				pstmt.executeUpdate();			
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
	
		/*
		public void update(Connection conn, Cart cart) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("update cart set password=?,email =? where cid=?");
				
				pstmt.setString(1, cart.getPassword());
				pstmt.setString(2, cart.getEmail());
				pstmt.setString(3, cart.getCid());
				pstmt.executeUpdate(); 
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
		

		}
		
		public int selectCount(Connection conn) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from cart");
				rs.next();
				return rs.getInt(1);
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		*/
		
	
	}
