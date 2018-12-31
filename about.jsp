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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <style>
  body {font-family: "Lato", sans-serif}
  </style>
  <body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-padding-large">

    <div class="w3-display-left w3-small" style="padding:16px 16px">
    	<a href="index.jsp" class="w3-bar-item w3-padding-large"><img src="./images/logo.png" style="width:170px"></a>
    </div>
    <div class="w3-display-middle w3-large">
    	<a href="index.jsp" class="w3-bar-item w3-padding-large"><b>PlaceInfo</b></a>
    </div>
    <div class="w3-right w3-large">
      <a href="about.jsp" class="w3-bar-item w3-button">About</a>
      <a href="resources.jsp" class="w3-bar-item w3-button">Resources</a>
      <a href="companies.jsp" class="w3-bar-item w3-button">Companies</a>
      <%if(session.getAttribute("user") == null)
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
            <a href="#" class="w3-bar-item w3-button"><%String name=(String)session.getAttribute("user");  
out.print(name);%></a>
            <a href="logout.jsp" class="w3-bar-item w3-button">Logout</a>
            <%}%>
   
      

    </div>
  </div>
</div>

<div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px">
    <h2 class="w3-margin-top" style="padding:30px 30px">ABOUT US</h2>
    <p class="w3-opacity"><i>Corporate And Industry Relations</i></p>
    <p class="w3-justify">The Directorate of Corporate & Industry Relations (CIR) is a unique and dedicated department of ?Amrita Vishwa Vidyapeetham?, established to provide expert guidance to students in specific areas beyond their regular academic curriculum and help them fulfill their career ambitions. <br><br>CIR empowers students with adequate Life Skills and Domain Skills so that they graduate from the University as competent and confident individuals who can take on the never-ending challenges of the industry. </p><br>
    <p><center><i>"To facilitate holistic career development of students through comprehensive and systematic training on Life Skills and build competence in core areas through innovative practical applications". </i></center></p>
</div>


<div class="w3-content w3-container w3-padding-12" id="portfolio">
  <div class="w3-row-padding w3-center" style="height:100px">

    <div class="w3-col m3 l4 w3-center">
      <img src="" style="width:60%">
    </div>

    <div class="w3-col m3 l4 w3-center">
      <img src="./images/biju.jpeg" style="width:60%" onclick="onClick(this)" class="img-circle w3-hover-opacity" alt="<br>Biju Kumar<br><i class='fa fa-envelope' style='width:30px'></i>bijukumar@am.amrita.edu">
    </div>
  </div>

  <br><br><br><br>
  <div class="w3-row-padding w3-center w3-section" style="padding: 30px 16px">

    <div class="w3-col m3 l4">
      <img src="./images/anu.jpg" style="width:50%" onclick="onClick(this)" class="img-circle w3-hover-opacity" alt="<br>Anu K Manapurram<br><i class='fa fa-phone' style='width:30px'></i>9446406800<br><i class='fa fa-envelope' style='width:30px'></i>anukm@am.amrita.edu">
    </div>

    <div class="w3-col m3 l4">
      <img src="./images/index.png" style="width:50%" onclick="onClick(this)" class="img-circle w3-hover-opacity" alt="<br>Ajisha Surendran<br><i class='fa fa-phone' style='width:30px'></i>9744757178<br><i class='fa fa-envelope' style='width:30px'></i>ajishasurendran@am.amrita.edu">
    </div>

    <div class="w3-col m3 l4">
      <img src="./images/shyam.jpg" style="width:50%" onclick="onClick(this)" class="img-circle w3-hover-opacity" alt="<br>Shyam Sundar<br><i class='fa fa-phone' style='width:30px'></i>9745801811<br><i class='fa fa-envelope' style='width:30px'></i>shyamsundarcv@am.amrita.edu">
    </div>

  </div>

</div>
<div class="container">
  <br><br><br><br><br><br><br><br>
</div>

<!-- Modal for full size images on click-->
<div id="modal01" class="w3-modal w3-black" onclick="this.style.display='none'">
  <span class="w3-button w3-large w3-black w3-display-topright" title="Close Modal Image"><i class="fa fa-remove"></i></span>
  <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
    <img id="img01" class="w3-image">
    <p id="caption" class="w3-opacity w3-large"></p>
  </div>
</div>

<script>
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "inline";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}
</script>





<div class="w3-bottom">
  <div class="w3-bar w3-black w3-card" style="padding:70px">

	<div class="w3-display-left" style="padding:40px 50px">
		<style>
			h2 {font-size:40px; text-align:center;}
		</style>
		<h2>207</h2>
		<p style="font-size:20px">Programs  Offered</p>
	</div>

	<div class="w3-display-left" style="padding:30px 310px">
		<style>
			h2 {font-size:40px; text-align:center;}
		</style>
		<h2>6</h2>
		<p style="font-size:20px">Amrita  Campuses</p>
	</div>

	<div class="w3-display-middle">
		<style>
			h2 {font-size:40px; text-align:center;}
		</style>
		<h2>A</h2>
		<p style="font-size:20px">Grade by NAAC</p>
	</div>

	<div class="w3-display-right" style="padding:30px 325px">
		<style>
			h2 {font-size:40px; text-align:center;}
		</style>
		<h2>8th</h2>
		<p style="font-size:20px">Rank(India):NIRF</p>
	</div>

	<div class="w3-display-right" style="padding:40px 40px">
		<style>
			h2 {font-size:40px; text-align:center;}
		</style>
		<h2>150+</h2>
		<p style="font-size:20px">International Partners</p>
	</div>
  </div>
</div>


</body>
</html>
