<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cancel Booking</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">

</div>
<div class="navbar">
<ul>
  <li><a href="Details.jsp">My Details</a></li>
  <li><a href="SerachOrgan.jsp">Search Organ</a></li>
    <li><a href="DonateOrgan.html">Donate Organ</a></li>
  <li><a  href="Appointment.jsp">Book Appointment</a></li>
  <li><a class="active" href="ViewBooking.jsp">View Booking</a></li>
  <li><a href="CancelBooking.html">Cancel Booking</a></li>  
  <li style="float:right"><a href="main.html">Logout</a></li>
  
  
</ul>
</div>
<div class="target" >
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String username=(String)session.getAttribute("username");
String id=(String)session.getAttribute("id");
String d_username=(String)session.getAttribute("d_username");
try{
	String target=(String)session.getAttribute("table");
	Connection con=null;
	Class.forName("com.mysql.jdbc.Driver");	
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","root"); 
	Statement st= con.createStatement();
	int i;
	ResultSet rs=null;
	if(target.equals("patient")){
		i=st.executeUpdate("update appointmenttable set availbility='available' where patientid='"+id+"'");
		
	out.println("<script type=\"text/javascript\">");
  	out.println("alert('Successufully Cancelled Boking');");
  	out.print("location='CancelBooking.html'");
  	out.println("</script>");
	}
	else if(target.equals("doctor")){
		String table=(String)session.getAttribute("patientid");
		System.out.println(table);
		i=st.executeUpdate("update appointmenttable set availbility='available' where patientid='"+table+"' and doctorid='"+id+"'");
		out.println("<script type=\"text/javascript\">");
	  	out.println("alert('Successufully Cancelled Boking');");
	  	out.print("location='MyAppointment.jsp'");
	  	out.println("</script>");
		}
	
}
catch(Exception e){
	out.println("Error is : "+e);
}
%>
</div>
</body>
</html>