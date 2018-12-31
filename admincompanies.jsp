<%-- 
    Document   : admincompanies
    Created on : 14 Nov, 2018, 8:45:17 PM
    Author     : anitha
--%>

<%-- 
    Document   : main
    Created on : Oct 9, 2018, 9:30:11 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<title>Guide</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
  <body>
      
      
      <style>
        body {font-family: "Lato", sans-serif}
        table, th, td {
            border: 1px solid black;
            text-align: center;

        }
        #button1,#button2{
            display:inline-block;
        }
    </style>
    
    
<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card w3-padding-large">

    <div class="w3-display-left w3-small" style="padding:16px 16px">
    	<a href="adminindex.jsp" class="w3-bar-item w3-padding-large"><img src="./images/logo.png" style="width:170px"></a>
    </div>
    <div class="w3-display-middle w3-large">
    	<a href="adminindex.jsp" class="w3-bar-item w3-padding-large"><b>PlaceInfo</b></a>
    </div>
    <div class="w3-right w3-large">
      <a href="adminresources.jsp" class="w3-bar-item w3-button">Resources</a>
      <a href="admincompanies.jsp" class="w3-bar-item w3-button">Companies</a>
      <%if(session.getAttribute("auser") == null)
        {%>
            <div class="w3-dropdown-hover w3-hide-small">
            <button class="w3-padding-large w3-button" title="siginin">Sign in <i class="fa fa-caret-down"></i></button>     
                <div class="w3-dropdown-content w3-bar-block w3-card-4">
                    <a href="admin.html" class="w3-bar-item w3-button">Admin</a>
                    <a href="signin.html" class="w3-bar-item w3-button">Sign in</a>
                </div>
            </div>
      <%
        }
        else
        {%>
            <a href="#" class="w3-bar-item w3-button"><%String name=(String)session.getAttribute("auser");  
out.print(name);%></a>
            <a href="logout.jsp" class="w3-bar-item w3-button">Logout</a>
            <%}%>


    </div>
  </div>
</div>
<%
            Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/placeinfo","root","123456");
                                     String qp="select * from companies";
                                                  PreparedStatement p=con.prepareStatement(qp);
       
                                                  ResultSet r=p.executeQuery();%><br><br><br>
                                              
<center>
    <div><br>
    <button id="button1" onclick="location.href = '/Placeinfo/adminadd.html';" class="w3-btn w3-blue">Add</button>
    <button id="button2" onclick="location.href = '/Placeinfo/adminupdate.html';" class="w3-btn w3-blue">Update</button>
    <br>
  <table>
  <tr>
    <th>Company Name</th>
    <th>     Job Profile </th>
    <th>   CTC    </th>
    <th> Status</th>
  </tr>
   <%
             while(r.next())
             {
                 String cname = r.getString(1);
                   String jp = r.getString(2);
                   String ctc = r.getString(3);
                   String status = r.getString(4);
                   
   %>
  <tr>
    <td><%=cname%></td>
   
    <td> <%=jp%> </td>
    <td> <%=ctc%> </td>
    <td> <%=status%> </td>
  </tr>       
  
 <% }
    %>        
 <br><br>
 </table>
</div>
</center>

</body>
</html>

