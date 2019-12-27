package my.dao;

	import java.sql.*;
	import java.util.ArrayList;
import java.util.Date;
import java.util.List;

	import my.model.Product;

import my.util.JdbcUtil;

	public class ProductDao {
		
		public void insert(Connection conn, Product product) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("insert into product (pdKind,pdDkind,productName,price,reserve,makeCountry,optionName1,optionName2,optionName3,optionValue1,optionValue2,optionValue3,smallImage,bigImage,detailImage1,detailImage2,registerTime)"
						+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1, product.getPdKind());
				pstmt.setString(2, product.getPdDkind());
				pstmt.setString(3, product.getProductName());
				pstmt.setInt(4, product.getPrice());
				pstmt.setInt(5, product.getReserve());
				pstmt.setString(6, product.getMakeCountry());
				pstmt.setString(7, product.getOptionName1());
				pstmt.setString(8, product.getOptionName2());
				pstmt.setString(9, product.getOptionName3());
				pstmt.setString(10, product.getOptionValue1());
				pstmt.setString(11, product.getOptionValue2());
				pstmt.setString(12, product.getOptionValue3());
				pstmt.setString(13, product.getSmallImage());
				pstmt.setString(14, product.getBigImage());
				pstmt.setString(15, product. getDetailImage1());
				pstmt.setString(16, product. getDetailImage2());
				pstmt.setTimestamp(17,new Timestamp(product.getRegisterTime().getTime()));
				pstmt.executeUpdate(); 
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
		
		public Product selectById(Connection conn, int productId) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			ResultSet rs = null;
			Product product = null; 
			try {
				pstmt = conn.prepareStatement
				("select * from product where productId = ?");
				pstmt.setInt(1, productId);
				rs = pstmt.executeQuery();
				if (rs.next()){
					product = new Product(); 
					product.setProductId(rs.getInt(1));
					product.setPdKind(rs.getString(2));
					product.setPdDkind(rs.getString(3));
					product.setProductName(rs.getString(4));
					product.setPrice(rs.getInt(5));
					product.setReserve(rs.getInt(6));
					product.setMakeCountry(rs.getString(7));
					product.setOptionName1(rs.getString(8));
					product.setOptionName2(rs.getString(9));
					product.setOptionName3(rs.getString(10));
					product.setOptionValue1(rs.getString(11));
					product.setOptionValue2(rs.getString(12));
					product.setOptionValue3(rs.getString(13));
					product.setSmallImage(rs.getString(14));
					product.setBigImage(rs.getString(15));
					product.setDetailImage1(rs.getString(16));
					product.setDetailImage2(rs.getString(17));
					product.setRegisterTime(rs.getTimestamp(18));
				}
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);
			}
			return product;
		}
		public Product selectByName(Connection conn, String productName) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			ResultSet rs = null;
			Product product = null; 
			try {
				pstmt = conn.prepareStatement
				("select * from product where productName = ?");
				pstmt.setString(1, productName);
				rs = pstmt.executeQuery();
				if (rs.next()){
					product = new Product(); 
					product.setProductId(rs.getInt(1));
					product.setPdKind(rs.getString(2));
					product.setPdDkind(rs.getString(3));
					product.setProductName(rs.getString(4));
					product.setPrice(rs.getInt(5));
					product.setReserve(rs.getInt(6));
					product.setMakeCountry(rs.getString(7));
					product.setOptionName1(rs.getString(8));
					product.setOptionName2(rs.getString(9));
					product.setOptionName3(rs.getString(10));
					product.setOptionValue1(rs.getString(11));
					product.setOptionValue2(rs.getString(12));
					product.setOptionValue3(rs.getString(13));
					product.setSmallImage(rs.getString(14));
					product.setBigImage(rs.getString(15));
					product.setDetailImage1(rs.getString(16));
					product.setDetailImage2(rs.getString(17));
					product.setRegisterTime(rs.getTimestamp(18));
				}
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);
			}
			return product;
		}
		
		public void update(Connection conn, Product product) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("update product set pdKind=?,pdDkind=?,productName=?,price=?,reserve=?,makeCountry=?,optionName1=?,optionName2=?,optionName3=?,optionValue1=?,optionValue2=?,optionValue3=?,smallImage=?,bigImage=?,detailImage1=?,detailImage2=? where productId=?");
				pstmt.setString(1, product.getPdKind());
				pstmt.setString(2, product.getPdDkind());
				pstmt.setString(3, product.getProductName());
				pstmt.setInt(4, product.getPrice());
				pstmt.setInt(5, product.getReserve());
				pstmt.setString(6, product.getMakeCountry());
				pstmt.setString(7, product.getOptionName1());
				pstmt.setString(8, product.getOptionName2());
				pstmt.setString(9, product.getOptionName3());
				pstmt.setString(10, product.getOptionValue1());
				pstmt.setString(11, product.getOptionValue2());
				pstmt.setString(12, product.getOptionValue3());
				pstmt.setString(13, product.getSmallImage());
				pstmt.setString(14, product.getBigImage());
				pstmt.setString(15, product.getDetailImage1());
				pstmt.setString(16, product.getDetailImage2());
				pstmt.setInt(17, product.getProductId());
				pstmt.executeUpdate(); 
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
		
		public void deleteById(Connection conn, int productId ) 
				throws SQLException {
			PreparedStatement pstmt=null; 		
			try {
				pstmt = conn.prepareStatement
				("delete from product where productId = ?");
				pstmt.setInt(1, productId);
				pstmt.executeUpdate();			
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(pstmt);
			}
		}
		
		public int selectCount(Connection conn) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product");
				rs.next();
				return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		
		public List<Product> selectList(Connection conn,String keyfield, String searchbox) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			String sql = "select * from product"; 
			if (searchbox != null && !searchbox.equals(""))
				sql += " where "+keyfield.trim()+" like '%"+searchbox.trim()+"%'";
			try {
				pstmt = conn.prepareStatement
						(sql);
			
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setProductId(rs.getInt(1));
					product.setPdKind(rs.getString(2));
					product.setPdDkind(rs.getString(3));
					product.setProductName(rs.getString(4));
					product.setPrice(rs.getInt(5));
					product.setReserve(rs.getInt(6));
					product.setMakeCountry(rs.getString(7));
					product.setOptionName1(rs.getString(8));
					product.setOptionName2(rs.getString(9));
					product.setOptionName3(rs.getString(10));
					product.setOptionValue1(rs.getString(11));
					product.setOptionValue2(rs.getString(12));
					product.setOptionValue3(rs.getString(13));
					product.setSmallImage(rs.getString(14));
					product.setBigImage(rs.getString(15));
					product.setDetailImage1(rs.getString(16));
					product.setDetailImage2(rs.getString(17));
					product.setRegisterTime(rs.getTimestamp(18));
					productList.add(product);
				}
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}
		
		public List<Product> selectList2(Connection conn, String pdDkind ) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList2 = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where pdDkind =? ");
				pstmt.setString(1, pdDkind);
				rs  = pstmt.executeQuery(); 
				productList2 = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setProductId(rs.getInt(1));
					product.setPdKind(rs.getString(2));
					product.setPdDkind(rs.getString(3));
					product.setProductName(rs.getString(4));
					product.setPrice(rs.getInt(5));
					product.setReserve(rs.getInt(6));
					product.setMakeCountry(rs.getString(7));
					product.setOptionName1(rs.getString(8));
					product.setOptionName2(rs.getString(9));
					product.setOptionName3(rs.getString(10));
					product.setOptionValue1(rs.getString(11));
					product.setOptionValue2(rs.getString(12));
					product.setOptionValue3(rs.getString(13));
					product.setSmallImage(rs.getString(14));
					product.setBigImage(rs.getString(15));
					product.setDetailImage1(rs.getString(16));
					product.setDetailImage1(rs.getString(17));
					product.setRegisterTime(rs.getTimestamp(18));
					productList2.add(product);
				}
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList2;
		}
		public List<Product> selectList3(Connection conn, String pdKind ) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList3 = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where pdKind =? ");
				pstmt.setString(1, pdKind);
				rs  = pstmt.executeQuery(); 
				productList3 = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setProductId(rs.getInt(1));
					product.setPdKind(rs.getString(2));
					product.setPdDkind(rs.getString(3));
					product.setProductName(rs.getString(4));
					product.setPrice(rs.getInt(5));
					product.setReserve(rs.getInt(6));
					product.setMakeCountry(rs.getString(7));
					product.setOptionName1(rs.getString(8));
					product.setOptionName2(rs.getString(9));
					product.setOptionName3(rs.getString(10));
					product.setOptionValue1(rs.getString(11));
					product.setOptionValue2(rs.getString(12));
					product.setOptionValue3(rs.getString(13));
					product.setSmallImage(rs.getString(14));
					product.setBigImage(rs.getString(15));
					product.setDetailImage1(rs.getString(16));
					product.setDetailImage1(rs.getString(17));
					product.setRegisterTime(rs.getTimestamp(18));
					productList3.add(product);
				}
			} finally {
			//	JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList3;
		}
		
		public void updateAccessCount(Connection conn, int productId) 
				throws SQLException {
			PreparedStatement pstmt=null; 
			try {
				pstmt = conn.prepareStatement
				("update product set accessCount = accessCount+1 where productId=?");
				pstmt.setInt(1, productId);
				pstmt.executeUpdate(); 
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				JdbcUtil.close(pstmt);
				}
		}
		
		
		 public List<Product> selectListCondition(Connection conn, String cond, String direct) 
		         throws SQLException {
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      List<Product> productList = null;
		      String sql = "select * from product"; 
		      if (cond != null && !cond.equals(""))
		         sql += " order by "+cond.trim()+" "+direct.trim();
		      try {
		         pstmt = conn.prepareStatement(sql);
		         rs  = pstmt.executeQuery(); 
		         productList = new ArrayList<Product>();
		         while (rs.next()){
		            Product product = new Product(); 
		            product.setProductId(rs.getInt(1));
		            product.setPdKind(rs.getString(2));
		            product.setPdDkind(rs.getString(3));
		            product.setProductName(rs.getString(4));
		            product.setPrice(rs.getInt(5));
		            product.setReserve(rs.getInt(6));
		            product.setMakeCountry(rs.getString(7));
		            product.setOptionName1(rs.getString(8));
		            product.setOptionName2(rs.getString(9));
		            product.setOptionName3(rs.getString(10));
		            product.setOptionValue1(rs.getString(11));
		            product.setOptionValue2(rs.getString(12));
		            product.setOptionValue3(rs.getString(13));
		            product.setSmallImage(rs.getString(14));
		            product.setBigImage(rs.getString(15));
		            product.setDetailImage1(rs.getString(16));
		            product.setDetailImage1(rs.getString(17));
		            product.setRegisterTime(rs.getTimestamp(18));
		            productList.add(product);
		         }
		      } finally {
		         //JdbcUtil.close(conn);
		         JdbcUtil.close(rs);
		         JdbcUtil.close(pstmt);
		      }
		      return productList;
		   }
	}

