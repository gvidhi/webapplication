<%@page import="java.sql.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>

<%

	String inlineFormCustomSelect=request.getParameter("inlineFormCustomSelect");
	System.out.println(inlineFormCustomSelect);
	String searchfield=request.getParameter("searchfield");
	String Fromyear = request.getParameter("Fromyear");
	String Toyear = request.getParameter("Toyear");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbphyresearchrecord","root","");
	PreparedStatement st=null;
	ResultSet rs=null;
	boolean flag=false;
	String BetQuery="";
	String FQuery="";
	String LQuery="";
	String rTitle="";
	
	

  if(Fromyear.isEmpty() && Toyear.isEmpty())
	{
	 
	}
  else
   	{
		 BetQuery = " Ryear BETWEEN '"+Fromyear+"' AND '"+Toyear+"' ";
		 System.out.println("betquery"+BetQuery);	
	}
	if(inlineFormCustomSelect.equalsIgnoreCase("Firstname"))
	{
		
		FQuery = " Author LIKE '%"+searchfield+"%'";
		
		if(BetQuery.isEmpty())
		{
			st=con.prepareStatement("SELECT * FROM tblresearch where "+FQuery);
			rs=st.executeQuery();
			flag=true;
		}
		else
		{
			st=con.prepareStatement("SELECT * FROM tblresearch where "+FQuery+"And"+BetQuery);
			rs=st.executeQuery();
			flag=true;
		}
		
	}

%>
			
<%
	if(flag==true)
			{
	while(rs.next())
			
		{
			
			%>
			<div class="Container">
			<table border="2" bordercolor="#2494b7">
			
			<tr>
				
				<th>UserId</th>
				
				<th>UCID</th>
			
				<th>Firstname</th>
				
				<th>Lastname</th>
				
				<th>Email</th>
				
				<th>Password</th>
				
				<th>Cdate</th>
			
			</tr>
			
			<tr>
			
				<td><%=rs.getString(1)%></td>
				
				<td><%=rs.getString(2)%></td>
				
				<td><%=rs.getString(3)%></td>
				
				<td><%=rs.getString(4)%></td>
				
				<td><%=rs.getString(5)%></td>
				
				<td><%=rs.getString(6)%></td>
			
			</tr>
			
			</table>
			
			<%
		}
	}
			
%>