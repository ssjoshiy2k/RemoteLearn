package com.pict.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginDao
{

	Connection conn;

	public boolean check(String UserID, String Password)
	{
		try
		{

			String query1 = "Select *from LoginTable where UserID=? and Password=?";

			conn = ConnectDatabase.getConnection();

			System.out.println("UserID : " + UserID);
			System.out.println("Password : " + Password);

			PreparedStatement stmt = conn.prepareStatement(query1);
			stmt.setString(1, UserID);
			stmt.setString(2, Password);
			ResultSet resultset = stmt.executeQuery();
			if (resultset.next())
			{
				System.out.println("Entry exists for the user " + UserID + " in the LoginTable");
				return true;
			} else
			{
				System.out.println("Entry DOES NOT exists for the user " + UserID + " in the LoginTable");
				return false;
			}

		} catch (Exception e)
		{
			System.out.println("Exception caught at the check function LoginDao.");
			System.out.println(e);
		}
		System.out.println("Entry DOES NOT exists for the user " + UserID + " in the LoginTable");
		return false;
	}

	public void insert(String first_name, String middle_name, String last_name, String UserID, String Password)
	{
		try
		{

			conn = ConnectDatabase.getConnection();
			String insert = "insert into LoginTable (UserID,UserName,Password) values (?,'" + first_name.trim()
					+ middle_name.trim() + last_name.trim() + "',?)";

			PreparedStatement stmt = conn.prepareStatement(insert);
			stmt.setString(1, UserID);
			stmt.setString(2, Password);
			stmt.execute();

		} catch (Exception e)
		{
			System.out.println(e);
		}
	}

	public void showGroup(String UserID, int number, String[] groupArray)
	{

		// String returnString[] = new String[number];
		try
		{

			conn = ConnectDatabase.getConnection();
			String insert = "select GroupName from UserInfo,GroupTable where UserID=? and UserInfo.GroupCode=GroupTable.GroupCode";

			PreparedStatement stmt1 = conn.prepareStatement(insert);
			stmt1.setString(1, UserID);

			ResultSet rs = stmt1.executeQuery();
			int i = 0;

			while (rs.next())
			{
				groupArray[i] = rs.getString("GroupName");
				i++;
			}

		} catch (Exception e)
		{
			System.out.println(e);
		}

	}

	public int giveCount(String UserID)
	{

		try
		{

			conn = ConnectDatabase.getConnection();
			String getCount = "select count(GroupName) from UserInfo,GroupTable where UserID=? and UserInfo.GroupCode=GroupTable.GroupCode";

			PreparedStatement stmt2 = conn.prepareStatement(getCount);

			stmt2.setString(1, UserID);
			System.out.println("hskdfaef");
			ResultSet count = stmt2.executeQuery();

			if (count.next())
			{
				return Integer.parseInt(count.getString("count(GroupName)"));
			}

		} catch (SQLException | NumberFormatException e)
		{
			System.out.println(e);
		}
		return 0;
	}

	public void showClass(String username, String classes[]) throws ClassNotFoundException, SQLException
	{

		conn = ConnectDatabase.getConnection();
		String query1 = "select SubjectName from SubjectTable where SubjectCode=any(select SubjectCode from UserInfo where UserID ='"
				+ username.trim()
				+ "' and GroupCode=any(select GroupCode from GroupTable where EndRollNo-StartRollNo>70));";

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(query1);
		int i = 0;
		while (rs.next())
		{

			String subject = rs.getString("SubjectName");

			classes[i] = subject;
			i++;
		}

	}

	public int showClass(String username) throws ClassNotFoundException, SQLException
	{

		conn = ConnectDatabase.getConnection();
		String query1 = "select count(SubjectName) from SubjectTable where SubjectCode=any(select SubjectCode from UserInfo where UserID ='"
				+ username.trim()
				+ "' and GroupCode=any(select GroupCode from GroupTable where EndRollNo-StartRollNo>70));";

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(query1);
		int i = 0;
		if (rs.next())
		{

			return Integer.parseInt(rs.getString("count(SubjectName)"));

		}
		return 0;
	}

	public int AssignCount(String username, String groupname) throws ClassNotFoundException, SQLException
	{

		String query1 = "select AssignCount from UserInfo where UserID='" + username.trim()
				+ "' and GroupCode=(select GroupCode from GroupTable where GroupName='" + groupname.trim() + "');";

		conn = ConnectDatabase.getConnection();
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(query1);

		if (rs.next())
		{

			return Integer.parseInt(rs.getString("AssignCount"));
		}

		return 0;
	}

	public int AssignCount2(String username, int subjectcode) throws ClassNotFoundException, SQLException
	{

		String query1 = "select AssignCount from UserInfo where UserID='" + username.trim() + "' and SubjectCode="
				+ subjectcode + ";";

		conn = ConnectDatabase.getConnection();
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(query1);

		if (rs.next())
		{
			if (rs.getString("AssignCount") != null)
				return Integer.parseInt(rs.getString("AssignCount"));

		}

		return 0;
	}

	public boolean changePass(String username, String oldpass, String newpass) throws SQLException
	{

		conn = ConnectDatabase.getConnection();
		String query = "update LoginTable set Password='" + newpass.trim() + "' where UserID='" + username.trim()
				+ "' and Password='" + oldpass.trim() + "';";

		Statement stmt = conn.createStatement();

		return stmt.execute(query);

	}

	public ResultSet tests(String subjectname) throws SQLException
	{

		String query = "select TestCode from UnitTest where SubjectCode=(select SubjectCode from SubjectTable where SubjectName='"
				+ subjectname.trim() + "');";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		return rs;
	}

}