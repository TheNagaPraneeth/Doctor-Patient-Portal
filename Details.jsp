<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="ISO-8859-1">
<title>Details</title>
</head>
<body>
<div class="container">

</div>
<div class="navbar">
<%String target=(String)session.getAttribute("table"); %>
<ul>
  <li><a class="active" href="Details.jsp">My Details</a></li>
  <li><a href="SerachOrgan.jsp">Search Organ</a></li>
  <%if(target.equals("patient")){ %>
  <li><a href="DonateOrgan.html">Donate Organ</a></li>
  <li><a  href="Appointment.jsp">Book Appointment</a></li>
  <li><a href="ViewBooking.jsp">View Booking</a></li>
  <li><a href="CancelBooking.html">Cancel Booking</a></li>
  <%}
  else{%>
  		<li><a href="DocDonateOrgan.html">Donate Organ</a></li>
	  <li><a href="MyAppointment.jsp">My Appointments</a></li>
	  <li><a  href="PatientDetails.jsp">View Patient</a></li>
	  <li><a  href="AddTreatment.html">Add Treatment</a></li>
  <%}
  %>
  <li style="float:right"><a href="main.html">Logout</a></li>
  
  
</ul>
</div>
<div class="target" >
<h3> Details</h3>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
	try{
		
		String username=(String)session.getAttribute("username"); 
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");	
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","root"); 
		Statement st= con.createStatement();
		ResultSet rs=null;
		int i;
		if(target.equals("doctor"))
			rs=st.executeQuery("select * from doctortable where username='"+username+"'"); 
		else if(target.equals("patient"))
			rs=st.executeQuery("select * from patienttable where username='"+username+"'"); 
		else
		{
			out.println("Enter correct value");
			return;
		}
		if(rs.next()){
			String patientid="";
			patientid=rs.getString(6);
			session.setAttribute("id",rs.getString(6));
			session.setAttribute("username",rs.getString("username"));
		%>
			<form>
<label for="Id">UserId:</label><input type="text" value=<%=rs.getString(6)%>>
<label for="Id">UserName:</label><input type="text" value=<%=rs.getString("username")%>><br><br>
<label for="name">Name:</label> <input type="text" value=<%=rs.getString("fullname") %>>
<label for="mobile">Mobile No:</label> <input type="text" value=<%=rs.getString("mobile") %>><br><br>
<label for="email">Email:</label> <input type="text" value=<%=rs.getString("email") %>><br>
</form>
		<%}

if(target.equals("patient")){
%>

<h3> Treatment history</h3>
<table>
 <tr>
 <th>PatientID</th>
 <th>Patient Name</th>
 <th>DoctorID</th>
 <th>Doctor Name</th>
    <th>Disease</th>
    <th>Treatment</th>
	
  </tr>
   <%
   		String patientid=(String)session.getAttribute("id");
   		System.out.println(patientid);
		rs=st.executeQuery("select * from treatment where patientid='"+patientid+"'");
		while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("patientid") %></td>
				<td><%=rs.getString("p_username") %></td>
				<td><%=rs.getString("doctorid") %></td>
				<td><%=rs.getString("d_username") %></td>
				<td><%=rs.getString("treatmentfor") %></td>
				<td><%=rs.getString("treatment") %></td>
			</tr>
		<% }
	
	}
}
	catch(Exception e){
		out.println(e);
	}%>
  </table>

</div>
</body>
</html>