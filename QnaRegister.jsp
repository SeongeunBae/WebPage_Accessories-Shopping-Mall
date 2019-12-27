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
<title></title>
<link href="mainlayout.css" rel="stylesheet" type="text/css" />
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
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
    <p><strong>문의작성</strong></p>
   
    
   <form action="qnaEx.jsp" method="post" enctype="multipart/form-data" name="form2" id="form2">
     <table width="1000" border="1" cellspacing="0" cellpadding="10">
      <tr>
        <th scope="row">문의 분류</th>
        <td>
          <select name="qnaKind">
            <option value="pqna">상품문의</option>
            <option value="ddqna">배송/입금문의</option>
            <option value="crqna">교환/반품문의</option>
            <option value="ccqna">취소/변경문의</option>
            <option value="oqna">기타문의</option>
          </select> 
 
         </td>
      </tr>
      <tr>
        <th width="200" scope="row">제목</th>
        <td width="800"><label for="qnaTitle"></label>
         <input name="qnaTitle" type="text" id="qnaTitle" size="70"/>
         </td>
      </tr>
      <tr>
      <th>내용</th>
      <td>
          <textarea name="qnaMain" id="qnaMain" cols="120" rows="20"></textarea>
      </td>
      </tr>
      <tr>
        <th scope="row">파일 첨부</th>
        <td><label for="femail"></label>
          <input type="file" name="qnaImage" id="qnaImage" /></td>
      </tr>
        <th colspan="2" align="center">
        <input name="join" type="image" src="images/lloydjoin3.gif" /></a>
    <a href="qna.html"><img src="images/lloydjoin4.gif" width="249" height="47" /></a>
    </th>
      </table> 
    </form>
   </div>
     
    <p>&nbsp;</p>
    
</div>
    <p>&nbsp;</p>
    
  

  
  
  
  
 
  <div id="page_footer"> 
    <div id="companyinfo"><img src="images/DQWED_03.gif" width="390" height="125" /></div>
    <div id="bankinfo"><img src="images/DQWED_10.gif" width="170" height="125" /></div>
    <div id="callcenter"></div>
    <img src="images/DQWED_13.gif" width="170" height="114" />
    <div id="delivery"><img src="images/DQWED_06.gif" width="148" height="57" /></div>
   
  </div>

  <script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
</body>
</html>