package com.pict.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MakeString
{

	Connection conn;

	public String[] makestring(String Teacher)
	{

		String toReturn[];
		toReturn = new String[20];

		int j;
		for (j = 0; j < 20; j++)
		{
			toReturn[j] = "";
		}

		try
		{

			conn = ConnectDatabase.getConnection();
			// String insert = "select GroupName from UserInfo,GroupTable where UserID=? and
			// UserInfo.GroupCode=GroupTable.GroupCode";
			String query = "select GroupName from GroupTable where EndRollNo-StartRollNo<20 and GroupCode=any(select GroupCode from UserInfo where UserID='"
					+ Teacher.trim() + "')";

			PreparedStatement stmt = conn.prepareStatement(query);
			// stmt.setString(1, Teacher);
			ResultSet rs = stmt.executeQuery();

			int i = 0;

			while (rs.next())
			{
				System.out.println("GroupName");
				toReturn[i] = rs.getString("GroupName");
				// System.out.print(rs.getString(toReturn[i]));
				// System.out.println(rs.getString("GroupName"));
				System.out.println(toReturn[i]);
				i++;
			}

		} catch (SQLException e)
		{
			System.out.println(e);
		}

		return toReturn;

	}

	public int getCount(String Teacher)
	{

		try
		{

			conn = ConnectDatabase.getConnection();
			// String insert = "select count(GroupName) from UserInfo,GroupTable where
			// UserID=? and UserInfo.GroupCode=GroupTable.GroupCode";

			String query = "select count(GroupName) from GroupTable where EndRollNo-StartRollNo<20 and GroupCode=any(select GroupCode from UserInfo where UserID='"
					+ Teacher.trim() + "')";

			PreparedStatement stmt = conn.prepareStatement(query);
			// stmt.setString(1, Teacher);
			ResultSet rs = stmt.executeQuery();

			int i = 0;

			if (rs.next())
			{
				return Integer.parseInt(rs.getString("count(GroupName)"));
			}

		} catch (SQLException e)
		{
			System.out.println(e);
		}

		return 0;

	}

	// To BE Sorted out At the Later Stage As of 13-9-2017 time 7:50PM
	public void insertRecords(int SubjectCode) throws ClassNotFoundException, SQLException
	{

		int i;
		// String create="create table ?(RollNo int,GroupCode int,SubjectCode
		// int,ScheduleDate date,ActualDate date,Approval boolean,Marks int);";
		String insert = "insert into UnitTest values(?,0,4,2)";

		conn = ConnectDatabase.getConnection();
		PreparedStatement stmt = conn.prepareStatement(insert);
		// stmt.setInt(3, SubjectCode);

		for (i = 3001; i < 3081; i++)
		{
			stmt.setInt(1, i);
			stmt.execute();

		}

	}
}
