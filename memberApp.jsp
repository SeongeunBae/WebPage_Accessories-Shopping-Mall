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
    <div id="memberApp">
    <div id="title">JOIN</div>
      <p><img src="images/lloydjoin2.gif" width="105" height="37" /></p>  
      <div id="list"><span class="list">*</span>필수 항목 입력</div>
    </div> 
    
    <div id="mainMemberApp">
    
    <form id="form2" name="form2" method="post" action="ex2.jsp">
    
      <table width="1000" height="640" border="1" cellpadding="3" cellspacing="0">
      
        <tr>
          <th width="122" height="46" bgcolor="#eeeeee" scope="row">휴대폰 번호 <span class="list">*</span></th>
          <td width="560">
            <select name="phoneNum1" id="phoneNum1">
              <option value="010">010</option>
              <option value="011">011</option>
              <option value="016">016</option>
              <option value="017">017</option>
            </select>
            -
            
            <span>
            <input type="number" name="phoneNum2" id="phoneNum2" class="input-text" placeholder="휴대폰번호" maxlength="20" onfocusout="validatePhoneNum2()" />
            </span>
            
            -
			 <span>
            <input type="number" name="phoneNum3" id="phoneNum3" class="input-text" placeholder="휴대폰번호" maxlength="20" onfocusout="validatePhoneNum3()" />		
			</span>
			
			<div id="phoneNum2_alert" class="alert"></div>
			<div id="phoneNum3_alert" class="alert"></div>
			
          </td>
        </tr>
        
        
        
        
        <tr>
        <th bgcolor="#eeeeee" scope="row">아이디<span class="list"> *</span></th>
					<td>
					
						<span>
							<input type="text" id="userId" name="userId" class="input-text" placeholder="아이디" maxlength="20" onfocusout="validateUserId()"/>
						</span>
						<div id="userId_alert" class="alert">공백없이 4~16자의 영문/숫자를 조합하여 입력해주세요.</div>
					</td>
		</tr>
        
        <tr>
          <th bgcolor="#eeeeee" scope="row">비밀번호 <span class="list">*</span></th>
          <td>
          <span>
               <input type="password" name="password" id="password" class="input-text" placeholder="비밀번호" maxlength="20" onfocusout="validatePassword()"/>
    	  </span>      
    	  <div id="password_alert" class="alert"> 공백없이 8~15자의 영문/숫자를 조합하여 입력해주세요.</div>
         </td>
        </tr>
        <tr>
          <th bgcolor="#eeeeee" scope="row">비밀번호 확인 <span class="list">*</span></th>
          <td>
            <span>
            <input type="password2" name="password2" id="password2" class="input-text" placeholder="비밀번호" maxlength="20" onfocusout="validatePassword2()" />
            </span>      
              <div id="password2_alert" class="alert"> 비밀번호 확인을 위해 다시 한 번 입력해주세요.</div>
         
          </td>
        </tr>
        
        
        
        
        
        <tr>
          <th bgcolor="#eeeeee" scope="row">이름 <span class="list">*</span></th>
          <td>
          	<span>
            	<input type="text" name="userName" id="userName" class="input-text" placeholder="이름" maxlength="20" onfocusout="validateUserName()"/>
           	</span>
          <div id="userName_alert" class="alert"></div>
        </td>
        </tr>
        
        
        
        
        <tr>
          <th bgcolor="#eeeeee" scope="row">이메일 <span class="list">*</span></th>
          <td>
           <div>
            <input type="text" name="email1" id="email1" class="input-text" placeholder="이메일" maxlength="20" onfocusout="validateEmail1()"/>
            @
            <input type="text" name="email2" id="email2" class="input-text" placeholder="이메일" maxlength="20" onfocusout="validateEmail2()" />
            <span id="email1_alert" class="alert"></span>
            <span id="email2_alert" class="alert"></span>
            </div>
            
            <select name="email3" id="email3"  onchange="hotinsert(this.value)">
              <option selected="selected">직접입력</option>
              <option value="naver.com" onclick="hotinsert('naver.com')">naver.com</option>
              <option value="hanmail.net"  onclick="hotinsert('hanmail.net')">hanmail.net</option>
              <option value="nate.com"  onclick="hotinsert('nate.com')">nate.com</option>
            </select>
          </td>
        </tr>
        <tr>
          <th bgcolor="#eeeeee" scope="row">성별 <span class="list">*</span></th>
          <td><p>
            <label>
              <input type="radio" name="gender" value="남성" id="gender_0" />
              남성</label>
            <label>
              <input type="radio" name="gender" value="여성" id="gender_1" />
              여성
          </label>
            <br />
          </p></td>
        </tr>
        
        
        
        <tr>
          <th bgcolor="#eeeeee" scope="row">생일 <span class="list"></span></th>
          <td>
            <select name="year" id="year">
            
            <option value="1984">1984</option>
            <option value="1985">1985</option>
            <option value="1986">1986</option>
            <option value="1987">1987</option>
            <option value="1988">1988</option>
            <option value="1989">1989</option>
            <option value="1990">1990</option>
            <option value="1991">1991</option>
            <option value="1992">1992</option>
            <option value="1993">1993</option>
            <option value="1994">1994</option>
            <option value="1995">1995</option>
            <option value="1996">1996</option>
            <option value="1997">1997</option>
            <option value="1998">1998</option>
            <option value="1999">1999</option>
            <option value="2000">2000</option>
            <option value="2001">2001</option>
            <option value="2002">2002</option>
            <option value="2003">2003</option>
            <option value="2004">2004</option>
            </select>
            년
            <label for="month"></label>
            <select name="month" id="month">
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
              <option value="11">11</option>
              <option value="12">12</option>
              
            </select>
            월
            <label for="date"></label>
            <select name="date" id="date">
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
              <option value="11">11</option>
              <option value="12">12</option>
              </select>
            일  주민등록 상 생년월일을 입력해주세요.
          </td>
        </tr>
        
       
        <tr>
          <th bgcolor="#eeeeee" scope="row">주소</th>
          <td>
            <p>
  <input type="text" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호"/>
  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/><br></br>
  <input type="text" name="sample6_address" id="sample6_address" placeholder="주소"/>
              
              <input type="text" name="daddress" id="daddress" />
            </p>
          </td>
          </tr>
        <tr>
          <th bgcolor="#eeeeee" scope="row">이메일</th>
          <td>TOPAZ 의 정보를 받아보시겠습니까? &nbsp;이메일: 
                <input type="radio" name="admitEmail" value="예" id="admitEmail_0" />
                예
                <input type="radio" name="admitEmail" value="아니요" id="admitEmail_1" />
              아니요
              </td>
        </tr>
      </table>
      <br/>

      
      
    <input name="join" type="image" src="images/lloydjoin3.gif" />
    <a href="#"><img src="images/lloydjoin4.gif" width="249" height="47" />
            </a>
    </form>
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
                document.getElementById('daddress').focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">
	
function validatePhoneNum2() {
	var phoneNum2 = document.getElementById('phoneNum2').value.trim();
	var alertEl = document.getElementById('phoneNum2_alert');

	
	// 입력 여부 검증
	if (phoneNum2.length == 0) {
		alertEl.innerHTML = '필수 정보입니다.';
		alertEl.style.display = 'block';
		
		return false;

	}
	//  숫자 입력 검증
	if (!/^[A-Za-z!?#$%]*$/.test(phoneNum2)) {
		alertEl.innerHTML = '';
		alertEl.style.display = 'block';
		
		return false;
	}
	
	alertEl.style.display = 'none';
}

function validatePhoneNum3() {
	var phoneNum3 = document.getElementById('phoneNum3').value.trim();
	var alertEl = document.getElementById('phoneNum3_alert');

	
	// 입력 여부 검증
	if (phoneNum3.length == 0) {
		alertEl.innerHTML = '';
		alertEl.style.display = 'block';
		
		return false;

	}
	//  숫자 입력 검증
	if (!/^[A-Za-z!?#$%]*$/.test(phoneNum3)) {
		alertEl.innerHTML = '';
		alertEl.style.display = 'block';
		
		return false;
	}
	
	alertEl.style.display = 'none';
}

	
	
	
	
	
	
	
	function validateUserId() {
		var userId = document.getElementById('userId').value.trim();
		var alertEl = document.getElementById('userId_alert');
		
		// 입력 여부 검증
		if (userId.length == 0) {
			alertEl.innerHTML = '필수 정보입니다.';
			alertEl.style.display = 'block';
			
			return false;

		}
		
		// 길이 검증
		if (userId.length < 5) {
			alertEl.innerHTML = '아이디는 4글자 이상 입력해주세요.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		// 대소문자, 숫자 입력 검증
		if (!/^[A-Za-z0-9]*$/.test(userId)) {
			alertEl.innerHTML = '아이디는 영문 대문자,소문자, 숫자만 입력 가능합니다.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		alertEl.style.display = 'none';
	}
	
	
	
	
	
	
	
	function validatePassword() {
		var password = document.getElementById('password').value.trim();
		var alertEl = document.getElementById('password_alert');
		
		// 비밀번호 입력 여부 검증
		if (password.length == 0) {
			alertEl.innerHTML = '필수 정보입니다.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		// 비밀번호 길이 검증
		if (password.length < 5) {
			alertEl.innerHTML = '비밀번호는 5글자 이상 입력해주세요.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		// 비밀번호 대소문자, 숫자 입력 검증
		if (!/^[A-Za-z0-9!?#$%]*$/.test(password)) {
			alertEl.innerHTML = '비밀번호는 영문 대문자,소문자, 숫자만 입력 가능합니다.';
			alertEl.style.display = 'block';
			
			return false;
		}
		alertEl.style.display = 'none';
	}
		
		
	
function validatePassword2() 
{
	var password = document.getElementById('password').value.trim();
	var password2 = document.getElementById('password2').value.trim();
	var alertEl = document.getElementById('password2_alert');

	
	// 비밀번호 길이 검증
	if (password2.length < 5) {
		alertEl.innerHTML = '비밀번호는 5글자 이상 입력해주세요.';
		alertEl.style.display = 'block';
		
		return false;
	}
	
	// 비밀번호 대소문자, 숫자 입력 검증
	if (!/^[A-Za-z0-9!?#$%]*$/.test(password2)) {
		alertEl.innerHTML = '비밀번호는 영문 대문자,소문자, 숫자만 입력 가능합니다.';
		alertEl.style.display = 'block';
		
		return false;
	}
	
	
	// 비밀번호, 비밀번호 확인 검증
	if (password != password2) {
		alertEl.innerHTML = '비밀번호가 일치하지 않습니다.';
		alertEl.style.display = 'block';
		
		return false;
	}
	
	alertEl.style.display = 'none';
}

	
	
	
	
	function validateUserName() {
		var userName = document.getElementById('userName').value.trim();
		var alertEl = document.getElementById('userName_alert');
		
		// 입력 여부 검증
		if (userName.length == 0) {
			alertEl.innerHTML = '필수 정보입니다.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		alertEl.style.display = 'none';
	}
	
	
	
	
	function validateEmail1() {
		var email1 = document.getElementById('email1').value.trim();
		var alertEl = document.getElementById('email1_alert');

		
		// 입력 여부 검증
		if (email1.length == 0) {
			alertEl.innerHTML = '필수정보 입니다.';
			alertEl.style.display = 'inline';
			
			return false;

		}
	}	
		
		function validateEmail2() {
			var email2 = document.getElementById('email2').value.trim();
			var alertEl = document.getElementById('email2_alert');

			
			// 입력 여부 검증
			if (email2.length == 0) {
				alertEl.innerHTML = ' ';
				alertEl.style.display = 'inline';
				
				return false;

			}
		}
	
		
	
	
	function validateBirth() {
		var birthYear = document.getElementById('birth_year').value.trim();
		var birthDay = document.getElementById('birth_day').value.trim();
		var alertEl = document.getElementById('birth_alert');
		
		if (birthYear.length == 0) {
			alertEl.innerHTML = '태어난 년도 4자리를 입력해주세요.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		if (birthDay.length == 0) {
			alertEl.innerHTML = '태어난 일자를 입력해주세요.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		if (!/^[0-9]*$/.test(birthYear)) {
			birth_alert.innerHTML = '태어난 년도는 숫자만 입력 가능합니다.';
			birth_alert.style.display = 'block';
			
			return false;
		}
		
		if (!/^[0-9]*$/.test(birthDay)) {
			birth_alert.innerHTML = '태어난 일자는 숫자만 입력 가능합니다.';
			birth_alert.style.display = 'block';
			
			return false;
		}
		
		alertEl.style.display = 'none';
	}
	
	function hotinsert( param )
	{
		var input = document.getElementById('email2')
		input.value=param
	}
</script>	
</body>
</html>