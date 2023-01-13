<%@page import="java.util.Random"%>
<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
 %>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<!-- body -->
<body class="main-layout footer_to90 project_page">

	<div class="blue_bg">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="titlepage">
						<%
                  List<Cart> list=CartDao.getCartByUser(u.getId());
				  if(list.size()>0){
                  %>
						<h2>My Cart</h2>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- project section -->
	<%
      %>
	<div id="project" class="project">
		<div class="container">

			<%
          		if(request.getAttribute("msg")!=null){
						out.println(request.getAttribute("msg"));          			
          		}
          
          %>
			<div class="row">
				<div class="product_main">

					<%
               int net_price=0;
               for(Cart c:list){
            	   net_price=net_price+c.getTotal_price();
            	   product p=ProductDao.getproductbyPid(c.getPid()); 
            %>

					<div class="project_box ">
						<div class="dark_white_bg">
							<img src="product_images/<%=p.getProduct_image() %>" alt="#" />
						</div>
						<h3><%=p.getProduct_desc() %>
						</h3>
						<h3>
							Price : Rs.
							<%=c.getProduct_price() %></h3>
						<h3>
							Quantity :
							<form name="change_qty" method="post" action="change_qty.jsp">
								<input type="hidden" name="cid" value="<%=c.getCid() %>">
								<input type="number" name="product_qty"
									value="<%=c.getProduct_qty() %>" min="1" max="10"
									onchange="this.form.submit();">
						</h3>
						</form>
						<h3>
							Total Price : Rs.
							<%=c.getTotal_price() %></h3>
						<br>
						<br>
						<br> <a href="product_details.jsp?pid=<%=p.getPid() %>"><input
							type="button" value="DETAILS" class="btn btn-primary"></a>
						<%--  <a href="seller_product_edit.jsp?pid=<%=p.getPid() %>&uid=<%=u.getId() %>" ><input type="button" value="EDIT" class="btn btn-primary"></a>
                     <a href="seller_product_delete.jsp?pid=<%=p.getPid() %>&uid=<%=u.getId() %>" ><input type="button" value="DELETE" class="btn btn-danger"></a> --%>

					</div>


					<%
               }
            %>


					
				<h2>
					Net Price :
					<%=net_price %></h2>

				<form method="post" action="pgRedirect.jsp">
					<table border="1">
						<tbody>
							<tr>
								<th>S.No</th>
								<th>Label</th>
								<th>Value</th>
							</tr>
							<tr>
								<td>1</td>
								<td><label>ORDER_ID::*</label></td>
								<td><input id="ORDER_ID" tabindex="1" maxlength="20"
									size="20" name="ORDER_ID" autocomplete="off"
									value="ORDS_<%= randomInt %>"></td>
							</tr>
							<tr>
								<td>2</td>
								<td><label>CUSTID ::*</label></td>
								<td><input id="CUST_ID" tabindex="2" maxlength="30"
									size="12" name="CUST_ID" autocomplete="off" value="<%= u.getId()%>_<%=u.getFname()%>"></td>
							</tr>
							<tr>
								<td>3</td>
								<td><label>INDUSTRY_TYPE_ID ::*</label></td>
								<td><input id="INDUSTRY_TYPE_ID" tabindex="4"
									maxlength="12" size="12" name="INDUSTRY_TYPE_ID"
									autocomplete="off" value="Retail"></td>
							</tr>
							<tr>
								<td>4</td>
								<td><label>Channel ::*</label></td>
								<td><input id="CHANNEL_ID" tabindex="4" maxlength="12"
									size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
								</td>
							</tr>
							<tr>
								<td>5</td>
								<td><label>txnAmount*</label></td>
								<td><input title="TXN_AMOUNT" tabindex="10" type="text"
									name="TXN_AMOUNT" value="<%=net_price%>"></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td><input value="CheckOut" type="submit" onclick="" class=btn btn-primary></td>
							</tr>
						</tbody>
					</table>
					* - Mandatory Fields
				</form>
				
						<%
				  }
				  else{
					  %>
						<h2>No Products In Cart</h2>

						<% 
				  }
                     %>
			</div>
		</div>

	</div>
	<!-- end project section -->
	<!--  footer -->
	<footer>
		<div class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="inror_box">
							<h3>INFORMATION</h3>
							<p>There are many variations of passages of Lorem Ipsum
								available, but the majority have suffered alteration in some
								form, by injected humour, or randomised words which don't look
								even slightly believable</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="inror_box">
							<h3>MY ACCOUNT</h3>
							<p>There are many variations of passages of Lorem Ipsum
								available, but the majority have suffered alteration in some
								form, by injected humour, or randomised words which don't look
								even slightly believable</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="inror_box">
							<h3>ABOUT</h3>
							<p>There are many variations of passages of Lorem Ipsum
								available, but the majority have suffered alteration in some
								form, by injected humour, or randomised words which don't look
								even slightly believable</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="inror_box">
							<h3>CONTACTS</h3>
							<p>There are many variations of passages of Lorem Ipsum
								available, but the majority have suffered alteration in some
								form, by injected humour, or randomised words which don't look
								even slightly believable</p>
						</div>
					</div>
				</div>
			</div>
			<div class="copyright">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<p>
								� 2019 All Rights Reserved. Design by<a
									href="https://html.design/"> Free Html Templates</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- end footer -->
	<!-- Javascript files-->
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.0.0.min.js"></script>
	<!-- sidebar -->
	<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>

