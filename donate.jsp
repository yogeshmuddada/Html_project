<%@ page import="java.sql.*"%>

<%
String fname=request.getParameter("name");
String mname=request.getParameter("phone");
String lname=request.getParameter("email");
String message=request.getParameter("city"); 
int pin=Integer.parseInt(request.getParameter("pin"));
int amount=Integer.parseInt(request.getParameter("amount"));
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yogi");
    PreparedStatement ps=con.prepareStatement("insert into donate values(?,?,?,?,?,?)");
    ps.setString(1,fname);
    ps.setString(2,mname);
    ps.setString(3,lname);
    ps.setString(4,message);
    ps.setInt(5,pin);
    ps.setInt(6,amount);
    int x=ps.executeUpdate();
    if(x!=0){
        out.print("Payment Sucessfully Completed....");
    	%>
		<script>
				alert("Donation Successfully completed");
                alert("Thank you for being a part of this");
				location.replace("main.html");
		</script>
<%
    }else{
        out.println("Payment not Sucessfully Completed....");
        out.print("Something went wrong...");
    }
    

}catch(Exception e){
    out.print(e);
}
%>