<%@page import="java.sql.*"%>
<%
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yogi");
 
String sql="select * from Event";
PreparedStatement stmt=con.prepareStatement(sql);  
ResultSet rs=stmt.executeQuery();  
%>
<html>
    <head>
        <script>
            function fun(){
             window.alert("Thank you for participating the event");
            return false;
            }
        </script>
        <title></title>
        <style>
            body{
	color: #fff;
	background-image: url("natu.jpg");
	background-size: cover;
    background-repeat: no-repeat;
    width: 100%;
	
            }
            table, th, td {
                      border: 1px solid;
                      border-color:whitesmoke;
            }
            table{
                width: 70%;
                
            }
            th{
                height: 70px;
                color:black;
            }
tr:hover {background-color: coral;}
td{
    text-align: center;
    color: black;
    height: 40px;
}
.main{
    margin-left: 10px;
    margin-top: 7px;
    margin-bottom: 50px;
    background: transparent;
}
.button1 {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  align-items: center;
}

   
        </style>
    </head>
    <body>
        <font size=5 color="blur"><label><u><b>EVENTS</b></u></label></font><br>
        <div class="main">  
            <form method="post" onsubmit="return fun()">
                <table>
                   <tr>
                        <th>S.NO</th>
                        <th>EVENT</th>
                        <th>ADDRESS</th>
                        <th class="td2">DATE</th>
                        <th class="td1">TIME</th>
                        <th class="td1">SELECT</th>
                    </tr>
                    <%
                    int r=1;
                    while(rs.next())
                    {
                    %>
                    <tr>
                    <td><%out.print(r);%></td>   
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><input type="submit" value="JOIN"></td>
                    </tr>
                    <%
                    r=r+1;
                        }
                    %>
                    
                    </tr>
                </table>
            </form>
        </div>
        <ul><p><font size=5 color="blur"><label><u><b>SERVICE</b></u></label></font><br></p>
           <font size="3"><ul><a href="doctor's.html">Doctor's Help</a></ul>
            <ul><a href="accident.html">Accidents</a></ul>
            <ul><a href="conduct.html">Conduct event</a></ul></font>
        </ul>

       <div><center><h3><a href="home.html" style="text-decoration: none; color:#175E17" ><u><b>GO TO HOME</b></u></a></h3><center></div>   
        </body>
</html>
<% }
catch(Exception e)
{
 out.println(e.toString());
}
%>