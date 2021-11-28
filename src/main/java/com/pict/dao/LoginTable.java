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

public class LoginTable extends HttpServlet
{
	public static String FirstName, MiddleName, LastName;
	public static PrintWriter out;
	public static Connection conn;
	public static ResultSet res;
	// public static int GroupStartRollNo,GroupEndRollNo;
	PreparedStatement stmt;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, JSONException
	{
		out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		// if(request.getParameter("classname") == null) out.println("a");
		String fn = request.getParameter("fn");
		String mn = request.getParameter("mn");
		String ln = request.getParameter("ln");
		// out.println(cn);

		JSONObject FN, MN, LN;

		ConnectDatabase cd = new ConnectDatabase();
		conn = cd.getConnection();

		// out.println(sch);

		FN = new JSONObject("{\"\":{\"\":" + fn + "}}");
		MN = new JSONObject("{\"\":{\"\":" + mn + "}}");
		LN = new JSONObject("{\"\":{\"\":" + ln + "}}");

		String str = fn;
		String findStr = "FirstName";
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
			FirstName = FN.getJSONObject("").getJSONArray("").getJSONObject(i).getString("FirstName");
			MiddleName = MN.getJSONObject("").getJSONArray("").getJSONObject(i).getString("MiddleName");
			LastName = LN.getJSONObject("").getJSONArray("").getJSONObject(i).getString("LastName");

			// out.println(classname);
			i++;
			updatedb();
		}
		response.sendRedirect("Welcome1.jsp");

	}

	public void updatedb() throws SQLException
	{

		String q;
		String nm = FirstName + " " + MiddleName + "." + " " + LastName;
		String uid = "" + FirstName.charAt(0) + MiddleName.charAt(0) + LastName.charAt(0);
		uid = uid.trim();
		q = "INSERT INTO LoginTable (UserName, UserID,Password) SELECT * FROM (SELECT ?,?,'abc') AS tmp WHERE NOT EXISTS (SELECT UserID FROM LoginTable WHERE UserID = ? )LIMIT 1";
		stmt = conn.prepareStatement(q);
		stmt.setString(1, nm);
		stmt.setString(2, uid);
		stmt.setString(3, uid);

		// out.println(q);

		stmt.execute();
	}

	public ResultSet giveresult() throws SQLException
	{

		conn = ConnectDatabase.getConnection();
		String q;
		q = "Select * from LoginTable where length(UserID)<4";
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
			Logger.getLogger(LoginTable.class.getName()).log(Level.SEVERE, null, ex);
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
			Logger.getLogger(LoginTable.class.getName()).log(Level.SEVERE, null, ex);
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
