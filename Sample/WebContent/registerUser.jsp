<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Register User</title>
		<link href="registerUser.css" type="text/css" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	</head>
<body>
	<div class="container style="margin-top:40px">
    	<div class="row">
    	<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="panel panel-default">
				<div class="panel-body">
        	<div class="col-sm-12 col-md-10  col-md-offset-1 ">
            	<legend><a href="http://www.jquery2dotnet.com"><i class="glyphicon glyphicon-globe"></i></a> Sign up!</legend>
            		<form action="registeruserAdd.jsp" method="post" class="form" role="form">
            			<div class="row">
                			<div class="col-xs-6 col-md-6">
                    			<input class="form-control" name="Firstname" placeholder="First Name" type="text"
                        		required autofocus />
                			</div>
                			<div class="col-xs-6 col-md-6">
                    			<input class="form-control" name="Lastname" placeholder="Last Name" type="text" required />
                			</div>
            			</div>          			        			
            <input class="form-control" name="UCID" placeholder="UCID" type="text" />
            <input class="form-control" name="Email" placeholder="Your Email" type="email" />
            <input class="form-control" name="Password" placeholder="New Password" type="password" />
            <input class="form-control" name="Confirm password" placeholder="Confirm Password" type="password" />
           	<div id="div_id_role" class="form-group required">
                  
            <button class="btn btn-lg btn-primary btn-block" type="submit">
                Sign up</button>
            </form>
        </div>
        </div>
        </div>
        </div>
    </div>
</div>
</body>
</html>