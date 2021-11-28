package com.pict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pict.dao.DeleteTable;

public class DeleteAssign extends HttpServlet
{

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException
	{

		String assignName = "A" + request.getParameter("AssignNumber");
		assignName = assignName.trim();
		System.out.println("aname is " + assignName);
		String usrname = request.getParameter("username");

		DeleteTable dt = new DeleteTable();
		dt.deleteAssign(usrname, assignName);
		PrintWriter out = response.getWriter();

		response.sendRedirect("LoginSuccessful.jsp?success=2");

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			processRequest(request, response);
		} catch (SQLException ex)
		{
			Logger.getLogger(DeleteAssign.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			processRequest(request, response);
		} catch (SQLException ex)
		{
			Logger.getLogger(DeleteAssign.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	@Override
	public String getServletInfo()
	{
		return "Short description";
	}// </editor-fold>

}
