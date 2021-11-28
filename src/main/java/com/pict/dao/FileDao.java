package com.pict.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class FileDao
{
	Connection conn;

	public ResultSet getSubjects(String username) throws SQLException
	{

		conn = ConnectDatabase.getConnection();

		String query1 = "select SubjectName from SubjectTable where SubjectCode=any(select SubjectCode from UserInfo where UserID = '"
				+ username.trim() + "');";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query1);

		return rs;
	}

	public ResultSet getGroups(String username) throws SQLException
	{

		conn = ConnectDatabase.getConnection();

		String query1 = "select GroupName from GroupTable where GroupCode=any(select GroupCode from UserInfo where UserID = '"
				+ username.trim() + "');";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query1);

		return rs;
	}

	public void getFiles(String username, String subjectname, String filename[], int fileid[]) throws SQLException
	{

		String query1 = "select GroupName from GroupTable where StartRollNo<=" + username.trim() + " and EndRollNo>="
				+ username.trim() + ";";

		conn = ConnectDatabase.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs1 = stmt.executeQuery(query1);

		int i = 0;
		while (rs1.next())
		{
			String groupname = null;
			groupname = rs1.getString("GroupName");
			String query = "SELECT FileName,FileID FROM FileDatabase WHERE SubjectName= '" + subjectname.trim()
					+ "' and GroupName='" + groupname.trim() + "';";

			Statement stmt1 = conn.createStatement();

			ResultSet files = stmt1.executeQuery(query);

			while (files.next())
			{

				filename[i] = files.getString("FileName");
				fileid[i] = files.getInt("FileID");
				i++;
			}

		}

	}

}
