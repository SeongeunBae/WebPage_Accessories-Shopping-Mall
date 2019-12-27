<%@ page language="java" contentType="text/html; charset=utf-8"
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
	color: #390;
}
a:active {
	color: #000;
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


  <div id="page_main">
     <div id="title"> Q n A</div>
     <div id="content">
     <div class="qnamanu"><a href = "qnaResuit.jsp?qnaKind=pqna"><img src="images/QNAF_03.gif" width="130" height="70" /></a></div>
     <div class="qnamanu"><a href = "qnaResuit.jsp?qnaKind=ddqna"><img src="images/QNAF2_03.png" width="130" height="70" /></a></div>
     <div class="qnamanu"><a href = "qnaResuit.jsp?qnaKind=crqna"><img src="images/QNAF_06.gif" width="130" height="70" /></a></div>
     <div class="qnamanu"><a href = "qnaResuit.jsp?qnaKind=ccqna"><img src="images/QNAF_07.gif" width="130" height="70" /></a></div>
     <div class="qnamanu"><a href = "qnaResuit.jsp?qnaKind=oqna"><img src="images/QNAF_10.gif" width="130" height="70" /></a></div>
     <% if(Id != null){
    	 %>
    	 <div class="qnamanu"><a href="QnaRegister.jsp"><img src="images/QNAF_11.png" width="130" height="70" /></a></div>
    	 
    	 <%
     }else{
    	%>
    	<div class="qnamanu"><a href="loginform.jsp"><img src="images/QNAF_11.png" width="130" height="70" /></a></div>
    	<%
     }
     %>
    </div>
    
     <%
    	    
    		Connection conn = ConnectionProvider.getConnection();
        		  List<Qna> qnaList = null;
        		  String qnaKind=request.getParameter("qnaKind");
   			 try {
    		QnaDao dao = new QnaDao();
    		qnaList = dao.selectList(conn,qnaKind); 
    		}catch(SQLException e){ }
   			 finally {
				JdbcUtil.close(conn);
			}
		%>

     <div id="qnatable">
      <table width="900" border="1" cellpadding="3" cellspacing="0">
       <tr>
         <th width="60" scope="col">번호</th>
         <th width="628" scope="col">제목</th>
         <th width="80" scope="col">작성자</th>
         <th width="90" scope="col">작성일</th>
       </tr>
       <c:forEach var ="qna" items="<%=qnaList%>">
		<tr>
 		<td align="center">${qna.qnaId}</td>
 		<td><a href="QnaDetail.jsp?qnaId=${qna.qnaId}">${qna.qnaTitle}</a></td>
 		<td align="center">${qna.userId}</td>
 		<td align="center">${qna.registerTime}</td>
      </tr> 
      </c:forEach>
     </table>
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
</script>
</body>
</html>

