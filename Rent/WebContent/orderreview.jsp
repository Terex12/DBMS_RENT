<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.*" import="java.util.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<%
		LinkedList<CartInfo> cart = (LinkedList<CartInfo>) session.getAttribute("Shoppingcart");
		UserInfo u = (UserInfo) session.getAttribute("userinfo");
%>
<link rel="stylesheet" type="text/css" href="./CSS/css.css" />
<title>GatorRental HTML Version</title>
</head>
<body>
<div class="menu">
<ul>
<li style="width:0px;"><a></a></li>
<li class="active"><a href="index.html" class="home">Home</a></li>
<li style="float:right;"><a href="login.jsp" class="login">Login</a></li>
<!--<li style="float:right;"><a class="register">Register</a></li>-->
</ul>
</div>


<div class="header">
<div class="logo_img"><a href="index.html"><img src="images/Florida_Gators_script_logo.png" alt="Site Name" width="200" height="60"></a></div></div>

<br>
<br>
<br>
<div>
<form action="OrderS?flag=0" method="post">
<table width="600" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#CCCCCC" style="margin-left:30%;">
				<tr>
					<td height="25">
						<div align="center">Product Name			</div></td>
					<td>
						<div align="center">Price					</div></td>
					<td>
						<div align="center">Amount					</div></td>
					<td>
						<div align="center">Sum					</div></td>
					
				</tr>
				<%
						for (CartInfo c : cart) {
					%>
					<tr>
						<td height="25" bgcolor="#FFFFFF">
							<%=c.getProductName()%>					  </td>
						<td bgcolor="#FFFFFF">
							<%=c.getPrice()%>					  </td>
						<td bgcolor="#FFFFFF">
							<%=c.getQuantity()%>" 				  </td>
						<td bgcolor="#FFFFFF">
							<%=c.getQuantity() * c.getPrice()%>					  </td>
					</tr>
					<%
						}
					%>
</table>

<!-- add the final sum -->

 <input type="submit" value="Make the Order" style="margin-left:30%;" />		
</form>	

</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="icart-footer">
<div class="icart-footer-top">
	<div style="width:1000px; margin:0 auto;">	
	</div>
</div>
<div class="icart-footer-container">
	<div class="column_footer" style="width:350px;">
		<h3>About Us</h3>
<div class="footer_description">
		<p>A group of Computer Science major student from University of Florida developing a website implementing Oracle database. </p>
		<p>The group includes: Liu Zhengzheng, Xu Yufan, Wang Xi, Jiang Li</p>
</div>
	</div>
	
	<div class="column_footer">
		<h3>Customer Service</h3>
		<ul>
      		<li><a href="#">Delivery Information</a></li>
      		<li><a href="#">Privacy Policy</a></li>
      		<li><a href="#">Terms &amp; Conditions</a></li>
      		<li><a href="#">Contact Us</a></li>
      		<li><a href="#">Returns</a></li>
      		<li><a href="#">Site Map</a></li>
		</ul>
	</div>
	
	<div class="column_footer" style="width:150px;">
		<h3>Extras</h3>
		<ul>
      		<li><a href="#">Brands</a></li>
      		<li><a href="#">Gift Vouchers</a></li>
      		<li><a href="#">Affiliates</a></li>
      		<li><a href="#">Specials</a></li>
		</ul>
	</div>	
	<div class="column_footer" style="width:150px;">
		<h3>My Account</h3>
		<ul>
      		<li><a href="#">My Account</a></li>
      		<li><a href="#">Order History</a></li>
      		<li><a href="#">Wish List</a></li>
      		<li><a href="#">Newsletter</a></li>
		</ul>
</div>
		
	<div class="column_footer" style="margin-right:0px;">
		<h3>Social</h3>
		<ul class="social">
			<li class="twitter"><a href="../../twitter.com/twitter">Twitter Username</a></li>
			<li class="facebook"><a href="../../facebook.com/Username/default.htm">Facebook</a></li>
			<li class="rss"><a href="#">RSS Feed</a></li>
		</ul>				
	</div>		
	<div class="clearfix"></div>
  </div>		
	<div class="icart-footer-bottom">
		<div style="width:1000px; margin:0 auto;">				
		<div class="icart-logo-footer"></div>	
			<ul>
			<li style="float:right;padding-top:10px;list-style:none;"></li>
			</ul>		
		<div class="clearfix"></div>
		</div>

</div>
</div>

</body>
</html>