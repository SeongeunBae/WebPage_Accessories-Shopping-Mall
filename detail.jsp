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
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<script>
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
    	 <a href="mp.jsp"><img src="images/lloyd_08.gif" width="80" height="36" /></a>
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
     
    
      <div id="logo"><a href="main.jsp"><img src="images/logo1.gif"/></a></div>
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
    
    <div id="pannel">
      <div id="pannel_content">
        <ul id="MenuBar1" class="MenuBarHorizontal">
          <li><a href="new.jsp">NEW</a></li>
          <li><a href="best.jsp">BEST</a></li>
          <li><a class="MenuBarItemSubmenu" href="ex4.jsp?pdkind=WATCH">WATCH</a>
            <ul>
              <li><a href="ex3.jsp?pdDkind=METAL">METAL</a></li>
              <li><a href="ex3.jsp?pdDkind=LEATHER">LEATHER</a></li>
            </ul>
          </li>
          <li><a href="ex4.jsp?pdkind=NECKLACE" class="MenuBarItemSubmenu">NECKLACE</a>
            <ul>
              <li><a href="ex3.jsp?pdDkind=CHAIN">CHAIN</a></li>
              <li><a href="ex3.jsp?pdDkind=PENDANT">PENDANT</a></li>
            </ul>
          </li>
          <li><a href="ex4.jsp?pdkind=EARRING" class="MenuBarItemSubmenu">EARRING</a>
            <ul>
              <li><a href="ex3.jsp?pdDkind=ONETOUCH">ONETOUCH</a></li>
              <li><a href="ex3.jsp?pdDkind=PIERCING">PIERCING</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
    </div>

  <div id = "page_main">
   <%       int productId = Integer.parseInt(request.getParameter("productId"));
           Connection conn = ConnectionProvider.getConnection();
           Product product = null;
           try {
              ProductDao dao = new ProductDao();
              dao.updateAccessCount(conn, productId);
              product = dao.selectById(conn,productId);
           }catch(SQLException e){ }
           finally {
              JdbcUtil.close(conn);
           }
           String optionName1 =product.getOptionName1();
           String optionName2 = product.getOptionName2() ;
           String optionName3 =product.getOptionName3();
        %>
       <form id="form2" name="form2" method="post" action="cartRegister.jsp" onsubmit="send()" >
       <c:set var = "product" value ="<%=product%>"/>
       <input type="hidden" name="productName" id="productName" value="${product.productName}"/>
         <input type="hidden" name="price" id="price" value="${product.price}"/>
          <input type="hidden" name="productId" id="productId" value="${product.productId}"/>
    <div id="detailimage"><img src="itemimage/${product.bigImage}"/></div>
    <div id="detailinfo">
      <div id="detailname">${product.productName}</div>
     
      판매가 &nbsp;&nbsp;&nbsp;<strong>${product.price}</strong><br>
      적립금 &nbsp;&nbsp;&nbsp;<strong>${product.reserve}</strong><br>
      제조국 &nbsp;&nbsp;&nbsp;<strong>${product.makeCountry}</strong><br>
      배송비 &nbsp;&nbsp;&nbsp;<strong>2500원</strong>
<p>
   <%
   String optionSum = null;
   if(optionName1 != null && !optionName1.equals("")){
      String str = product.getOptionValue1();
      String[] txtArr = str.split("/") ;
   %>
         ${product.optionName1}&nbsp;&nbsp;&nbsp;&nbsp;
         <select name="optionValue1" id="optionValue1">
      <%
         for(int i=0; i < txtArr.length; i++){
      %>
         <option value="<%=txtArr[i]%>"><%=txtArr[i]%></option>
      <%
         }
      %>
         </select>
      <%
   
      
      
         }
      %>
   <%
   if(optionName2 != null && !optionName2.equals("")){
      String str2 = product.getOptionValue2();
      String[] txtArr = str2.split("/") ;
   %>
         <p>${product.optionName2}&nbsp;&nbsp;&nbsp;&nbsp;
         <select name="optionValue2" id="optionValue2">
      <%
         for(int i=0; i < txtArr.length; i++){
      %>
         <option value="<%=txtArr[i]%>"><%=txtArr[i]%></option>
      <%
         }
      %>
      </select>
      <%
      
         }
      %>   
      <%
      if(optionName3 != null && !optionName3.equals("")){
      String str3 = product.getOptionValue3();
      String[] txtArr = str3.split("/") ;
   %>
         <p>
         ${product.optionName3}&nbsp;&nbsp;&nbsp;&nbsp;
         <select name="optionValue3" id="optionValue3">
      <%
         for(int i=0; i < txtArr.length; i++){
      %>
         <option value="<%=txtArr[i]%>"><%=txtArr[i]%></option>
      <%
         }
      %>
      </select>
      <%
      }
      %>   <p>
      수량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <select name="count" id="count">
         <option value="1">1</option>   
         <option value="2">2</option>   
         <option value="3">3</option>   
         <option value="4">4</option>   
         <option value="5">5</option>   
         <option value="6">6</option>   
         <option value="7">7</option>   
         <option value="8">8</option>   
         <option value="9">9</option>   
         </select>
   

        
<div id="detailorder">      
    </div> -3만원 이상 주문 시 무료배송<br />
        -주문일로부터 3~4일이내(주말 및공휴일 제외)배송됩니다
     <p align="right">상품금액 </p>
     <div class="redprice">${product.price}원</div><p></p><br />
    <p align="center">
    <input type="hidden" id="form_flag"/>
    <% if(Id == null){
    	%>
    	<input onclick="setsubmit3()" type="image" name="submit1" id="submit1"  src="images/cxvvfd_03.png"  width="100" height="32"/></a>  
     	<input onclick="setsubmit4()" type="image" name="submit2" id="submit2"  src="images/cxvvfd_05.png"  width="100" height="32"/></a></p>  
    	<% 
    }
    %>
   <%  if(Id != null){%>
     <input onclick="setsubmit1()" type="image" name="submit1" id="submit1"  src="images/cxvvfd_03.png"  width="100" height="32"/></a>  
     <input onclick="setsubmit2()" type="image" name="submit2" id="submit2"  src="images/cxvvfd_05.png"  width="100" height="32"/></a></p>  
   <% }%>
    </p></div>
    </form>   
    <div id="detaildetail">
      <div id="TabbedPanels1" class="TabbedPanels">
        <ul class="TabbedPanelsTabGroup">
          <li class="TabbedPanelsTab" >상품상세정보</li>
<li class="TabbedPanelsTab" >배송/교환/반품</li>
        </ul>
        <div class="TabbedPanelsContentGroup">
          <div class="TabbedPanelsContent"><img src="itemimage/${product.detailImage1}"/><img src="itemimage/${product.detailImage2}"/></div>
<div class="TabbedPanelsContent"><img src = "images/deliver.PNG"></img></div>
        </div>
      </div>
    </div>
  </div>
    <div id="page_footer"> 
    <div id="companyinfo"><img src="images/DQWED_03.gif" width="390" height="125" /></div>
    <div id="bankinfo"><img src="images/DQWED_10.gif" width="170" height="125" /></div>
    <div id="callcenter"><img src="images/DQWED_13.gif" width="170" height="114" /></div>
    <div id="delivery"><img src="images/DQWED_06.gif" width="148" height="57" /></div>
   </div>
  </div>
  
  <script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
  </script>
  <script>
   var flag= document.getElementById('form_flag')
    function addProduct(){
    
    }
    function send(){
       var form=document.getElementById('form2')
       form.setAttribute("action",flag.value)
    }
    function setsubmit1(){
       flag.value = "order2.jsp"
    }
   function setsubmit2(){
      flag.value = "cartRegister.jsp"
    }
   function setsubmit3(){
       flag.value = "loginform.jsp"
    }
   function setsubmit4(){
      flag.value = "loginform.jsp"
    }
    </script>
   
</body>
</html>