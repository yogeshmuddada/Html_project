<%@page import="java.sql.*"%>
<%
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yogi");
 
String sql="select * from doctor";
PreparedStatement stmt=con.prepareStatement(sql);  
ResultSet rs=stmt.executeQuery();  
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
<h1>Welcome</h1>
<table border="5" bgcolor="white">
<tr>


<th colspan="5" align="center"> Details</th></tr>

<tr>
<td>Name</td>
<td>Email</td>
<td>Address</td>
<td>Mobile</td>
<td>Problem</td>
</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
</tr>
<%
}
%>
</table>
<br>
<br>
<% }
catch(Exception e)
{
 out.println(e.toString());
}
%>