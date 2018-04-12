<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Home Page</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="">
	</head>
	<body>
		<div class="col-sm-12">
		<div class="container">		
			<form class="form-inline" action="homePage.jsp" method="POST" style="margin-top:2%">
				<label class="mr-sm-2" for="inlineFormCustomSelect">Preference</label>
					  <select class="form-control custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" name="inlineFormCustomSelect">
						    <option selected value="">Choose...</option>
						    <option value="Firstname">Firstname</option>
						    <option value="Lastname">Lastname</option>
						    <option value="Title">Title</option>
						    <option value="Book">Book</option>
		                    <option value="Paper">Paper</option>
					  </select>
					  <input type="text" class="form-control" name="searchfield" placeholder="Search" />
				  		<div class="form-group">
						    <label for="Fromyear">From Year</label>
						    <select class="form-control custom-select mb-2 mr-sm-2 mb-sm-0" id="Fromyear" name="Fromyear">
						    <option selected value="">Choose...</option>
						    <option value="2016">2016</option>
						    <option value="2017">2017</option>
						     <option value="2018">2018</option>
						      
						   
					  </select>
						    
					
				  		</div>
				  		<div class="form-group">
						    <label for="Toyear">To Year</label>
						    <select class="form-control custom-select mb-2 mr-sm-2 mb-sm-0" id="Toyear" name="Toyear">
						    <option selected value="">Choose...</option>
						    <option value="2018">2018</option>
						    <option value="2017">2017</option>
						     <option value="2016">2016</option>
					  
					  </select>
						   
				  		</div>
				  		<button type="submit" class="btn btn-primary" value="show details">Search</button>
			</form>
		</div>
		</div>
		
<%@page import="java.sql.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>

<%
String inlineFormCustomSelect=request.getParameter("inlineFormCustomSelect");
System.out.println(inlineFormCustomSelect);
String searchfield=request.getParameter("searchfield");
String Fromyear = request.getParameter("Fromyear");
System.out.println("Fromyear:"+Fromyear);
String Toyear = request.getParameter("Toyear");
System.out.println("Toyear:"+Toyear);
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbphyresearchrecord","root","");
PreparedStatement st=null;
ResultSet rs=null;
boolean flag=false;
String BetQuery="";
String FQuery="";


if ("POST".equalsIgnoreCase(request.getMethod())) 
{


  if(Fromyear.isEmpty() && Toyear.isEmpty())
	{
	 
	}
  else if(Fromyear!="" && Toyear.isEmpty())
  {
	  BetQuery = " Ryear = '"+Fromyear+"'";
  }
  else if(Fromyear.isEmpty() && Toyear!="")
  {
	  BetQuery = " Ryear = '"+Toyear+"'";
  }
  else
   {
		 BetQuery = " Ryear BETWEEN '"+Fromyear+"' AND '"+Toyear+"'";
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
	if(inlineFormCustomSelect.equalsIgnoreCase("Lastname"))
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
	if(inlineFormCustomSelect.equalsIgnoreCase("Title"))
	{
		
		FQuery = " Title LIKE '%"+searchfield+"%'";
		
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
	if(inlineFormCustomSelect.equalsIgnoreCase("Book"))
	{
		
		FQuery = " Title LIKE '%"+searchfield+"%' AND Type='Book'";
		
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
	if(inlineFormCustomSelect.equalsIgnoreCase("Paper"))
	{
		
		FQuery = " Title LIKE '%"+searchfield+"%' AND Type='Paper'";
		
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
	if(FQuery=="" && BetQuery!="")
	{
		st=con.prepareStatement("SELECT * FROM tblresearch where "+BetQuery);
		rs=st.executeQuery();
		flag=true;
	}
}
else
{
	st=con.prepareStatement("SELECT * FROM tblresearch");
	rs=st.executeQuery();
	flag=true;
}

%>
			
<%
	if(flag==true)
			{
		%>
			<div class="col-sm-12" style=" margin-top: 5%;">
			<div class="Container">
			<table class="table table-striped">
			
		 <thead>
				<tr>
				
				
				<th>Title</th>
			
				<th>Note</th>
				
				<th>Author</th>
				
				<th>Cited By</th>
				
				<th>Year</th>
				</tr>
				
		 </thead>
			<tbody>
			
			<%
	while(rs.next())
			
		{
			
			%>
		<tr>
			
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				
				<td><%=rs.getString(8)%></td>
				
				<%
				String Cby = "";
				Cby=rs.getString(7);
				if(Cby==null)
				{
					Cby="N/A";
				}
				
				%>
				
				<td><%=Cby%></td>
				
				<td><%=rs.getString(5)%></td>
				
				
			</tr>
			
			
			<%
		}
			%>
			
			</tbody>
			</table>
			</div>
			</div> <%
	}

%>

		
	</body>
</html>