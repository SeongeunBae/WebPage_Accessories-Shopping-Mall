<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="my.model.*,my.dao.*,my.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>등록페이지</title>
<link href="mainlayout.css" rel="stylesheet" type="text/css" />
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<link href="registerstyle.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
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
      
      function categoryChange(e) {
    	  var good_watch = ["METAL", "LEATHER"];
    	  var good_necklace = ["NECKLACE","CHAIN","PENDANT"];
    	  var good_earring = ["EARRING","ONETOUCH","PIERCING"];
    	  var target = document.getElementById("pdDkind");
    	 
    	  if(e.value == "WATCH") var d = good_watch;
    	  else if(e.value == "NECKLACE") var d = good_necklace;
    	  else if(e.value == "EARRING") var d = good_earring;
    	 
    	  target.options.length = 0;
    	 
    	  for (x in d) {
    	    var opt = document.createElement("option");
    	    opt.value = d[x];
    	    opt.innerHTML = d[x];
    	    target.appendChild(opt);
    	  } 
    	}
		 function option(e) {
			 }
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
     
    
      <div id="logo"><a href="adminmainpg.jsp"><img src="images/logo1.gif"/></a></div>
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
 <p class="center"> 제품등록</p>
    <form action="ex.jsp" method="post" enctype="multipart/form-data" name="form2" id="form2">
      <table width="1000" border="1">
        <tr>
          <th scope="row">상품 종류</th>
          <td colspan="3"><label for="kind"></label>
            <select name="pdKind" id="pdKind" onchange = "categoryChange(this)">
              <option>분류선택</option>
              <option value="WATCH">WATCH</option>
              <option value="NECKLACE">NECKLACE</option>
              <option value="EARRING">EARRING</option>
            </select>&nbsp;
          <select name="pdDkind" id="pdDkind">
            <option>상세분류선택</option>
          </select></td>
        </tr>
        <tr>
          <th width="89" scope="row">상품명</th>
          <td colspan="3"><label for="productName"></label>
          <input name="productName" type="text" id="productName" size="50" /></td>
        </tr>
        <tr>
          <th scope="row">판매가</th>
          <td colspan="3"><label for="price"></label>
          <input name="price" type="text" id="price"  size="50" /></td>
        </tr>
        <tr>
          <th height="37" scope="row">적립금</th>
          <td colspan="3"><label for="reserve"></label>
          <input name="reserve" type="text" id="reserve"  size="50" /></td>
        </tr>
        <tr>
          <th scope="row">제조국</th>
          <td colspan="3"><label for="makeCountry"></label>
          <input name="makeCountry" type="text" id="makeCountry" size="50" /></td>
        </tr>
        <tr>
          <th scope="row">옵션명</th>
          <td width="168"><label for="optionName1"></label>
          <input type="text" name="optionName1" id="optionName1" /></td>
          <th width="65">옵션값</th>
          <td width="650"><label for="optionValue1"></label>
          <input name="optionValue1" type="text" id="optionValue1" size="90" /></td>
        </tr>
          <tr>
          <th scope="row">옵션명</th>
          <td width="168"><label for="optionName2"></label>
            <input type="text" name="optionName2" id="optionName2" /></td>
          <th width="65">옵션값</th>
          <td width="650"><label for="optionValue2"></label>
            <input name="optionValue2" type="text" id="optionValue2" size="90"  /></td>
        </tr>
          <tr>
          <th scope="row">옵션명</th>
          <td width="168"><label for="optionName3"></label>
            <input type="text" name="optionName3" id="optionName3" /></td>
          <th width="65">옵션값</th>
          <td width="650"><label for="optionValue3"></label>
            <input name="optionValue3" type="text" id="optionValue3" size="90" /></td>
        </tr>
         <tr>
            <th colspan="4" scope="row" align = "center">옵션값 입력 시 옵션값의 구분은 사선(/)으로 합니다.( 예 : 빨간색/노란색/흰색 )</th>
          </tr>
        <tr>
          <th scope="row">작은이미지</th>
          <td colspan="3"><label for="smallImage"></label>
            <input type="file" name="smallImage" id="smallImage" />
            </td>            
        </tr>
        <tr>
          <th scope="row">큰이미지</th>
          <td colspan="3"><label for="bigImage"></label>
            <input type="file" name="bigImage" id="bigImage" />            
          </td>
        </tr>
         <tr>
          <th scope="row">상품상세이미지1</th>
          <td colspan="3"><label for="detailImage1"></label>
            <input type="file" name="detailImage1" id="detailImage1" />            
           </td>
        </tr>
         <tr>
          <th scope="row">상품상세이미지2</th>
          <td colspan="3"><label for="detailImage2"></label>
            <input type="file" name="detailImage2" id="detailImage2" />            
           </td>
        </tr>
         <tr>
          <th align = "center" colspan="4" scope="row"><label for="detail"></label>            
           <input type="submit" name="register" id="register" value="등록" style="width:100pt; height:18pt; background-color:#00381D" />    </th>
           
        </tr>
      </table>
    </form>
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
