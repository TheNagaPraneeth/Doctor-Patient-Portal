<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
input[type="text"] {
    width: 140px;
}
</style>
<link rel="stylesheet" href="style.css">
<meta charset="ISO-8859-1">
<title>Patient Portal</title>
</head>
<body>
<%
String username=(String)session.getAttribute("username");
String id=(String)session.getAttribute("id");
%>
<div class="container">

</div>
<div class="navbar">
<ul>
  <li><a href="Details.jsp">My Details</a></li>
  <li><a href="SerachOrgan.jsp">Search Organ</a></li>
    <li><a href="DonateOrgan.html">Donate Organ</a></li>
  <li><a class="active" href="Appointment.jsp">Book Appointment</a></li>
  <li><a href="ViewBooking.jsp">View Booking</a></li>
  <li><a href="CancelBooking.html">Cancel Booking</a></li>
  <li style="float:right"><a href="main.html">Logout</a></li>
  
</ul>
</div>
<div class="target" >
<h3>New Booking</h3>
<form>
<label for="Id">AppointmentId:</label><input type="text" name="Userid" value=<%=id%> ><br><br>
<h3>Doctor's available list</h3>
</form>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
	try{
		String target=(String)session.getAttribute("table");
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");	
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","root"); 
		Statement st= con.createStatement();
		int i;
		ResultSet rs;
		if (target.equals("patient")){
		rs=st.executeQuery("select * from appointmenttable where availbility='available' ");        
		while(rs.next()) 
		{ 
		
		String value="";
		String value1="";
		String value2="";
		String value3="";
		value1=rs.getString("d_username").concat(",");
		value2=value1.concat(rs.getString("time"));
		value3=(",").concat(rs.getString("date"));
		value=value2.concat(value3);
		%>
		
		<form action="Appointment.jsp" method="POST">

			<label style="padding-left:20px;width:80px"><% out.print(value);%></label><input type="submit" value="Book">
		<input type="hidden" name="value"  value="<%=value%>" />
		
		</form>
		<%} 
		String doc="";doc=request.getParameter("value");
		String[] parts=doc.split(",");
		session.setAttribute("d_username",parts[0]);
		if(doc!=null)
		i=st.executeUpdate("update appointmenttable set availbility='unavailable',patientid='"+id+"',p_username='"+username+"' where d_username='"+parts[0]+"'and time='"+parts[1]+"' and date='"+parts[2]+"'"); 
		out.println("<script type=\"text/javascript\">");
	  	out.println("alert('Successufully Booked an Appointment');");
	  	out.print("location='Appointment.jsp'");
	  	out.println("</script>");
		}
	}
	catch(Exception e){
		System.out.println("Error is : "+e);
	}
%>
</div>
</body>
</html>