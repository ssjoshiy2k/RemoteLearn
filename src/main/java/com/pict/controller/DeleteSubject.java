package com.pict.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pict.dao.DeleteRow;

public class DeleteSubject extends HttpServlet
{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{

		int subjectCode = Integer.parseInt(request.getParameter("subjectcode"));

		DeleteRow dr = new DeleteRow();
		try
		{
			dr.deleteSubject(subjectCode);
		} catch (SQLException ex)
		{
			System.out.println("Exception caught at Delete Subject..");
			// Logger.getLogger(DeleteAllot.class.getName()).log(Level.SEVERE, null, ex);
		}
		response.sendRedirect("SubjectTable.jsp");
	}
}
