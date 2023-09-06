<%@page import="java.sql.*"%>
<%
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yogi");
String sql="select * from donate";
String sm="select sum (amount) from donate";
PreparedStatement stmt=con.prepareStatement(sql);  
PreparedStatement ad=con.prepareStatement(sm);
ResultSet rs=stmt.executeQuery();  
ResultSet rd=ad.executeQuery(); 
rd.next();
%>
<html>
    <head>
        <style>
            body{
                color: rgb(44, 23, 23);
                background-image: url("natu.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                width: 100%;
                }
        </style>
    </head>
   
<body>
    <form>
        <h1>Welcome</h1>
<table border="5" bgcolor="white">
<tr>


<th colspan="7" align="center">DONATION DETAILS</th></tr>

<tr>
<td>NAME</td>
<td>PHONE NO</td>
<td>EMAIL</td>
<td>CITY</td>
<td>PIN</td>
<td>AMOUNT</td>
</tr>
    </form>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getInt(5)%></td>
<td><%=rs.getInt(6)%></td>
</tr>
<%
}
%>
<th colspan="7" align="right" >Amount:<%=rd.getInt(1)%></th></tr>
</table>
<br>
<br>
<% }
catch(Exception e)
{
 out.println(e.toString());
}
%>