<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/navigationTabs.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/aboutUs.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery-ui.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/index.css" />
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/navigationTabs.js"></script>
</head>
<body class="bg1">
	<span id="valvicon"><img id="iconCom" src="images/iconCompany.png" /></span>  
	<form action="login.jsp">
		<input id="signIn" type="submit" value="SignIn" />
	</form>
	<ul class="tabs">
		<li data-content="first" class="tab-link">About Us</li>
		<li class="submenu-container">OurBusiness
			<ul class="dropdown">
				<li data-content="second" class="tab-link">Services</li>
				<li data-content="third" class="tab-link">Innovation</li>
			</ul>
		</li>
		<li class="submenu-container">Careers
			<ul class="dropdown">
				<li data-content="fourth" class="tab-link">Apply Now</li>
				<li data-content="fifth" class="tab-link">Working At ValvData</li>
			</ul>
		</li>
		<li data-content="seventh" class="tab-link">ContactUs</li>
	</ul>

	<br>
	<br>
	<br>
	<div class="selected" id="first">
		<span class="slideshow-container"> <span class="mySlides fade">
				<span class="numbertext">1 / 4</span> <img class="cha"
				src="images/CAR_EM4.jpg" style="width: 580px; height: 380px">
				<span style="text-align: center; display: none" class="text">Caption
					Text</span>
		</span> <span class="mySlides fade"> <span class="numbertext">2
					/ 4</span> <img class="cha" src="images/CAR_EM2.jpg"
				style="width: 580px; height: 380px"> <span
				style="text-align: center; display: none" class="text">Caption
					Two</span>
		</span> <span class="mySlides fade"> <span class="numbertext">3
					/ 4</span> <img class="cha" src="images/CAR_EM3.PNG"
				style="width: 580px; height: 380px"> <span
				style="text-align: center; display: none" class="text">Caption
					Three</span>
		</span> <span class="mySlides fade"> <span class="numbertext">4
					/ 4</span> <img class="cha" src="images/CAR_EM5.PNG"
				style="width: 580px; height: 380px"> <span
				style="text-align: center; display: none" class="text">Caption
					Three</span>
		</span>
		</span> <span style="text-align: center; display: none" id="moveButtons">
			<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
			<span class="dot"></span>
		</span> <span id="aboutC"><p id="contentp">ValvData is an
				outsourced product development and technology services company,
				specialising in building massively scalable web and mobile based
				products. We bring in the expertise, processes and methods to help
				the clients take their products to the market fast and ensure
				certainty of outcome.Our primary focus is on public safety and 
				Emergency Services , Web Designing , Application Development on Mobile and WebBased </p></span>
		<script>
			var slideIndex = 0;
			showSlides();

			function showSlides() {
				var i;
				var slides = document.getElementsByClassName("mySlides");
				var dots = document.getElementsByClassName("dot");
				for (i = 0; i < slides.length; i++) {
					slides[i].style.display = "none";
				}
				slideIndex++;
				if (slideIndex > slides.length) {
					slideIndex = 1
				}
				for (i = 0; i < dots.length; i++) {
					dots[i].className = dots[i].className
							.replace(" active", "");
				}
				slides[slideIndex - 1].style.display = "block";
				dots[slideIndex - 1].className += " active";
				setTimeout(showSlides, 2000); // Change image every 2 seconds
			}
		</script>
	</div>
	<div class="hidden" id="second">
		<%@include file="ourBussiness.jsp"%>
	</div>
	<div class="hidden" id="third">
		<%@include file="innovation.jsp"%>
	</div>
	<div class="hidden" id="fourth">
		<%@include file="careers.jsp"%>
	</div>
	<div class="hidden" id="fifth">
		<%@include file="workAtValvData.jsp"%>
	</div>
	<div class="hidden" id="seventh">
		<%@include file="contact.jsp"%>
	</div>
	
</body>
</html>