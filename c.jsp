<%@page import="java.sql.*"%>
<%
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yogi");
 
String sql="select * from contact";
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
    <form>
        <h1>Welcome</h1>
<table border="5" bgcolor="white">
<tr>


<th colspan="5" align="center">User Problems</th></tr>

<tr>
<td>Name</td>
<td>Email</td>
<td>Problem</td>
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