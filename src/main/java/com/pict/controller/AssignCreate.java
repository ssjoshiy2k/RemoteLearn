package com.pict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.pict.dao.ConnectDatabase;
import com.pict.dao.CreateTableDao;

public class AssignCreate extends HttpServlet
{
	private Object session;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{

		String usrname = request.getParameter("username");
		String num = request.getParameter("AssignNumber");
		String assigncount = request.getParameter("acount");
		String acount_query = "update UserInfo set AssignCount = " + assigncount
				+ " where SubjectCode =any(select SubjectCode from SubjectCoordinator where UserID = '" + usrname.trim()
				+ "');";
		System.out.println(acount_query);
		Statement stmt = null;
		Connection conn = null;
		ConnectDatabase cd = new ConnectDatabase();
		conn = cd.getConnection();
		try
		{
			stmt = conn.createStatement();
		} catch (SQLException ex)
		{
			Logger.getLogger(AssignCreate.class.getName()).log(Level.SEVERE, null, ex);
		}

		/*
		 * Commented out by shubham try { stmt.executeUpdate(acount_query);
		 * 
		 * } catch (SQLException ex) {
		 * Logger.getLogger(AssignCreate.class.getName()).log(Level.SEVERE, null, ex); }
		 */

		System.out.println(acount_query);
		System.out.println(assigncount);
		System.out.println(usrname);
		System.out.println(num);

		String date = request.getParameter("sdate");
		System.out.println("date is " + date);

		CreateTableDao ctd = new CreateTableDao();

		try
		{
			ctd.create(usrname, num, date);
			ctd.updateDate(usrname, num, date);
		} catch (ClassNotFoundException | SQLException ex)
		{
			// Logger.getLogger(AssignCreate.class.getName()).log(Level.SEVERE, null, ex);
			System.out.println("error in assigncreate");
		}
		PrintWriter out = response.getWriter();
		response.sendRedirect("LoginSuccessful.jsp?success=2");

		// HttpSession session = request.getSession();
		// session.setAttribute("username", usrname);

	}
}