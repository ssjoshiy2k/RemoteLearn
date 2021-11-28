package com.pict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.pict.dao.ConnectDatabase;

//@WebServlet(urlPatterns = { "/NewStudentRecordDisplay" })
public class NewStudentRecordDisplay extends HttpServlet
{
	public static String uname, gname, assign_no, SubmissionDate, ScheduledDate, str1, sub, sch, marks, rollno, grpcode,
			subcode, approved, ass_name;
	public static PrintWriter out;
	public Connection conn;
	public static int Approved, SubjectCode, GroupCode, Rollno, Marks, counter, d = 0;
	PreparedStatement stmt;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException, java.text.ParseException, ClassNotFoundException, SQLException, JSONException
	{
		out = response.getWriter();
		HttpSession ses = request.getSession();

		uname = (String) ses.getAttribute("username");
		gname = request.getParameter("gname");

		out.println(uname);
		out.println(gname);

		Rollno = (int) ses.getAttribute("rn");
		out.println(Rollno);

		SubjectCode = (int) ses.getAttribute("sc");
		out.println(SubjectCode);

		GroupCode = (int) ses.getAttribute("gc");
		out.println(GroupCode);

		marks = request.getParameter("marks");
		out.println(marks + "\n");

		sub = request.getParameter("sub1");
		out.println(sub + "\n");

		sch = request.getParameter("sch1");
		out.println(sch + "\n");

		approved = request.getParameter("set");
		out.println(approved + "\n");

		assign_no = request.getParameter("assname");
		out.println(assign_no);

		JSONObject SCH, SUB, MARKS, ASSNAME;
		Connection conn;
		ConnectDatabase cd = new ConnectDatabase();
		conn = cd.getConnection();
		// out.println(sch);

		SCH = new JSONObject("{\"\":{\"\":" + sch + "}}");
		SUB = new JSONObject("{\"\":{\"\":" + sub + "}}");
		MARKS = new JSONObject("{\"\":{\"\":" + marks + "}}");
		ASSNAME = new JSONObject("{\"\":{\"\":" + assign_no + "}}");

		out.println(SCH);
		out.println(SUB);
		out.println(MARKS);
		out.println(ASSNAME);

		int i = 0;
		while (i < approved.length())
		{
			ass_name = ASSNAME.getJSONObject("").getJSONArray("").getJSONObject(i).getString("Assignment Name");
			ass_name = ass_name.substring(0, ass_name.length() - 1);
			ass_name = ass_name.substring(11, ass_name.length());
			ass_name = "A" + ass_name;
			out.println(ass_name);
			Marks = Integer.parseInt(MARKS.getJSONObject("").getJSONArray("").getJSONObject(i).getString("Marks"));
			ScheduledDate = SCH.getJSONObject("").getJSONArray("").getJSONObject(i).getString("value");
			SubmissionDate = SUB.getJSONObject("").getJSONArray("").getJSONObject(i).getString("value");
			Approved = approved.charAt(i) == '0' ? 0 : 1;
			updatedb(i);
			i++;
		}

		response.sendRedirect("StudentRecord.jsp?studRollNo=" + Rollno);

	}

	public void updatedb(int i) throws SQLException, ClassNotFoundException
	{
		ConnectDatabase cd = new ConnectDatabase();
		conn = cd.getConnection();
		String q = "";
		q += "update " + ass_name
				+ " set Marks=? where (Rollno = ? and SubjectCode = (select SubjectCode from UserInfo where UserID=? and GroupCode=? ))";
		stmt = conn.prepareStatement(q);
		stmt.setInt(1, Marks);
		stmt.setInt(2, Rollno);
		stmt.setString(3, uname);
		stmt.setInt(4, GroupCode);

		out.println(q);

		stmt.execute();

		q = "";

		q += "update " + ass_name
				+ " set Approved=? where (Rollno = ? and SubjectCode = (select SubjectCode from UserInfo where UserID=? and GroupCode=? ))";

		stmt = conn.prepareStatement(q);
		stmt.setInt(1, Approved);
		stmt.setInt(2, Rollno);
		stmt.setString(3, uname);
		stmt.setInt(4, GroupCode);
		// System.out.println(apro+Rollno+uname+GroupCode);
		stmt.execute();

		q = "";

		q += "update " + ass_name
				+ " set SubmissionDate=? where (Rollno = ? and SubjectCode = (select SubjectCode from UserInfo where UserID=? and GroupCode=? ))";

		stmt = conn.prepareStatement(q);
		stmt.setString(1, SubmissionDate);
		stmt.setInt(2, Rollno);
		stmt.setString(3, uname);
		stmt.setInt(4, GroupCode);
		stmt.execute();

		q = "";

		q += "update " + ass_name
				+ " set ScheduledDate=? where (Rollno = ? and SubjectCode = (select SubjectCode from UserInfo where UserID=? and GroupCode=? ))";

		stmt = conn.prepareStatement(q);
		stmt.setString(1, ScheduledDate);
		stmt.setInt(2, Rollno);
		stmt.setString(3, uname);
		stmt.setInt(4, GroupCode);
		stmt.execute();

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
			try
			{
				processRequest(request, response);
			} catch (ClassNotFoundException | SQLException ex)
			{
				Logger.getLogger(UpdateInfo.class.getName()).log(Level.SEVERE, null, ex);
			} catch (JSONException ex)
			{
				Logger.getLogger(NewStudentRecordDisplay.class.getName()).log(Level.SEVERE, null, ex);
			}
		} catch (java.text.ParseException ex)
		{
			Logger.getLogger(UpdateInfo.class.getName()).log(Level.SEVERE, null, ex);
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
				Logger.getLogger(UpdateInfo.class.getName()).log(Level.SEVERE, null, ex);
			} catch (JSONException ex)
			{
				Logger.getLogger(NewStudentRecordDisplay.class.getName()).log(Level.SEVERE, null, ex);
			}
		} catch (java.text.ParseException ex)
		{
			Logger.getLogger(UpdateInfo.class.getName()).log(Level.SEVERE, null, ex);
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
