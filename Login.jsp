<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
	try{
		String target=request.getParameter("table");
		String username=request.getParameter("username");
		session.setAttribute("username",username);
		session.setAttribute("table",target);
		String pass=request.getParameter("pass");
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");	
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","root"); 
		Statement st= con.createStatement();
		ResultSet rs=null;
		int i;
		if(target==null)
		{
			out.println("<script type=\"text/javascript\">");
		  	out.println("alert('Error');");
		  	out.print("location='main.html'");
		  	out.println("</script>");
		}
		else if(target.equals("doctor"))
			rs=st.executeQuery("select * from doctortable where username='"+username+"'"); 
		else if(target.equals("patient"))
			rs=st.executeQuery("select * from patienttable where username='"+username+"'"); 
		else
		{
			out.println("<script type=\"text/javascript\">");
		  	out.println("alert('Error');");
		  	out.print("location='main.html'");
		  	out.println("</script>");
		}
		if(rs.next()){
			if(pass.equals(rs.getString("password")))
					response.sendRedirect("Details.jsp");
		}
		else{
			out.println("<script type=\"text/javascript\">");
		  	out.println("alert('Error');");
		  	out.print("location='main.html'");
		  	out.println("</script>");
		}
		 
	
	}
	catch(Exception e){
		out.println(e);
	}

%>
</body>
</html>