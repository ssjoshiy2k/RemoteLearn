package com.pict.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pict.dao.LoginDao;

public class Login extends HttpServlet
{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		LoginDao dao = new LoginDao();
		String username = request.getParameter("Username");
		System.out.println(username);
		String password = request.getParameter("Password");
		// String groupname="L10";
		if (username.length() == 3)
		{
			if (!dao.check(username, password))
			{
				response.sendRedirect("LoginUnsuccessful.jsp");
			} else
			{
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				// session.setAttribute("groupname",groupname);
				response.sendRedirect("ILoginTeacher.jsp?type=1");

			}
		} else if (username.equals("admin") && password.equals("123456"))
		{
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			// session.setAttribute("groupname",groupname);
			response.sendRedirect("ILoginTeacher.jsp?type=2");

		} else
		{
			if (!dao.check(username, password))
			{
				response.sendRedirect("LoginUnsuccessful.jsp");
			} else
			{
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				// session.setAttribute("groupname",groupname);
				response.sendRedirect("StudLoginSuccessful.jsp");

			}

		}

	}

}