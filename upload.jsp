<%-- 
    Document   : upload.jsp
    Created on : 15 Nov, 2018, 12:43:18 AM
    Author     : anitha
--%>



<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%> 

<% 
                           
       
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/placeinfo","root","123456");
    String name=request.getParameter("cname");
    out.println(name);
    String url = request.getParameter("url");
    String q="INSERT INTO `resources` (`cname`, `URL`) VALUES (?,?)";
    PreparedStatement pss=con.prepareStatement(q);
    pss.setString(1,name);
    pss.setString(2,url);
    int t = pss.executeUpdate();
    if(t>0)
    {
        %>
        <script>
            alert("Record Successful");
            location.href="/Placeinfo/adminindex.jsp";
        </script>
        
        <% 
    }
    else
    {
        %>
        <script>
            alert("Record Unsuccessful, Check your Details");
            location.href="/Placeinfo/adminindex.jsp";
        </script>
        <%
    }
%>

