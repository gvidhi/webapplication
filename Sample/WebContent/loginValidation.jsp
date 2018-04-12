<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>	
<%
	try{
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbphyresearchrecord","root","");
		PreparedStatement pst = conn.prepareStatement("SELECT Email, Password FROM tblUser WHERE Email=? and password=?");
		pst.setString(1, email);
		pst.setString(2, password);
		ResultSet rs = pst.executeQuery();
		if(rs.next())
			request.getAttribute("#");
		else
			out.println("Invalid login credentials");
	}
	
	catch(Exception e){
		out.println("Something went wrong..!! Please try again");
	}
response.sendRedirect("homePage.jsp");
%>