<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="ISO-8859-1">
<title>Doctor Appointment</title>
</head>
<body>
<div class="container">

</div>
<div class="navbar">
<ul>
<li><a href="Details.jsp">My Details</a></li>
  <li><a href="SerachOrgan.jsp">Search Organ</a></li>
  <li><a href="DocDonateOrgan.html">Donate Organ</a></li>
  <li><a class="active" href="MyAppointment.jsp">My Appointments</a></li>
  <li><a  href="PatientDetails.jsp">View Patient</a></li>
  <li><a  href="AddTreatment.html">Add Treatment</a></li>
    <li style="float:right"><a href="main.html">Logout</a></li>
  </ul>
 </div>
 <div class="target">
<h3> Booking Details</h3>



<table>
  <tr>
  
    <th>Appointment ID</th>
    <th>Patient Username</th>
    <th>Doctor Name</th>
     <th>Time </th>
	<th>Date</th>
	<th>Cancel</th>
  </tr>
   <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
	try{
		String id=(String)session.getAttribute("id");
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");	
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","root"); 
		Statement st= con.createStatement();
		ResultSet rs=null;
		rs=st.executeQuery("select * from appointmenttable where availbility='unavailable' and doctorid='"+id+"' ");
		while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("patientid") %></td>
				<td><%=rs.getString("p_username") %></td>
				<td><%=rs.getString("d_username") %></td>
				<td><%=rs.getString("time") %></td>
				<td><%=rs.getString("date") %></td>
				<td>
				<%session.setAttribute("patientid", rs.getString("patientid")); %>
				<input type="radio" name="table" value=<%=rs.getString("patientid") %>>
				
				</td>
			</tr>
		<%}
	}
catch(Exception e){
	out.println(e);
}

%>
  </table><br><br>
   <form action="CancelBooking.jsp" method="post">
			<input type="Submit" value="Submit"/>
			</form>
		
  </div>

</body>
</html>