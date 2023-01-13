package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Cart;
import com.bean.Wishlist;
import com.bean.user;
import com.dao.CartDao;
import com.dao.UserDao;
import com.dao.WishlistDao;
import com.service.Services;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password="dusnsedgpwukydro"; 
		String action=request.getParameter("action");
		
		
		if(action.equalsIgnoreCase("sign up")) {
			
			boolean flag=UserDao.checkEmail(request.getParameter("email"));
			if(flag==true) {
				request.setAttribute("msg", "Email is Already Registered"); 
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else if(request.getParameter("password").equals(request.getParameter("cpassword"))) {
				
			user u=new user();
			u.setFname(request.getParameter("fname"));
			u.setLname(request.getParameter("lname"));
			u.setEmail(request.getParameter("email"));
			u.setMobile(request.getParameter("mobile"));
			u.setAddress(request.getParameter("address"));
			u.setPassword(request.getParameter("password"));
			u.setUsertype(request.getParameter("usertype"));;
			UserDao.signupUser(u);
			request.setAttribute("msg", "User Sign up Successfully");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
			else {
				request.setAttribute("msg", "Password & Confirm Password does not Matched");
				request.getRequestDispatcher("signup.jsp").forward(request, response);

			}
	}
		else if(action.equalsIgnoreCase("login")){
			
			user u=UserDao.loginUser(request.getParameter("email"));
			if(u!=null) {
				if(u.getPassword().equals(request.getParameter("password"))) {
					
					HttpSession session=request.getSession();
					session.setAttribute("u", u);
					if(u.getUsertype().equals("user")) {
					List<Wishlist> list=WishlistDao.getWishlistByUser(u.getId());
					session.setAttribute("wishlist_count", list.size());
					List<Cart> list1=CartDao.getCartByUser(u.getId());
					session.setAttribute("cart_count", list1.size());
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
					else {
						request.getRequestDispatcher("seller_index.jsp").forward(request, response);

					}
					}
				else {
					request.setAttribute("msg", "Incorrect Password");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			}
			else {
				request.setAttribute("msg", "Email is not Registered");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("change password")) {
			HttpSession session=request.getSession();
			user u=(user)session.getAttribute("u");
			if(u.getPassword().equals(request.getParameter("old_password"))) {
				if(request.getParameter("new_password").equals(request.getParameter("cnew_password"))) {
					UserDao.changePassword(u.getEmail(), request.getParameter("new_password"));
					response.sendRedirect("logout.jsp");
				}
				else {
					request.setAttribute("msg", "New Password & Confirm Password Does Not Matched ");
					if(u.getUsertype().equals("user")) {
						request.getRequestDispatcher("change_password.jsp").forward(request, response);

					}else {
					request.getRequestDispatcher("seller_change_password.jsp").forward(request, response);
				}
				}
			}
			else {
				request.setAttribute("msg", "Old Password Does Not Matched ");
				if(u.getUsertype().equals("user")) {
					request.getRequestDispatcher("change_password.jsp").forward(request, response);

				}else {
				request.getRequestDispatcher("seller_change_password.jsp").forward(request, response);
			}
			}
		}
		else if(action.equalsIgnoreCase("send otp")) {
			boolean flag=UserDao.checkEmail(request.getParameter("email"));
			if(flag==true) {
				Random t = new Random();
		    	int minRange = 1000, maxRange= 9999;
	        	int value = t.nextInt(maxRange - minRange) + minRange;
	        	Services.sendMail(request.getParameter("email"), value);
	        	request.setAttribute("email", request.getParameter("email"));
	        	request.setAttribute("otp", value);
	        	request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
			else {
				request.setAttribute("msg", "Email Not Registered ");
				request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("Verify otp")) {
			int otp=Integer.parseInt(request.getParameter("otp"));
			int uotp=Integer.parseInt(request.getParameter("uotp"));
			String email=request.getParameter("email");
			
			if(otp==uotp) {
				request.setAttribute("email", email);
				request.getRequestDispatcher("new_password.jsp").forward(request, response);
			}
			else {
				request.setAttribute("msg", "Invalid OTP");
				request.setAttribute("email", email);
	        	request.setAttribute("otp", otp);
	        	request.getRequestDispatcher("otp.jsp").forward(request, response);
			}

		}
		else if(action.equalsIgnoreCase("update password")) {
			String email=request.getParameter("email");
			String new_password=request.getParameter("new_password");
			String cnew_password=request.getParameter("cnew_password");

			if(new_password.equals(cnew_password)) {
				UserDao.changePassword(email, new_password);
				request.setAttribute("msg", "Paswword Updated Successfully");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else {
				request.setAttribute("msg", "Password & Confirm  Password Does Not Matched ");
				request.setAttribute("email", email);
	        	request.getRequestDispatcher("new_password.jsp").forward(request, response);
			}
			
		}

	}}
