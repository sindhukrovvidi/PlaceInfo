<%-- 
    Document   : adminadd
    Created on : 15 Nov, 2018, 3:44:24 PM
    Author     : anitha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%> 

<% 
                           
       
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/placeinfo","root","123456");
    String cname=request.getParameter("cname");
    String jp = request.getParameter("jp");
    String status = request.getParameter("status");
    String ctc = request.getParameter("ctc");
    String q="INSERT INTO `companies`(`cname`, `jp`, `status`, `ctc`) VALUES (?,?,?,?)";
    PreparedStatement pss=con.prepareStatement(q);
    pss.setString(1,cname);
    pss.setString(2,jp);
    pss.setString(3,status);
    pss.setString(4,ctc);
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

