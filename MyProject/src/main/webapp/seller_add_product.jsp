<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="seller_header.jsp"  %>
<!DOCTYPE html>
<html lang="en">
   <head>
   </head>
   <!-- body -->
   <body class="main-layout footer_to90 contact_page">
      <!-- banner -->
      <div class="blue_bg">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>Add Product</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- contact section -->
      <div id="contact" class="contact">
         <div class="con_bg">
            <div class="container">
               <div class="row">
                  <div class="col-md-10 offset-md-1">
                   <%
                     if(request.getAttribute("msg")!=null){
                    	 out.println(request.getAttribute("msg"));
                     }
                  
                  %>
                     <form id="request" class="main_form" method="post" action="ProductController" enctype="multipart/form-data">
                     <input type="hidden" name="uid" value="<%=u.getId() %>">
                        <div class="row">
                         <div class="col-md-12 col-sm-12">
                         <select name="product_category" class="contactus" >
                         <option>----Select Product Category---</option>
                         <option value="Shoes">Shoes</option>
                         <option value="Fashion">Fashion</option>
                          <option value="Accessories">Accessories</option>
                         
                         </select>
                           </div>
                           <div class="col-md-6 col-sm-6">
                              <input class="contactus" placeholder="Product Name" type="text" name="product_name"> 
                           </div>
                           <div class="col-md-6 col-sm-6">
                              <input class="contactus" placeholder="Product Price" type="text" name="product_price"> 
                           </div>
                           <div class="col-md-12 col-sm-12">
                              <input class="contactus" placeholder="Product Description" type="text" name="product_desc">                          
                           </div>
                          
                           <div class="col-md-6 col-sm-6">
                              <input class="contactus" type="file" name="product_image">                          
                           </div>
                          
                           <div class="col-md-12">
                              <button class="send_btn" type="submit" name="action" value="Add Product">Add Product</button>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end contact section -->
      <!--  footer -->
      <footer>
         <div class="footer">
            <div class="container">
               <div class="row">
                  <div class="col-md-3">
                     <div class="inror_box">
                        <h3>INFORMATION </h3>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable</p>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="inror_box">
                        <h3>MY ACCOUNT </h3>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable</p>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="inror_box">
                        <h3>ABOUT  </h3>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable</p>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="inror_box">
                        <h3>CONTACTS  </h3>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable</p>
                     </div>
                  </div>
               </div>
            </div>
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <p>� 2019 All Rights Reserved. Design by<a href="https://html.design/"> Free Html Templates</a></p>
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

