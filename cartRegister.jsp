<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.model.*,my.dao.*,my.util.*,java.sql.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%   
request.setCharacterEncoding("utf-8");
String Id = (String)session.getAttribute("UI");
if(Id == null){
	response.sendRedirect("loginform.jsp");
}
if(Id != null){
String userId = Id;
String optionValue1 = request.getParameter("optionValue1");
String optionValue2 = request.getParameter("optionValue2");
String optionValue3 = request.getParameter("optionValue3");
String optionSum="없음";

if(optionValue1 != null && !optionValue1.equals("")){
     optionSum=optionValue1;
}
if(optionValue2 != null && !optionValue2.equals("")){
     optionSum=optionValue1+"/"+optionValue2;
}
if(optionValue3 != null && !optionValue3.equals("")){
	optionSum=optionValue1+"/"+optionValue2+"/"+optionValue3;
}
String productName = request.getParameter("productName");
int price = Integer.parseInt(request.getParameter("price"));
Cart cart = new Cart(userId,productName,optionSum,price);
Connection conn = ConnectionProvider.getConnection();
try {
	CartDao dao = new CartDao(); 
	dao.insert(conn, cart); 
}catch(SQLException e){ }
finally {
	JdbcUtil.close(conn);
}
response.sendRedirect("cart.jsp");
}
%>

</body>
</html>
