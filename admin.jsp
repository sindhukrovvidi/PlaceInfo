<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
    <head>
       <title>Sign-In</title>
       <meta name="viewport" content="width=device-width, initial-scale=1">
       <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
<body>
        <style>
            body {font-family: "Lato", sans-serif}
        </style>
<center>

  <div class="container">
    <div class="modal-dialog">
      <div class="modal-content" style= "padding-top: 70px" >
        <div class="modal-body">
          <form class="w3-container w3-card-4" style ="width:45% "  action="admin.jsp" method="post">
            <h2 class="w3-text">Admin Login</h2>
            <p><br>
              <label class="w3-text w3-left"><b>Username</b></label>
              <input class="w3-input w3-border" name="aname" placeholder="Your Username...." required="required" data-error="Please enter this field." type="text"></p>
              <p>
              <label class="w3-text w3-left"><b>Password</b></label>
              <input class="w3-input w3-border" name="apass" placeholder="Your Password...." required="required" data-error="Please enter this field." type="password"></p>
              <p>
              <button class="w3-btn w3-blue">Sign In</button></p>
            </form>
          </div>
	  <div class="modal-footer" >
          <a href="index.jsp">Close</a>
        </div>
      </div>
    </div>
  </div>

</center>
</body>

<style>

div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>

</html>

 
        <%
            String aid="";
            String apasswd="";
                    
            String id=request.getParameter("aname");
            String passd=request.getParameter("apass");           
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/placeinfo","root","123456");
            
            String q="select pass from admin where uadmin=?";
             PreparedStatement pss=con.prepareStatement(q);
             pss.setString(1,id);
             

             ResultSet r =pss.executeQuery();
           
             if(r.next())
             {
                apasswd=r.getString(1);                 
                if(apasswd.equals(passd))
                {
                    session = request.getSession();
                    session.setAttribute("auser",id);
                    response.sendRedirect(request.getContextPath() + "/adminindex.jsp");
              }
              else
              {
                  response.sendRedirect(request.getContextPath() + "/admin.html");
              }
             }
                %>