<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%request.setCharacterEncoding("utf-8"); %>
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

 <div id ="page_main">
 
 <%
   String phoneNum1 = request.getParameter("phoneNum1");
   String pN2 = request.getParameter("phoneNum2");
   String pN3 = request.getParameter("phoneNum3");
   String userId= request.getParameter("userId");
   String password = request.getParameter("password");
   String userName = request.getParameter("userName");
   String email1 = request.getParameter("email1");
   String email2 = request.getParameter("email2");
   String gender = request.getParameter("gender");
   int year = Integer.parseInt(request.getParameter("year"));
   int month = Integer.parseInt(request.getParameter("month"));
   int date = Integer.parseInt(request.getParameter("date")); 
   String sample6_postcode = request.getParameter("sample6_postcode");
   String sample6_address = request.getParameter("sample6_address");
   String daddress = request.getParameter("daddress");
   String admitEmail= request.getParameter("admitEmail");
  
   
	if(pN2==null && pN2.equals("")){
  	  	%>
  	  	<script type = "text/javascript">
  	  	alert("휴대전화를 입력해주세요.");
  	  	history.go(-1);
  	  	break;
  	 	</script>
  	 	
  	 	<%
	}else if(pN2.equals("")==true){
	  	%>
	  	<script type = "text/javascript">
			alert("휴대전화를 입력해주세요.");
			history.go(-1);
			</script>
			
  	  <%
	}else if(pN3.equals("")==true){
	  	%>
	  	<script type = "text/javascript">
			alert("휴대전화를 입력해주세요.");
			history.go(-1);
			</script>
			
	  <%
  	  }else if(userId == null && userId.equals("")){
    	%>
    	<script type = "text/javascript">
    	alert("아이디를 입력해주세요.");
    	history.go(-1);
    	break;
    	</script>
    	
    	<%
	}else if(userId.equals("")==true){
	  	%>
	  	<script type = "text/javascript">
			alert("아이디를 입력해주세요.");
			history.go(-1);
			</script>
			
			
     <%
  	}else if(password==null && password.equals("")){
  	  %>
  	  <script type = "text/javascript">
  	  alert("비밀번호를 입력해주세요.");
  	  history.go(-1);
  	  break;
  	  </script>
  	  
  	  
  	  <%
	}else if(password.equals("")==true){
	  	%>
	  	<script type = "text/javascript">
			alert("비밀번호를 입력해주세요.");
			history.go(-1);
			</script>
			
			
  	  <%
  	}else if(userName==null && userName.equals("")){
  	  %>
  	  <script type = "text/javascript">
  	  alert("이름을 입력해주세요.");
  	  history.go(-1);
  	  break;
  	  </script>
  	  
  	  <%
	}else if(userName.equals("")==true){
	  	%>
	  	<script type = "text/javascript">
			alert("이름을 입력해주세요.");
			history.go(-1);
			</script>
			
			
  	  <%
  	}else if(email1==null && email1.equals("")){
  	  %>
  	  <script type = "text/javascript">
  	  alert("이메일을 입력해주세요.");
  	  history.go(-1);
  	  break;
  	  </script>
  	  
  	  <%
	}else if(email1.equals("")==true){
	  	%>
	  	<script type = "text/javascript">
			alert("이메일을 입력해주세요.");
			history.go(-1);
			</script>
			
			
  	  <%
  	}else if(email2==null && email2.equals("")){
  	  %>
  	  <script type = "text/javascript">
  	  alert("이메일을 입력해주세요.");
  	  history.go(-1);
  	  break;
  	  </script>
  	  
  	  <%
	}else if(email2.equals("")==true){
	  	%>
	  	<script type = "text/javascript">
			alert("이메일을 입력해주세요.");
			history.go(-1);
			</script>
			
			
  	  <%
  	}else if(gender==null && gender.equals("")){
  	  %>
  	  <script type = "text/javascript">
  	  alert("성별을 선택해주세요.");
  	  history.go(-1);
  	  break;
  	  </script>
  	  
  	  <%
  	}else if(gender.equals("")==true){
	  	%>
	  	<script type = "text/javascript">
			alert("성별을 선택해주세요.");
			history.go(-1);
			</script>
			
		 <% }else{
			 	int phoneNum2 = Integer.parseInt(pN2);
			  	int phoneNum3 = Integer.parseInt(pN3);
			  	    Member member = new Member(phoneNum1,phoneNum2,phoneNum3,userId,password,userName,email1,email2,gender,year,month,date,sample6_postcode,sample6_address,daddress,admitEmail,new java.util.Date());
			  	    Connection conn = ConnectionProvider.getConnection();
			  	    try {
			  	    	MemberDao dao = new MemberDao(); 
			  	    	dao.insert(conn, member); 
			  	    }catch(SQLException e){ }
			  	    finally {
			  			JdbcUtil.close(conn);
			  		}
			 
		 }
		 %>
		 
 회원가입 되었습니다. 축하드립니다.
 
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