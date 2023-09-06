<%@ page import="java.sql.*"%>
<%


String event=request.getParameter("event");
String date=request.getParameter("date");
String time=request.getParameter("time");
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yogi");
    String sql="delete from event where event=? and da=? and time=?";
    PreparedStatement s=con.prepareStatement(sql);
    s.setString(1,event);
    s.setString(2,date);
    s.setString(3,time);
   int x=s.executeUpdate();
   if(x>0)
  {
	%>
		<script>
				alert("Event deleted Successfully");
				location.replace("admin.html");
		</script>
<%
    
  }
  }
  catch(Exception e)
  {
   out.println(e);
   e.printStackTrace();
  }


%>