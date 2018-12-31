<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection"%>


 
        <%
            String sid="";
            String spasswd="";
                    
            String id=request.getParameter("Username");
            String passd=request.getParameter("Password");           
          
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/placeinfo","root","123456");
            String s1=id.substring(0,5);
            String s2=id.substring(0,4);
            if(!s1.equals("u4cse")&&!s1.equals("u4ece")&&!s1.equals("u4eee")&&!s2.equals("u4me"))
            {
                //System.out.println("incorrect");
                %>
                <script>
                    alert("Incorrect format of Username");
                    location.href = "/Placeinfo/signin.html";
                </script>
                <%
            }
            else
            {
                //System.out.println("2");
                String q="select password from student where username=?";
                PreparedStatement pss=con.prepareStatement(q);
                pss.setString(1,id);
             

             ResultSet r =pss.executeQuery();
           
             out.print(r);
             if(r.next())
             {
                spasswd=r.getString(1);                 
                if(spasswd.equals(passd))
                {
                    session = request.getSession();
                    session.setAttribute("user",id);
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
              }
              else
              {
                out.print("hello");
                %>
                <script>
                    alert("Username or Password in correct");
                    location.href = "/Placeinfo/signin.html";
                </script>
                <%
                  //response.sendRedirect(request.getContextPath() + "/signin.html");
              }
             }
            }
                %>