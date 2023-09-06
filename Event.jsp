<%@ page import="java.sql.*"%>

<%
String fname=request.getParameter("event");
String mname=request.getParameter("address");
String lname=request.getParameter("date");
String email=request.getParameter("time");
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yogi");
    PreparedStatement ps=con.prepareStatement("insert into Event values(?,?,?,?)");
    ps.setString(1,fname);
    ps.setString(2,mname);
    ps.setString(3,lname);
    ps.setString(4,email);
    int x=ps.executeUpdate();
    if(x!=0){
        out.print("Registration Sucessfully Completed....");
        response.sendRedirect("s.jsp");
    }else{
        out.println("Registration not Sucessfully Completed....");
        out.print("Something went wrong...");
    }
    

}catch(Exception e){
    out.print(e);
}
%>