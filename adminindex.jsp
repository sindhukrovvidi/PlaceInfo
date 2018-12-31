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
<title>Guide</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
  body {font-family: "Lato", sans-serif}
  </style>
  <body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-padding-large">

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


<!-- Page content -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">

  <!-- Automatic Slide show Images -->
  <div class="mySlides w3-display-container w3-center" style="height:400px">
    <img src="./images/c.jpg" style="padding-top:32px">
  </div>
  <div class="mySlides w3-display-container w3-center" style="height:400px">
    <img src="./images/b.jpg" style="padding-top:32px">
  </div>
  <div class="mySlides w3-display-container w3-center" style="height:400px">
    <img src="./images/a.jpg" style="padding-top:32px">
  </div>

  <!-- Notifications -->
  <div class="w3-black" id="notify">
    <div class="w3-container w3-content w3-padding-64" style="max-width:800px">
      <h2 class="w3-wide w3-center">Notifications</h2>
      <div class="w3-row-padding w3-padding-32" style="margin:0 -16px">
        <div class="w3-third w3-margin-bottom">
          <div class="w3-container w3-white">
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('notify').style.display='block'">Notifications</button>
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <div class="w3-container w3-white">
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('notify').style.display='block'">Notifications</button>
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <div class="w3-container w3-white">
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('notify').style.display='block'">Notifications</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- The Contact Section -->
  <div class="w3-container w3-content w3-padding-64" style="max-width:800px" id="contact">
    <h2 class="w3-wide w3-center">CONTACT</h2>
    <p class="w3-opacity w3-center"><i>Any Queries? Drop a note!</i></p>
    <div class="w3-row w3-padding-32">
      <div class="w3-col m6 w3-large w3-margin-bottom">
        <i class="fa fa-map-marker" style="width:30px"></i> Amritapuri, Kerala<br>
      </div>
      <div class="w3-col m6">
        <form action="php/contact.php" method="post" enctype="multipart/form-data">
          <div class="w3-row-padding" 	style="margin:0 -16px 8px -16px">
            <div class="w3-half">
              <input class="w3-input w3-border" type="text" placeholder="Name" required name="cname">
            </div>
            <div class="w3-half">
              <input class="w3-input w3-border" type="text" placeholder="Email" required name="cemail">
            </div>
          </div>
          <input class="w3-input w3-border" type="text" placeholder="Message" required name="cmessage">
          <input class="w3-button w3-black w3-section w3-right" type="submit" value="SEND">
        </form>
      </div>
    </div>
  </div>

<!-- End Page Content -->
</div>

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge">
</footer>

<script>
// Automatic Slideshow - change image every 4 seconds
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 3000);
}

</script>

</body>
</html>