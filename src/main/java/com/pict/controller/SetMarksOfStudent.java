package com.pict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.pict.dao.ConnectDatabase;

//@WebServlet(urlPatterns = { "/SetMarksOfStudent" })
public class SetMarksOfStudent extends HttpServlet
{
	public static PrintWriter out;
	ConnectDatabase cd = new ConnectDatabase();
	PreparedStatement stmt;
	public static int SubCode, Rollno, Marks1, Marks2;
	public static String rn, marks1, marks2;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException, java.text.ParseException, ClassNotFoundException, SQLException, JSONException
	{
		out = response.getWriter();
		HttpSession ses = request.getSession();

		SubCode = (int) ses.getAttribute("subcode");
		// out.println(SubCode);

		rn = request.getParameter("rollno");
		// out.println(rn + "\n");

		marks1 = request.getParameter("marks1");
		// out.println(marks + "\n");

		marks2 = request.getParameter("marks2");

		JSONObject ROLLNO, MARKS1, MARKS2;

		Connection conn = cd.getConnection();

		conn = cd.getConnection();

		ROLLNO = new JSONObject("{\"\":{\"\":" + rn + "}}");
		MARKS1 = new JSONObject("{\"\":{\"\":" + marks1 + "}}");
		MARKS2 = new JSONObject("{\"\":{\"\":" + marks2 + "}}");

		/// out.println(MARKS);
		// out.println(ROLLNO);

		int i = 0;
		while (i < 80)
		{
			Rollno = Integer.parseInt(ROLLNO.getJSONObject("").getJSONArray("").getJSONObject(i).getString("Roll No"));
			Marks1 = Integer
					.parseInt(MARKS1.getJSONObject("").getJSONArray("").getJSONObject(i).getString("Unit Test 1"));
			Marks2 = Integer
					.parseInt(MARKS2.getJSONObject("").getJSONArray("").getJSONObject(i).getString("Unit Test 2"));

			updatedb();
			i++;
		}

		response.sendRedirect("Welcome1.jsp");

	}

	public void updatedb() throws SQLException, ClassNotFoundException
	{
		Connection conn = cd.getConnection();
		String q = "";
		q += "update UnitTest set UT1=?,UT2=? where RollNo = ? and SubjectCode = ?";

		stmt = conn.prepareStatement(q);
		stmt.setInt(1, Marks1);
		stmt.setInt(2, Marks2);
		stmt.setInt(3, Rollno);
		stmt.setInt(4, SubCode);
		// out.println(q);

		stmt.execute();

	}

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			try
			{
				processRequest(request, response);
			} catch (ClassNotFoundException | SQLException ex)
			{
				// Logger.getLogger(UpdateInfo.class.getName()).log(Level.SEVERE, null, ex);
			} catch (JSONException ex)
			{
				// Logger.getLogger(SetMarksOfStudent.class.getName()).log(Level.SEVERE, null,
				// ex);
			}
		} catch (java.text.ParseException ex)
		{
			// Logger.getLogger(UpdateInfo.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			try
			{
				processRequest(request, response);
			} catch (ClassNotFoundException | SQLException ex)
			{
				// Logger.getLogger(UpdateInfo.class.getName()).log(Level.SEVERE, null, ex);
			} catch (JSONException ex)
			{
				// Logger.getLogger(SetMarksOfStudent.class.getName()).log(Level.SEVERE, null,
				// ex);
			}
		} catch (java.text.ParseException ex)
		{
			// Logger.getLogger(UpdateInfo.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo()
	{
		return "Short description";
	}// </editor-fold>

}
