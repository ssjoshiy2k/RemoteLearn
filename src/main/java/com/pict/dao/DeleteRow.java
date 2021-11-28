
package com.pict.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteRow
{

	public void deleteGroup(int groupCode) throws SQLException
	{

		String query1 = "delete from GroupTable where GroupCode=" + groupCode + ";";

		Connection conn = ConnectDatabase.getConnection();
		Statement stmt = conn.createStatement();
		stmt.execute(query1);
	}

	public void deleteSubject(int subjectCode) throws SQLException
	{

		String query1 = "delete from SubjectTable where SubjectCode=" + subjectCode + ";";

		Connection conn = ConnectDatabase.getConnection();
		Statement stmt = conn.createStatement();
		stmt.execute(query1);
	}

	public void deleteLogin(String username) throws SQLException
	{

		String query1 = "delete from LoginTable where UserID='" + username.trim() + "';";
		System.out.println(query1);
		Connection conn = ConnectDatabase.getConnection();
		Statement stmt = conn.createStatement();
		stmt.execute(query1);
	}

	public void deleteAllotment(String information) throws SQLException
	{
		String[] parts = information.split("~");
		int subjectcode = Integer.parseInt(parts[0]);
		int groupcode = Integer.parseInt(parts[1]);

		String query1 = "delete from UserInfo where SubjectCode=" + subjectcode + " and GroupCode=" + groupcode + ";";

		Connection conn = ConnectDatabase.getConnection();
		Statement stmt = conn.createStatement();
		stmt.execute(query1);
	}

	public void deleteCoord(String username) throws SQLException
	{

		String query1 = "delete from SubjectCoordinator where UserID='" + username.trim() + "';";
		System.out.println(query1);
		Connection conn = ConnectDatabase.getConnection();
		Statement stmt = conn.createStatement();
		stmt.execute(query1);
	}

}
