<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
input[type="text"] {
    width: 92px;
}
</style>
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">

</div>
<div class="navbar">
<%String target=(String)session.getAttribute("table"); %>
<ul>
  <li><a href="details.jsp">My Details</a></li>
  <li><a class="active" href="SerachOrgan.jsp">Search Organ</a></li>
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
<h3>Search Donor</h3>
<form action="SerachOrgan.jsp" method="post">
<label>Search By:</label><select name="option">
  <option value="organ">Organ</option>
  <option value="blood_group">Blood Group </option>
  
  </select><br><br><br>
<label>Value:</label><input type="text" name="value"><br><br>
</form>
<button type="button1"style="margin-left:70px">Search</button><br><br>
<h3 style="text-align:center">Organ Donor List</h3>
<table>
  <tr>
    <th>Name</th>
    <th>Mobile</th>
    <th>Email</th>
    <th>Organ </th>
	<th>Blood Group</th>
  </tr>
  <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
	try{
		String option=request.getParameter("option");
		String value=request.getParameter("value");
		System.out.println(option);
		System.out.println(value);
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");	
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","root"); 
		Statement st= con.createStatement();
		ResultSet rs=null;
		if(option==null)
		rs=st.executeQuery("select * from organ");
		else
		rs=st.executeQuery("select * from organ where "+option+"='"+value+"'");
		while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("mobile") %></td>
				<td><%=rs.getString("email") %></td>
				<td><%=rs.getString("organ") %></td>
				<td><%=rs.getString("blood_group") %></td>
			</tr>
		<%}
	}
catch(Exception e){
	out.println(e);
}

%>
  </table>
  </div>
</body>
</html>