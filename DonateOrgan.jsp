<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="ISO-8859-1">
<title>Donate Register</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
	try{
		String target=(String)session.getAttribute("table");
		String name=request.getParameter("name"); 
		String mobile=request.getParameter("mobile"); 
		String bloodgroup=request.getParameter("bloodgroup");
		String organ=request.getParameter("organ");
		String email=request.getParameter("email");
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");	
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","root"); 
		Statement st= con.createStatement();
		int i=st.executeUpdate("insert into organ values('"+name+"','"+mobile+"','"+email+"','"+bloodgroup+"','"+organ+"')"); 
		if(target.equals("patient")){
		out.println("<script type=\"text/javascript\">");
	  	out.println("alert('Successufully Registered for Donation');");
	  	out.print("location='DonateOrgan.html'");
	  	out.println("</script>");
		}
		else if(target.equals("doctor")){
			out.println("<script type=\"text/javascript\">");
		  	out.println("alert('Successufully Registered for Donation');");
		  	out.print("location='DocDonateOrgan.html'");
		  	out.println("</script>");
			}
		
	
	}
	catch(Exception e){
		out.println(e);
	}

%>
</body>
</html>