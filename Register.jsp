<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<div class="container">

</div>
<div class="target" >
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
	try{
		String target=request.getParameter("tab");
		String username=request.getParameter("username"); 
		String fullname=request.getParameter("fullname"); 
		String email=request.getParameter("email");
		String number=request.getParameter("number");
		String pass=request.getParameter("pass");
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");	
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","root"); 
		Statement st= con.createStatement();
		int i;
		if(target==null)
		{
			out.println("<script type=\"text/javascript\">");
		  	out.println("alert('Error');");
		  	out.print("location='Register.html'");
		  	out.println("</script>");
		}
		else if(target.equals("doctor"))
			i=st.executeUpdate("insert into doctortable(username,fullname,email,mobile,password) values ('"+username+"','"+fullname+"','"+email+"','"+number+"','"+pass+"')"); 
		else if(target.equals("patient"))
			i=st.executeUpdate("insert into patienttable(username,fullname,email,mobile,password) values ('"+username+"','"+fullname+"','"+email+"','"+number+"','"+pass+"')"); 
		else
		{out.println("<script type=\"text/javascript\">");
			  	out.println("alert('Error');");
			  	out.print("location='Register.html'");
			  	out.println("</script>");
			
		}
		out.println("Successfully Registered "+"<a href=\"main.html\">Return to Login Page</a>"); 
	
	}
	catch(Exception e){
		out.println(e);
	}

%>
</div>
</body>
</html>