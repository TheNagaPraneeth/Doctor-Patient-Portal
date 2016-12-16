<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Details</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">

</div>
<div class="navbar">
 <ul>
 <li><a href="Details.jsp">My Details</a></li>
  <li><a href="SerachOrgan.jsp">Search Organ</a></li>
  <li><a href="DocDonateOrgan.html">Donate Organ</a></li>
  <li><a href="MyAppointment.jsp">My Appointments</a></li>
  <li><a  class="active" href="PatientDetails.jsp">View Patient</a></li>
  <li><a  href="AddTreatment.html">Add Treatment</a></li>
    <li style="float:right"><a href="main.html">Logout</a></li>
  
  
</ul>
 </div>
 <div class="target">
<h3> Patient Details</h3>
<form action="PatientDetails.jsp" method="post">
<label>PatientId:</label><input type="text" name="Userid"><br><br>
<button type="button1">Search</button><br>
</form>
<h3>Patient Treatment History</h3>
<table>
 <tr>
 <th>PatientID</th>
 <th>Patient Name</th>
 <th>DoctorID</th>
 <th>Doctor Name</th>
    <th>Disease</th>
    <th>Treatment</th>
	
  </tr>
 <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
	try{
		String option=request.getParameter("Userid");
		System.out.println(option);
		String id=(String)session.getAttribute("id");
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");	
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","root"); 
		Statement st= con.createStatement();
		ResultSet rs=null;
		if(option==null)
		rs=st.executeQuery("select * from treatment where doctorid='"+id+"'");
		else
		rs=st.executeQuery("select * from treatment where patientid='"+option+"' and doctorid='"+id+"'");
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