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

public class GroupTable extends HttpServlet
{
	public static String GroupName;
	public static PrintWriter out;
	public static Connection conn;
	public static ResultSet res;
	public static int GroupStartRollNo, GroupEndRollNo;
	PreparedStatement stmt;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, JSONException
	{
		out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		// if(request.getParameter("classname") == null) out.println("a");
		String cn = request.getParameter("gn");
		String gsn = request.getParameter("gsn");
		String gen = request.getParameter("gen");
		// out.println(cn);

		JSONObject GROUPNAME, GROUPSTART, GROUPEND;

		ConnectDatabase cd = new ConnectDatabase();
		conn = cd.getConnection();

		// out.println(sch);

		GROUPNAME = new JSONObject("{\"\":{\"\":" + cn + "}}");
		GROUPSTART = new JSONObject("{\"\":{\"\":" + gsn + "}}");
		GROUPEND = new JSONObject("{\"\":{\"\":" + gen + "}}");

		String str = cn;
		String findStr = "GroupName";
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
			GroupName = GROUPNAME.getJSONObject("").getJSONArray("").getJSONObject(i).getString("GroupName");
			GroupStartRollNo = Integer.parseInt(
					GROUPSTART.getJSONObject("").getJSONArray("").getJSONObject(i).getString("GroupStartRollNo"));
			GroupEndRollNo = Integer
					.parseInt(GROUPEND.getJSONObject("").getJSONArray("").getJSONObject(i).getString("GroupEndRollNo"));

			// out.println(classname);
			i++;
			updatedb();
		}
		response.sendRedirect("Welcome1.jsp");

	}

	public void updatedb() throws SQLException
	{

		String q;
		q = "INSERT INTO GroupTable (GroupName, StartRollNo, EndRollNo) SELECT * FROM (SELECT ?, ?, ?) AS tmp WHERE NOT EXISTS (SELECT GroupName FROM GroupTable WHERE GroupName = ? )LIMIT 1";
		stmt = conn.prepareStatement(q);
		stmt.setString(1, GroupName);
		stmt.setInt(2, GroupStartRollNo);
		stmt.setInt(3, GroupEndRollNo);
		stmt.setString(4, GroupName);

		// out.println(q);

		stmt.execute();
	}

	public ResultSet giveresult() throws SQLException
	{

		conn = ConnectDatabase.getConnection();
		String q;
		q = "Select * from GroupTable";
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
			Logger.getLogger(GroupTable.class.getName()).log(Level.SEVERE, null, ex);
		} catch (JSONException ex)
		{
			Logger.getLogger(GroupTable.class.getName()).log(Level.SEVERE, null, ex);
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
			Logger.getLogger(GroupTable.class.getName()).log(Level.SEVERE, null, ex);
		} catch (JSONException ex)
		{
			Logger.getLogger(GroupTable.class.getName()).log(Level.SEVERE, null, ex);
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
