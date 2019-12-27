<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="my.model.*,my.dao.*,my.util.*,java.sql.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="mainlayout.css" rel="stylesheet" type="text/css" />
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<style type="text/css">
a:link {
   color: #000;
}
a:visited {
   color: #000;
}
a:hover {
   color: #F00;
}
</style>
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script><script>
      $( document ).ready( function() {
        var jbOffset = $( '#page_header' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '#page_header' ).addClass( 'jbFixed' );
          }
          else {
            $( '#page_header' ).removeClass( 'jbFixed' );
          }
        });
      } );
      </script>
</head>
<body>
<div id="wrap">
  <div id="page_header">
    <div id="top_content">
     <div id="Tmenu">
     <% 
     String Id = (String)session.getAttribute("UI");
     if(Id != null){
    	 %>
    	 <a href="logout.jsp"><img src="images/loginsss_03.gif" width="61" height="36" /></a>
    	 
    	 <%
     }else{
   	 %> 
   <a href="loginform.jsp"><img src="images/lloyd_05.gif" width="61" height="36" /></a>
     
          <%
          } %>
     <a href="memberApp.jsp"><img src="images/lloyd_06.gif" width="70" height="36" /></a>
    <%
     if(Id != null){
    	 %>
    	 <a href="cart.jsp"><img src="images/lloyd_07.gif" width="70" height="36" /></a>
    	 <%
     }
    	 %>
    	 <%
    	 if(Id == null){
    	 %>
    	 <a href="loginform.jsp"><img src="images/lloyd_07.gif" width="70" height="36" /></a>
    	 <%
     }
    	 %>
    	 <%
     if(Id != null){
    	 %>
    	 <a href="mypage.jsp"><img src="images/lloyd_08.gif" width="80" height="36" /></a>
    	 <%
     }
    	 %>
    	 <%
    	 if(Id == null){
    	 %>
    	 <a href="loginform.jsp"><img src="images/lloyd_08.gif" width="80" height="36" /></a>
    	 <%
     }
    	 %>
      <a href="qna.jsp"><img src="images/lloyd_093.gif" width="57" height="36" /></a> </div>
      
      
      <div id="logo"><a href="main.jsp"><img src="images/logo1.gif"></a></img></div>
      <div id="serchbox">
        <form id="form1" name="form1" method="post" action="search.jsp">
        <select name="keyfield">
                  		<option value="productName">상품명</option>
                  	</select>
          <input name="searchbox" type="text" id="searchbox" size="15" />
          <input type="image" name="search" id="search" onclick="searchForm(form); return false;"  
        	  value= "img" src ="images/lloyd2_03.gif"/>  
         
        </form>
      </div>
    </div>
     </div>
  <div id="page_main">
  <div id="title"> SHOPPING CART</div>
  <div id="content">
  <%      
           if(Id == null){
              response.sendRedirect("loginform.jsp");
           }else{
           String userId = Id;
           Connection conn = ConnectionProvider.getConnection();
           List<Cart> cartList = null;
           try {
              CartDao dao = new CartDao();
              cartList = dao.selectListById(conn, userId); 
           }catch(SQLException e) {}
           finally { JdbcUtil.close(conn);}
           
         %>
       
           
    <form action="order.jsp" method="post">    
    <div id="cartable"><table width="1000" border="1" cellspacing="0" cellpadding="3">
  <tr>
    
    <th width="300" scope="col" align="left">상품이름 </th>
    <th width="300" scope="col" align="left">상품이미지 </th>
    <th width="200" scope="col" align="center">선택사항</th>
    <th width="200" scope="col" align="center">가격</th>
    <th width="200" scope="col" align="center">수량</th>
    <th width="100" scope="col" align="center">삭제</th>
  </tr>
         <%
        int a = 0; 
        String[] name =new String[cartList.size()];
        String productName=null;
        Product product = null;
      	for(int i=0; i<cartList.size(); i++){
        Cart cart= cartList.get(i);
        productName = cart.getProductName();
        Connection conn1 = ConnectionProvider.getConnection();
        	try {
                 ProductDao dao = new ProductDao();
                 product = dao.selectByName(conn1, productName); 
       		}catch(SQLException e) {}
      		finally { 
           		JdbcUtil.close(conn1);
            }
            name[i] = product.getSmallImage();
     		}
   %>
  <c:forEach var ="cart" items="<%=cartList%>">
  <input type="hidden" name="productName" value="${cart.productName}"/>
  <tr>
    <td>${cart.productName}</td>
    <td><img src="itemimage/<%=name[a]%>"/></td>
    <td align="center">${cart.optionSum}</td>
    <td align="center">${cart.price}</td>
    <td align="center">
    <select name="count<%=a%>" id="count<%=a%>" >
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
      </select></td>
     <td><input type="button" onclick="location.href='cartDelete.jsp?cartId=${cart.cartId}'" value="삭제"/></td>
    </tr>
    
   <% a=a+1; %>
    </c:forEach>
    
</table>
      <%} %>
        </div>
      <div id="under">
      <a href="main.jsp"><img src="images/dd_03.png" /></a>
      <input name="order" type="image" src="images/dd_05.png" />
      </form></div>



    </div>
  </div>
 
  <div id="page_footer"> 
    <div id="companyinfo"><img src="images/DQWED_03.gif" width="390" height="125" /></div>
    <div id="bankinfo"><img src="images/DQWED_10.gif" width="170" height="125" /></div>
    <div id="callcenter"><img src="images/DQWED_13.gif" width="170" height="114" /></div>
    <div id="delivery"><img src="images/DQWED_06.gif" width="148" height="57" /></div>
   
  </div>

  <script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
  </script>
</body>
</html>