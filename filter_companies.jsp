<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>



<!DOCTYPE html>
<html>
<title>Companies</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
  body {font-family: "Lato", sans-serif}
  </style>
<body>
    
  <div class="w3-top">
  <div class="w3-bar w3-black w3-card w3-padding-large">

    <div class="w3-display-left w3-small" style="padding:16px 16px">
    	<a href="index.jsp" class="w3-bar-item w3-padding-large"><img src="./images/logo.png" style="width:170px"></a>
    </div>
    <div class="w3-display-middle w3-large">
    	<a href="index.jsp" class="w3-bar-item w3-padding-large"><b>PlaceInfo</b></a>
    </div>
    <div class="w3-right w3-large">
        
      <a href="about.jsp" class="w3-bar-item w3-button">About</a>
      <a href="resources.jsp" class="w3-bar-item w3-button">Resources</a>
      <a href="filter_companies.jsp" class="w3-bar-item w3-button">Companies</a>
      <%if(session.getAttribute("user") == null)
        {%>
            <a href="signin.html" class="w3-bar-item w3-button">Sign-in</a>
      <%
        }
        else
        {%>
            <a href="#" class="w3-bar-item w3-button"><%String name=(String)session.getAttribute("user");  
out.print(name);%></a>
            <a href="logout.jsp" class="w3-bar-item w3-button">Logout</a>
            <%}%>

      
    </div>
  </div>
</div>

  <div class="container" style="font-size:15px">
    <div class="modal-dialog">
      <div class="modal-content" style= "padding-top: 70px" >
        <div class="modal-body">
          <form class="w3-container w3-card-4" style = " width:300px">
            <h3>Job Profile</h3>
            <p>
              <input class="w3-check" type="checkbox" >
              <label> Software Developer </label></p>
              <p>
                <input class="w3-check" type="checkbox" >
              <label> Tester </label></p>
                <p>
                  <input class="w3-check" type="checkbox" >
                  <label>Data Analyst </label></p>
                  <input class="w3-check" type="checkbox">
                  <label> Computer Network Engineer </label></p>
                  <input class="w3-check" type="checkbox">
                  <label> Network Engineer </label></p>


                  <h3>Status</h3>
                  <p>
                    <input class="w3-radio" type="radio" name="status" value="yettocome">
                    <label> Yet to come</label></p>
                    <p>
                      <input class="w3-radio" type="radio" name="status" value="active">
                      <label> Active</label></p>
                      <p>
                        <input class="w3-radio" type="radio" name="status" value="done">
                        <label> Done</label></p>

                        <h3>CTC</h3>

                        <p>
                          <input class="w3-check" type="checkbox" >
                          <label> 1 l.p.a - 3 l.p.a </label></p>
                          <p>
                            <input class="w3-check" type="checkbox" >
                          <label> 3 l.p.a - 7 l.p.a </label></p>
                            <p>
                              <input class="w3-check" type="checkbox" >
                              <label>7 l.p.a - 10 l.p.a </label></p>
                              <input class="w3-check" type="checkbox">
                              <label> above 10 l.p.a </label>


                          

                        <center><p>
                        <button class="w3-btn w3-blue">Apply</button></p></center>

                      </form>
                    </div>
                </div>
              </div>
            </div>

      
            <%
            Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/placeinfo","root","123456");
                                     String qp="select * from companies";
                                                  PreparedStatement p=con.prepareStatement(qp);
       
                                                  ResultSet r=p.executeQuery();%><br>
                                                  
  <center>
<style>

table, th, td {
    border: 1px solid black;
    text-align: center;

}
</style>
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
    
    
       
<style>
table, th, td {
    border: 1px solid black;
    text-align: center;
}
</style>
<br><br>
<br>

</center>

</body>
</html>
