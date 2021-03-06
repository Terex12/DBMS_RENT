<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.*" %>
<!DOCTYPE html>
<html>
<head>
<%
	ProductInfo pd = (ProductInfo) request.getAttribute("product");
	UserInfo u = (UserInfo) session.getAttribute("userinfo");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./CSS/css.css" />
<title>iCart HTML Version</title>
</head>
<body>
<div class="menu">
<ul>
<li style="width:0px;"><a></a></li>
<li><a href="search.jsp" class="home">Home</a></li>
<li><a href="account.html" class="account">My Account</a></li>
<li><a href="cat.html" class="cart">Shopping Cart</a></li>
<li style="float:right;"><a href="login.html" class="login">Login/Register</a></li>
<!--<li style="float:right;"><a class="register">Register</a></li>-->
</ul>
</div>


<div class="header">
<div class="logo_img"><a href="index.html"><img src="images/Florida_Gators_script_logo.png" alt="Site Name" width="200" height="60"></a></div></div>

<div id="menu">
</div>




<div style="width:1000px;margin: 0 auto;margin-top:10px;">
<div class="linktree">
        <a href="#">Home</a>
         &raquo; <a href="#">Item Details</a>
    </div>

  <h1 style="margin-top:-10px;"><%=pd.getProName()%></h1>
</div>

<div id="container_bg">
<style type="text/css">

.linktree {
	margin-top:0px;
	margin-bottom:10px;
	margin-left:3px;
}

.linktree a {
	color:#666;
	text-decoration:none;
	font-size:11px;
}

#menu {
	border-radius:5px;
}
</style>



<!--<div id="column-left">
<div class="box">
  <div class="box-heading_left">Categories</div>
  <div class="box-content" style="background:none;border:none;">
    <div class="box-category">
<ul>
<li><a href="#">VCD</a></li>
<li><a href="#">Laptops &amp; Notebooks (5)</a></li>
<li><a href="#">Components (2)</a></li>
<li><a href="#">Software (0)</a></li>
<li><a href="#">Phones &amp; PDAs (3)</a></li>
<li><a href="#">Cameras (2)</a></li>
<li><a href="#">MP3 Players (4)</a></li>
</ul>
</div>
</div>
</div>
</div>-->
 
<div id="content">
<div class="block-white"> 
<div class="block-content">
           
</div>
<div class="separator"></div>
<div class="block-content">
<div class="product-info">
                                	
<div class="left">                		                			
<div class="image">
<a href="#" title="item" >
<form action="CartS?flag=0&proid=<%=pd.getProId()%>" method="post">
		  <div>
			  <table>
			    <tr>
			      <td >
			        <img src="PIC/<%=pd.getPic()%>" />			        </td>
					</td>
			    </tr>
			    
            </table>
		  </div>
		  <input type="submit" value="Add to Cart" />
		</form></a>
</div>               		                        
</div>

  
<div id="tab-information" class="tab-content">
<div id="information"></div>
			
	
<div class="description">
<span>&raquo;&nbsp;Product Code:</span> <%=pd.getProId()%><br />
<span>&raquo;&nbsp;Stock:</span> <%=pd.getStock()%> <br /> 
<span>&raquo;&nbsp;Sold:</span> <%=pd.getSold()%>  <br />
<br />
<br />               
</div>
                            
<div class="price">
<span class="price-new">Price <%=pd.getPrice()%></span>
</div>
<br>

<div class="review">
<div>
<img src="images/stars.png" alt="0 reviews" />&nbsp;&nbsp;
<%=pd.getRate()%> 
</div>
</div>
<div>
No Comments</div>
</div>

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
		<p>A group of Computer Science major student from University of Florida developing a website implementing Oracle database. </p>
        <p>The group includes: Liu Zhengzheng, Xu Yufan, Wang Xi, Jiang Li</p>
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
<div class="clearfix"></div>
		</div>
        
</div>
</div>

</body>
</html>
