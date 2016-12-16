<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Treatment</title>
</head>
<body>
  <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
	try{
		String id=(String)request.getParameter("Userid");
		String name=request.getParameter("name");
		String treatfor=request.getParameter("Treatfor");
		String treatment=request.getParameter("Treatment");
		String doctorid=(String)session.getAttribute("id");
		String d_username=(String)session.getAttribute("username");
		System.out.println(doctorid);
		System.out.println(id);
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");	
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorpatient","root","root"); 
		Statement st= con.createStatement();
		ResultSet rs=null;
		int i;
		i=st.executeUpdate("insert into treatment(doctorid,p_username,treatment,treatmentfor,d_username,patientid) values('"+doctorid+"','"+name+"','"+treatment+"','"+treatfor+"','"+d_username+"','"+id+"')");
		i=st.executeUpdate("update appointmenttable set availbility='unavailable' where doctorid='"+doctorid+"' and patientid='"+id+"'");
		out.println("<script type=\"text/javascript\">");
	  	out.println("alert('Successufull');");
	  	out.print("location='AddTreatment.html'");
	  	out.println("</script>");
	}
catch(Exception e){
	out.println(e);
}

%>
</body>
</html>