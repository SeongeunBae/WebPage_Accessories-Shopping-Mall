package my.dao;

   import java.sql.*;
   import java.util.ArrayList;
   import java.util.List;

   import my.model.Member;
   import my.util.JdbcUtil;

   public class MemberDao {
      
      public void insert(Connection conn, Member member) 
            throws SQLException {
         PreparedStatement pstmt=null; 
         try {
            pstmt = conn.prepareStatement
            ("insert into member (phoneNum1,phoneNum2,phoneNum3,userId,password,userName,email1,email2,gender,year,month,date,sample6_postcode,sample6_address,daddress,admitEmail,registertime)"
                  + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, member.getPhoneNum1());
            pstmt.setInt(2, member.getPhoneNum2());
            pstmt.setInt(3, member.getPhoneNum3());
            pstmt.setString(4, member.getUserId());
            pstmt.setString(5, member.getPassword());
            pstmt.setString(6, member.getUserName());
            pstmt.setString(7, member.getEmail1());
            pstmt.setString(8, member.getEmail2());
            pstmt.setString(9, member.getGender());
            pstmt.setInt(10, member.getYear());
            pstmt.setInt(11, member.getMonth());
            pstmt.setInt(12, member.getDate());
            pstmt.setString(13, member.getSample6_postcode());
            pstmt.setString(14, member.getSample6_address());
            pstmt.setString(15, member.getDaddress());
            pstmt.setString(16, member.getAdmitEmail());
            pstmt.setTimestamp(17, 
                  new Timestamp(member.getRegisterTime().getTime()));
            pstmt.executeUpdate(); 
         } catch (SQLException e){
            e.printStackTrace();
         } finally {
            //JdbcUtil.close(conn);
            JdbcUtil.close(pstmt);
         }
      }
      
      public Member selectById(Connection conn, int memberId) 
            throws SQLException {
         PreparedStatement pstmt=null; 
         ResultSet rs = null;
         Member member = null; 
         try {
            pstmt = conn.prepareStatement
            ("select * from member where memberId = ?");
            pstmt.setInt(1, memberId);
            rs = pstmt.executeQuery();
            if (rs.next()){
               member = new Member(); 
               member.setMemberId(rs.getInt(1));
               member.setPhoneNum1(rs.getString(2));
               member.setPhoneNum2(rs.getInt(3));
               member.setPhoneNum3(rs.getInt(4));
               member.setUserId(rs.getString(5));
               member.setPassword(rs.getString(6));
               member.setUserName(rs.getString(7));
               member.setEmail1(rs.getString(8));
               member.setEmail2(rs.getString(9));
               member.setGender(rs.getString(10));
               member.setYear(rs.getInt(11));
               member.setMonth(rs.getInt(12));
               member.setDate(rs.getInt(13));
               member.setSample6_postcode(rs.getString(14));
               member.setSample6_address(rs.getString(15));
               member.setDaddress(rs.getString(16));
               member.setAdmitEmail(rs.getString(17));
               member.setRegisterTime(rs.getTimestamp(18));
            }
         } catch (SQLException e){
            e.printStackTrace();
         } finally {
            //JdbcUtil.close(conn);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
         }
         return member;
      }
      public Member selectByuserId(Connection conn, String userId) 
            throws SQLException {
         PreparedStatement pstmt=null; 
         ResultSet rs = null;
         Member member = null; 
         try {
            pstmt = conn.prepareStatement
            ("select * from member where userId = ?");
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()){
               member = new Member(); 
               member.setMemberId(rs.getInt(1));
               member.setPhoneNum1(rs.getString(2));
               member.setPhoneNum2(rs.getInt(3));
               member.setPhoneNum3(rs.getInt(4));
               member.setUserId(rs.getString(5));
               member.setPassword(rs.getString(6));
               member.setUserName(rs.getString(7));
               member.setEmail1(rs.getString(8));
               member.setEmail2(rs.getString(9));
               member.setGender(rs.getString(10));
               member.setYear(rs.getInt(11));
               member.setMonth(rs.getInt(12));
               member.setDate(rs.getInt(13));
               member.setSample6_postcode(rs.getString(14));
               member.setSample6_address(rs.getString(15));
               member.setDaddress(rs.getString(16));
               member.setAdmitEmail(rs.getString(17));
               member.setRegisterTime(rs.getTimestamp(18));
            }
         } catch (SQLException e){
            e.printStackTrace();
         } finally {
            //JdbcUtil.close(conn);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
         }
         return member;
      }
      
      public Member selectByUserId(Connection conn, String userId) 
            throws SQLException {
         PreparedStatement pstmt=null; 
         ResultSet rs = null;
         Member member = null; 
         try {
            pstmt = conn.prepareStatement
            ("select * from member where userId = ?");
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()){
               member = new Member(); 
               member.setMemberId(rs.getInt(1));
               member.setPhoneNum1(rs.getString(2));
               member.setPhoneNum2(rs.getInt(3));
               member.setPhoneNum3(rs.getInt(4));
               member.setUserId(rs.getString(5));
               member.setPassword(rs.getString(6));
               member.setUserName(rs.getString(7));
               member.setEmail1(rs.getString(8));
               member.setEmail2(rs.getString(9));
               member.setGender(rs.getString(10));
               member.setYear(rs.getInt(11));
               member.setMonth(rs.getInt(12));
               member.setDate(rs.getInt(13));
               member.setSample6_postcode(rs.getString(14));
               member.setSample6_address(rs.getString(15));
               member.setDaddress(rs.getString(16));
               member.setAdmitEmail(rs.getString(17));
               member.setRegisterTime(rs.getTimestamp(18));
            }
         } catch (SQLException e){
            e.printStackTrace();
         } finally {
            //JdbcUtil.close(conn);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
         }
         return member;
      }
      
      public void deleteById(Connection conn, int merberId) 
            throws SQLException {
         PreparedStatement pstmt=null;       
         try {
            pstmt = conn.prepareStatement
            ("delete from member where memberId = ?");
            pstmt.setInt(1, merberId);
            pstmt.executeUpdate();         
         } catch (SQLException e){
            e.printStackTrace();
         } finally {
            //JdbcUtil.close(conn);
            JdbcUtil.close(pstmt);
         }
      }
      
      public void update(Connection conn, Member member) 
            throws SQLException {
         PreparedStatement pstmt=null; 
         try {
            pstmt = conn.prepareStatement
            ("update member set phoneNum1=?,phoneNum2=?,phoneNum3=?,userId=?,password=?,userName=?,email1=?,email2=?,gender=?,year=?,month=?,date=?,sample6_postcode=?,sample6_address=?,daddress=?,admitemail=? where memberId=?");
            
            pstmt.setString(1, member.getPhoneNum1());
            pstmt.setInt(2, member.getPhoneNum2());
            pstmt.setInt(3, member.getPhoneNum3());
            pstmt.setString(4, member.getUserId());
            pstmt.setString(5, member.getPassword());
            pstmt.setString(6, member.getUserName());
            pstmt.setString(7, member.getEmail1());
            pstmt.setString(8, member.getEmail2());
            pstmt.setString(9, member.getGender());
            pstmt.setInt(10, member.getYear());
            pstmt.setInt(11, member.getMonth());
            pstmt.setInt(12, member.getDate());
            pstmt.setString(13, member.getSample6_postcode());
            pstmt.setString(14, member.getSample6_address());
            pstmt.setString(15, member.getDaddress());
            pstmt.setString(16, member.getAdmitEmail());
            pstmt.setInt(17, member.getMemberId());
            pstmt.executeUpdate(); 
         } catch (SQLException e){
            e.printStackTrace();
         } finally {
            //JdbcUtil.close(conn);
            JdbcUtil.close(pstmt);
         }
      }
      /*
      
      
      public int selectCount(Connection conn) throws SQLException {
         Statement stmt = null; 
         ResultSet rs = null; 
         try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select count(*) from member");
            rs.next();
            return rs.getInt(1);
         } finally {
            JdbcUtil.close(conn);
            JdbcUtil.close(rs);
         }
      }
      */
      public List<Member> selectList(Connection conn) 
            throws SQLException {
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         List<Member> memberList = null;
         try {
            pstmt = conn.prepareStatement
                  ("select * from member");
         
            rs  = pstmt.executeQuery(); 
            memberList = new ArrayList<Member>();
            while (rs.next()){
               Member member = new Member();
               member.setMemberId(rs.getInt(1));
               member.setPhoneNum1(rs.getString(2));
               member.setPhoneNum2(rs.getInt(3));
               member.setPhoneNum3(rs.getInt(4));
               member.setUserId(rs.getString(5));
               member.setPassword(rs.getString(6));
               member.setUserName(rs.getString(7));
               member.setEmail1(rs.getString(8));
               member.setEmail2(rs.getString(9));
               member.setGender(rs.getString(10));
               member.setYear(rs.getInt(11));
               member.setMonth(rs.getInt(12));
               member.setDate(rs.getInt(13));
               member.setSample6_postcode(rs.getString(14));
               member.setSample6_address(rs.getString(15));
               member.setDaddress(rs.getString(16));
               member.setAdmitEmail(rs.getString(17));
               member.setRegisterTime(rs.getTimestamp(18));
               memberList.add(member);
            }
         } finally {
            //JdbcUtil.close(conn);
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
         }
         return memberList;
      }
      public String selectPasswordById(Connection conn, String userId) throws SQLException {
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         String password = null;
         try {
            pstmt = conn.prepareStatement("select password from member where userId = ?");
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
               password = rs.getString(1);
            }
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            // JdbcUtil.close(conn);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
         }
         return password;
      }
   }
