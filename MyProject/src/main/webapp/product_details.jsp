<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp"  %>
<!DOCTYPE html>
<html lang="en">
   <head>

   </head>
   <!-- body -->
   <body class="main-layout footer_to90 news_page">
    
      <div class="blue_bg">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>Product Details</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- news section -->
      <div class="news">
         <div class="container">
            <div class="row">
            
            <%
               boolean wishlist_flag=false;
               boolean cart_flag=false;
               int pid=Integer.parseInt(request.getParameter("pid"));
             try{
               int uid=u.getId();  	
               wishlist_flag=WishlistDao.checkWishlistByUser(uid, pid);
             }catch(Exception e){
            	 e.printStackTrace();
             }
             try{
                 int uid=u.getId();  	
                 cart_flag=CartDao.checkCartByUser(uid, pid);
               }catch(Exception e){
              	 e.printStackTrace();
               }

               product p=ProductDao.getproductbyPid(pid);
            %>
               <div class="col-md-12 margin_top40" style="margin-top: -50px" >
                  <div class="row d_flex">
                     <div class="col-md-5">
                        <div class="news_img">
                           <figure><img src="product_images/<%=p.getProduct_image() %>" style= "width=300px;height=300px"></figure>
                        </div>
                     </div>
                     <div class="col-md-7">
                        <div class="news_text">
                           <h3><%=p.getProduct_category() %></h3>
                           <span><%=p.getProduct_name() %></span>
                           <br><br> 
                           <span>Price: <%=p.getProduct_price() %></span> 
                           <p>Description: <%=p.getProduct_desc() %></p>
                           <br><br><br> 
                           <%
                              if(u!= null){
                           %>
                           <%
                           try{
                              if(wishlist_flag==false){
                           %>
                           	<a href="add_to_wishlist.jsp?uid=<%=u.getId()%>&pid=<%=p.getPid() %>" ><input type="button" name="action" value="Add To Wishlist" class="btn btn-primary"></a>
                           
                           <% 
                              }
                              else{
                            %>
                           <a href="remove_from_wishlist.jsp?uid=<%=u.getId()%>&pid=<%=p.getPid() %>" ><input type="button" name="action" value="Remove From Wishlist " class="btn btn-danger"></a>
                            
                            <% 	  
                              }
                           }catch(Exception e){
                        	   e.printStackTrace();
                           }
                           
                           try{
                               if(cart_flag==false){
                            %>
                            	<a href="add_to_cart.jsp?uid=<%=u.getId()%>&pid=<%=p.getPid() %>" ><input type="button" name="action" value="Add To Cart" class="btn btn-warning"></a>
                            
                            <% 
                               }
                               else{
                             %>
                            <a href="remove_from_cart.jsp?uid=<%=u.getId()%>&pid=<%=p.getPid() %>" ><input type="button" name="action" value="Remove From Cart " class="btn btn-danger"></a>
                             
                             <% 	  
                               }
                            }catch(Exception e){
                         	   e.printStackTrace();
                            }
                           %>
                           <%
                              }else
                              {
                           %>
   	                    	<a href="login.jsp"><input type="button" name="action" value="Login for more" class="btn btn-success"></a>
                           <%
                              }
                           %>
                        </div>
                     </div>
                  </div>
               </div>
              
               
            </div>
         </div>
      </div>
      <!-- end news section -->
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
                        <p>© 2019 All Rights Reserved. Design by<a href="https://html.design/"> Free Html Templates</a></p>
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

