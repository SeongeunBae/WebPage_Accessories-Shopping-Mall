package my.dao;

	import java.sql.*;
	import java.util.ArrayList;
	import java.util.List;

	import my.model.Customer;
	import my.util.JdbcUtil;

	public class CustomerDao {
		
		public void insert(Connection conn, Customer customer) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("insert into customer (cid,password,email,registertime)"
						+ " values(?,?,?,?)");
				pstmt.setString(1, customer.getCid());
				pstmt.setString(2, customer.getPassword());
				pstmt.setString(3, customer.getEmail());
				pstmt.setTimestamp(4, 
						new Timestamp(customer.getRegisterTime().getTime()));
				pstmt.executeUpdate(); 
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
		
		public Customer selectById(Connection conn, String cid) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			ResultSet rs = null;
			Customer customer = null; 
			try {
				pstmt = conn.prepareStatement
				("select * from customer where cid = ?");
				pstmt.setString(1, cid);
				rs = pstmt.executeQuery();
				if (rs.next()){
					customer = new Customer(); 
					customer.setId(rs.getInt(1));
					customer.setCid(rs.getString(2));
					customer.setPassword(rs.getString(3));
					customer.setEmail(rs.getString(4));
					customer.setRegisterTime(rs.getTimestamp(5));
				}
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);
			}
			return customer;
		}
		
		public void update(Connection conn, Customer customer) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("update customer set password=?,email =? where cid=?");
				
				pstmt.setString(1, customer.getPassword());
				pstmt.setString(2, customer.getEmail());
				pstmt.setString(3, customer.getCid());
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
				("delete from customer where customerId = ?");
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
				rs = stmt.executeQuery("select count(*) from customer");
				rs.next();
				return rs.getInt(1);
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		
		public List<Customer> selectList(Connection conn) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Customer> customerList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from customer");
			
				rs  = pstmt.executeQuery(); 
				customerList = new ArrayList<Customer>();
				while (rs.next()){
					Customer customer = new Customer();
					customer.setId(rs.getInt(1));
					customer.setCid(rs.getString(2));
					customer.setPassword(rs.getString(3));
					customer.setEmail(rs.getString(4));
					customer.setRegisterTime(rs.getTimestamp(5));
					customerList.add(customer);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return customerList;
		}
	}

