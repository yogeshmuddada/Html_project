<%@ page import="java.sql.*"%>

<%

String userid=request.getParameter("USER");
String npass=request.getParameter("NP");


try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yogi");
    PreparedStatement ps=con.prepareStatement("select * from regis where userid=? and password=? ");
    ps.setString(1,userid);
    ps.setString(2,npass);
    ResultSet x=ps.executeQuery();
    if(x.next()){
        out.print("login Sucessfully Completed....");
        response.sendRedirect("home.html");
    }else{
        out.println("login not Sucessfully Completed....");
        out.print("USERID and PASSWORD are incorrect");
    }
       

}catch(Exception e){
    out.print(e);
}
%>

