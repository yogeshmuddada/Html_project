<%@ page import="java.sql.*"%>
<%


String userid=request.getParameter("userid");
String mobile=request.getParameter("mobile");
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yogi");
    String sql="delete from regis where userid=? and phonenumber=?";
    PreparedStatement s=con.prepareStatement(sql);
    s.setString(1,userid);
    s.setString(2,mobile);
   int x=s.executeUpdate();
   if(x>0)
  {
	%>
		<script>
				alert("User Account deleted Successfully");
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