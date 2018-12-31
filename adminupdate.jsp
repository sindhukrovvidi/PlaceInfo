<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%> 

<% 
                           
       
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/placeinfo","root","123456");
    String cname=request.getParameter("cname");
    String status = request.getParameter("status");
    String q="Update companies set status=? where cname=?";
    PreparedStatement pss=con.prepareStatement(q);
    pss.setString(2,cname);
    pss.setString(1,status);
    int t = pss.executeUpdate();
    if(t>0)
    {
        %>
        <script>
            alert("Updated Successfully");
            location.href="/Placeinfo/adminindex.jsp";
        </script>
        
        <%    
    }
    else
    {
        %>
        <script>
            alert("Update Unsuccessful, Check your Details");
            location.href="/Placeinfo/adminindex.jsp";
        </script>
        <%
    }
%>
