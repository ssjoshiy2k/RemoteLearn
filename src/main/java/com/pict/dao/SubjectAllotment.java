package com.pict.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

public class SubjectAllotment extends HttpServlet
{
	public static String GroupName;
	public static PrintWriter out;
	public static Connection conn;
	public static ResultSet res;
	public static int sc, gc;
	PreparedStatement stmt;
	public static String Subject, Teacher, Group, uid;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, JSONException
	{
		out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		// if(request.getParameter("classname") == null) out.println("a");
		String sub = request.getParameter("subject");
		String tea = request.getParameter("teacher");
		String grp = request.getParameter("group");

		out.println(sub);
		out.println(tea);
		out.println(grp);

		JSONObject GROUP, SUBJECT, TEACHER;

		ConnectDatabase cd = new ConnectDatabase();
		conn = cd.getConnection();

		// out.println(sch);

		GROUP = new JSONObject("{\"\":{\"\":" + grp + "}}");
		SUBJECT = new JSONObject("{\"\":{\"\":" + sub + "}}");
		TEACHER = new JSONObject("{\"\":{\"\":" + tea + "}}");

		String str = grp;
		String findStr = "group";
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
		out.println(count);
//out.println(cn);

		int i = 0;
		while (i < count)
		{
			Subject = SUBJECT.getJSONObject("").getJSONArray("").getJSONObject(i).getString("subject");
			Teacher = TEACHER.getJSONObject("").getJSONArray("").getJSONObject(i).getString("teacher");
			Group = GROUP.getJSONObject("").getJSONArray("").getJSONObject(i).getString("group");
			uid = getuid();
			gc = getgc();
			sc = getsc();
			out.println(Subject);
			out.println(uid);
			out.println(Teacher);
			out.println(Group);
			i++;
			updatedb();
		}
		response.sendRedirect("Welcome1.jsp");

	}

	public void updatedb() throws SQLException
	{

		String q;
		q = "insert into UserInfo (UserID, UserName, SubjectCode, GroupCode) values(?,?,?,?)  on duplicate key update UserID = values(UserID), UserName = values(UserName), SubjectCode = values(SubjectCode), GroupCode = values(GroupCode)";
		stmt = conn.prepareStatement(q);
		stmt.setString(1, uid);
		stmt.setString(2, Teacher);
		stmt.setInt(3, sc);
		stmt.setInt(4, gc);

		// out.println(q);

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
			processRequest(request, response);
		} catch (SQLException ex)
		{
			Logger.getLogger(GroupTable.class.getName()).log(Level.SEVERE, null, ex);
		} catch (JSONException ex)
		{
			Logger.getLogger(SubjectAllotment.class.getName()).log(Level.SEVERE, null, ex);
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
			Logger.getLogger(SubjectAllotment.class.getName()).log(Level.SEVERE, null, ex);
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

	public String getuid() throws SQLException
	{
		ConnectDatabase cd = new ConnectDatabase();
		conn = cd.getConnection();
		String q, s1 = null;
		q = "Select UserID from LoginTable where UserName = ?";
		stmt = conn.prepareStatement(q);
		stmt.setString(1, Teacher);
		res = stmt.executeQuery();
		while (res.next())
		{
			s1 = res.getString("UserID");
		}

		return s1;
	};

	public int getgc() throws SQLException
	{
		ConnectDatabase cd = new ConnectDatabase();
		conn = cd.getConnection();
		String q = null;
		int x = 0;
		q = "Select GroupCode from GroupTable where GroupName = ?";
		stmt = conn.prepareStatement(q);
		stmt.setString(1, Group);
		res = stmt.executeQuery();
		while (res.next())
		{
			x = res.getInt("GroupCode");
		}

		return x;
	};

	public int getsc() throws SQLException
	{
		ConnectDatabase cd = new ConnectDatabase();
		conn = cd.getConnection();
		String q = null;
		int x = 0;
		q = "Select SubjectCode from SubjectTable where SubjectName = ?";
		stmt = conn.prepareStatement(q);
		stmt.setString(1, Subject);
		res = stmt.executeQuery();
		while (res.next())
		{
			x = res.getInt("SubjectCode");
		}

		return x;
	};

	public ResultSet getTeachers() throws SQLException
	{
		conn = ConnectDatabase.getConnection();

		Statement stmt = conn.createStatement();

		String query1 = "select UserName from LoginTable where length(UserID)<4";
		ResultSet rs = stmt.executeQuery(query1);
		return rs;
	}

	public ResultSet getSubject() throws SQLException
	{
		conn = ConnectDatabase.getConnection();

		Statement stmt = conn.createStatement();

		String query1 = "select SubjectName from SubjectTable";
		ResultSet rs = stmt.executeQuery(query1);
		return rs;
	}

	public int totalsub() throws SQLException
	{
		conn = ConnectDatabase.getConnection();

		Statement stmt = conn.createStatement();

		String query1 = "select SubjectName from SubjectTable";
		ResultSet rs = stmt.executeQuery(query1);
		int i = 0;
		while (rs.next())
			i++;
		return i;
	}

	public ResultSet getGroups() throws SQLException
	{
		conn = ConnectDatabase.getConnection();

		Statement stmt = conn.createStatement();

		String query1 = "select GroupName from GroupTable";
		ResultSet rs = stmt.executeQuery(query1);

		return rs;

	}

	public ResultSet giveresult() throws SQLException
	{

		conn = ConnectDatabase.getConnection();
		String q;
		q = "Select * from UserInfo";
		stmt = conn.prepareStatement(q);
		return stmt.executeQuery();
	}

	public String subjectname(int y) throws SQLException
	{
		ConnectDatabase cd = new ConnectDatabase();
		conn = cd.getConnection();
		String q, s1 = null;
		q = "Select SubjectName from SubjectTable where SubjectCode = ?";
		stmt = conn.prepareStatement(q);
		stmt.setInt(1, y);
		res = stmt.executeQuery();
		while (res.next())
		{
			return res.getString("SubjectName");
		}

		return s1;
	};

	public String groupname(int y) throws SQLException
	{
		ConnectDatabase cd = new ConnectDatabase();
		conn = cd.getConnection();
		String q, s1 = null;
		q = "Select GroupName from GroupTable where GroupCode = ?";
		stmt = conn.prepareStatement(q);
		stmt.setInt(1, y);
		res = stmt.executeQuery();
		while (res.next())
		{
			return res.getString("GroupName");
		}

		return s1;
	};

}