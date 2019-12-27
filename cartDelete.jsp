<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="my.model.*,my.dao.*,my.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
        	int cartId = Integer.parseInt(request.getParameter("cartId"));
        	Connection conn = ConnectionProvider.getConnection();
        	Cart cart = new Cart();
        	try {
        		CartDao dao = new CartDao();
        		dao.deleteById(conn, cartId);  
        	}catch(SQLException e) {}
        	finally { 
        		JdbcUtil.close(conn);
        		}
        	response.sendRedirect("cart.jsp");
        %>
</body>
</html>