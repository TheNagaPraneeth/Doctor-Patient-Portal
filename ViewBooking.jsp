<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Booking</title>
</head>
<body>
<div class="container">
</div>
<div class="navbar">
<%String target=(String)session.getAttribute("table"); %>
<ul>
  <li><a href="Details.jsp">My Details</a></li>
   <li><a href="SerachOrgan.jsp">Search Organ</a></li>
  <%if(target.equals("patient")){ %>
   <li><a href="DonateOrgan.html">Donate Organ</a></li>
  <li><a  href="Appointment.jsp">Book Appointment</a></li>
  <li><a class="active"href="ViewBooking.jsp">View Booking</a></li>
  <li><a href="CancelBooking.html">Cancel Booking</a></li>
  <%}
  else{%>
   <li><a href="DocDonateOrgan.html">Donate Organ</a></li>
    <li><a href="MyAppointMent.html">My Appointments</a></li>
	  <li><a  href="PatientDetails.jsp">View Patient</a></li>
	  <li><a  href="AddTreatment.html">Add Treatment</a></li>
  <%}
  %>
 
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
	Connection con=null;
	Class.forName("com.mysql.jdbc.Driver");	
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","root"); 
	Statement st= con.createStatement();
	int i;
	ResultSet rs=null;
	if (target.equals("patient")){
	rs=st.executeQuery("select * from appointmenttable where patientid='"+id+"' and availbility='unavailable'");
	}
	%>
	<h3> Booking History</h3>

<table>
  <tr>
  <th>AppointmentID</th>
    <th>Doctor Name</th>
    <th>Date </th>
	<th>Time</th>
  </tr>
  <tr>
	<% while(rs.next()) 
	{ %>
		<td><%=rs.getString("patientid")%></td>
		<td><%=rs.getString("d_username")%></td>
		<td><%=rs.getString("time")%></td>
		<td><%=rs.getString("date")%></td>
	
	</tr>
	 
	<% }%>
	</table>
	<%}
catch(Exception e){
	out.println("Error is : "+e);
}
%>

</div>
</body>
</html>