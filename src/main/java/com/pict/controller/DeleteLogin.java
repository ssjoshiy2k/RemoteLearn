package com.pict.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pict.dao.DeleteRow;

public class DeleteLogin extends HttpServlet
{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{

		String username = request.getParameter("username");

		DeleteRow dr = new DeleteRow();
		try
		{
			dr.deleteLogin(username);
		} catch (SQLException ex)
		{
			// Logger.getLogger(DeleteAllot.class.getName()).log(Level.SEVERE, null, ex);
			System.out.println("Exception caught at DeleteLogin. ");
		}
		response.sendRedirect("LoginTable.jsp");
	}
}
