<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>


<%

			String firstname=request.getParameter("Firstname");
			
			String lastname=request.getParameter("Lastname");
			
			String email=request.getParameter("Email");
			
			String password=request.getParameter("Password");
			String ucid=request.getParameter("UCID");
			
			String Confirmpassword=request.getParameter("Confirmpassword");
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection
			("jdbc:mysql://localhost:3306/dbphyresearchrecord","root","");
			
			Date date = new Date();
			
			Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String s = formatter.format(date);
			
			Statement st=con.createStatement();
			
			String sql="insert into tbluser(Firstname, Lastname, UCID, Email, Password, Cdate)"
					+ "values('"+firstname+"', '"+lastname+"', '"+ucid+"', '"+email+"', '"+password+"', '"+s+"')";
			int flag=st.executeUpdate(sql);
			
			if(flag==1)
			
			{
			
			out.println("Added!");
			
			}
			
			else
			
			{
			
			out.println("Failed");
				
			}
			
			response.sendRedirect("login.jsp");
			
			%>