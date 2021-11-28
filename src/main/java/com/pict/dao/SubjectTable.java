package com.pict.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

public class SubjectTable extends HttpServlet
{
	public static String subjectname;
	public static PrintWriter out;
	public static Connection conn;
	public static ResultSet res;
	// public static int Approved,SubjectCode,GroupCode, Rollno,Marks,counter, d=0;
	PreparedStatement stmt;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, JSONException
	{
		out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		// if(request.getParameter("classname") == null) out.println("a");
		String cn = request.getParameter("subjectname");
		// out.println(cn);

		JSONObject SUBJECTNAME;

		ConnectDatabase cd = new ConnectDatabase();
		conn = cd.getConnection();

		// out.println(sch);

		SUBJECTNAME = new JSONObject("{\"\":{\"\":" + cn + "}}");

		String str = cn;
		String findStr = "SubjectName";
		int lastIndex = 0;
		int count = 0;

		while (lastIndex != -1)
		{

			lastIndex = str.indexOf(findStr, lastIndex);

			if (lastIndex != -1)
			{
				count++;
				lastIndex += findStr.length();
			}
		}
		// out.println(count);
		// out.println(cn);

		int i = 0;
		while (i < count)
		{
			subjectname = SUBJECTNAME.getJSONObject("").getJSONArray("").getJSONObject(i).getString("SubjectName");
			// out.println(classname);
			i++;
			updatedb();
		}

		response.sendRedirect("Welcome1.jsp");
	}

	public void updatedb() throws SQLException
	{

		String q;
		q = "INSERT INTO SubjectTable (SubjectName) SELECT * FROM (SELECT ?) AS tmp WHERE NOT EXISTS (  SELECT SubjectName FROM SubjectTable WHERE SubjectName = ?) LIMIT 1";
		stmt = conn.prepareStatement(q);
		stmt.setString(1, subjectname);
		stmt.setString(2, subjectname);
		// out.println(q);

		stmt.execute();
	}

	public ResultSet giveresult() throws SQLException
	{

		conn = ConnectDatabase.getConnection();
		String q;
		q = "Select * from SubjectTable";
		stmt = conn.prepareStatement(q);
		return stmt.executeQuery();
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
	// + sign on the left to edit the code.">
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
			processRequest(request, response);
		} catch (SQLException ex)
		{
			Logger.getLogger(SubjectTable.class.getName()).log(Level.SEVERE, null, ex);
		} catch (JSONException ex)
		{
			Logger.getLogger(SubjectTable.class.getName()).log(Level.SEVERE, null, ex);
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
			processRequest(request, response);
		} catch (SQLException ex)
		{
			Logger.getLogger(SubjectTable.class.getName()).log(Level.SEVERE, null, ex);
		} catch (JSONException ex)
		{
			Logger.getLogger(SubjectTable.class.getName()).log(Level.SEVERE, null, ex);
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
