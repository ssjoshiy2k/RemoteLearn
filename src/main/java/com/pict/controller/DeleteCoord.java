package com.pict.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.pict.dao.DeleteRow;

public class DeleteCoord extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{

		String username = request.getParameter("username");

		// System.out.println("GroupCode is "+groupcode );
		DeleteRow dr = new DeleteRow();
		try
		{
			dr.deleteCoord(username);
		} catch (SQLException ex)
		{
			System.out.println("Caught an exception in DeleteCoord");
			// Logger.getLogger(DeleteEntry.class.getName()).log(Level.SEVERE, null, ex);
		}
		response.sendRedirect("SubjectCord.jsp");

	}

}
