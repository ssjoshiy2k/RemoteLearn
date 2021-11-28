package com.pict.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

import com.pict.dao.DeleteRow;

/**
 *
 * @author sameer
 */
public class DeleteEntry extends HttpServlet
{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{

		int groupcode = Integer.parseInt(request.getParameter("groupcode"));

		System.out.println("GroupCode is " + groupcode);
		DeleteRow dr = new DeleteRow();
		try
		{
			dr.deleteGroup(groupcode);
		} catch (SQLException ex)
		{
			Logger.getLogger(DeleteEntry.class.getName()).log(Level.SEVERE, null, ex);
		}
		response.sendRedirect("GroupTable.jsp");

	}

}
