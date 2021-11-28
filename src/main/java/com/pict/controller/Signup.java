package com.pict.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pict.dao.LoginDao;

public class Signup extends HttpServlet
{

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{

		String first_name = request.getParameter("first_name");
		String middle_name = request.getParameter("middle_name");
		String last_name = request.getParameter("last_name");
		String username = request.getParameter("UserID");
		String password = request.getParameter("Password");

		System.out.println("First name is " + first_name);

		System.out.println("Username : " + username);
		// System.out.println("fdvbajdf");
		LoginDao dao = new LoginDao();

		if (dao.check(username, password))
		{
			response.sendRedirect("LoginSuccessful.jsp");
		} else
		{
			dao.insert(first_name, middle_name, last_name, username, password);
			response.sendRedirect("Login.jsp");
		}

	}

}