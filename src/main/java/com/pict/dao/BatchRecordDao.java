package com.pict.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BatchRecordDao
{

	Connection conn;

	public void report(String username, String grpname, int report1[][]) throws SQLException
	{

		conn = ConnectDatabase.getConnection();
		String query1 = "select GroupCode from GroupTable where GroupName='" + grpname.trim() + "';";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query1);
		int gcode = 0;
		if (rs.next())
		{
			gcode = rs.getInt("GroupCode");
		}

		String query2 = "select SubjectCode from UserInfo where UserID ='" + username.trim() + "' and GroupCode="
				+ gcode + ";";
		Statement stmt2 = conn.createStatement();
		ResultSet rs1 = stmt2.executeQuery(query2);
		int subjectCode = 0;
		if (rs1.next())
		{
			subjectCode = rs1.getInt("SubjectCode");
		}
		String query3 = "select StartRollNo,EndRollNo from GroupTable where GroupCode=(select GroupCode from GroupTable where GroupName='"
				+ grpname.trim() + "');";

		Statement stmt3 = conn.createStatement();
		ResultSet rs4 = stmt3.executeQuery(query3);
		int startnum = 0, endnum = 0;

		if (rs4.next())
		{

			startnum = Integer.parseInt(rs4.getString("StartRollNo"));
			endnum = Integer.parseInt(rs4.getString("EndRollNo"));
			System.out.println("snum is " + startnum + " endnum is " + endnum);
		}

		int i = 0;

		while (startnum <= endnum)
		{

			String query4 = "select AssignmentName from AssignmentExist where SubjectCode=" + subjectCode + " ;";

			rs = stmt.executeQuery(query4);
			int sum = 0;

			int flag = 0;
			int j = 0;
			while (rs.next())
			{

				String temp = rs.getString("AssignmentName");

				String query6 = "select Marks from " + temp.trim() + " where Rollno =" + startnum + " and SubjectCode="
						+ subjectCode + " ;";
				System.out.println(query6);
				Statement stmt4 = conn.createStatement();
				ResultSet rs2 = stmt4.executeQuery(query6);
				if (rs2.next())
				{
					report1[i][j] = rs2.getInt("Marks");
					System.out.println(report1[i][j]);
					j++;
				}

			}
			i++;
			startnum++;

		}

	}

	public void StudRollNo(String username, String grpname, int roll[]) throws SQLException
	{

		conn = ConnectDatabase.getConnection();

		String query1 = "select GroupCode from GroupTable where GroupName='" + grpname.trim() + "';";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query1);
		int gcode = 0;
		if (rs.next())
		{
			gcode = rs.getInt("GroupCode");
		}

		System.out.println("gcode is " + gcode);
		String query2 = "select SubjectCode from UserInfo where UserID ='" + username.trim() + "' and GroupCode="
				+ gcode + ";";
		Statement stmt2 = conn.createStatement();
		ResultSet rs1 = stmt2.executeQuery(query2);
		int subjectCode = 0;
		if (rs1.next())
		{
			subjectCode = rs1.getInt("SubjectCode");
		}
		System.out.println("subcode is " + subjectCode);
		String query3 = "select StartRollNo,EndRollNo from GroupTable where GroupCode=" + gcode + ";";

		Statement stmt3 = conn.createStatement();
		ResultSet rs4 = stmt3.executeQuery(query3);

		if (rs4.next())
		{

			roll[0] = Integer.parseInt(rs4.getString("StartRollNo"));
			roll[1] = Integer.parseInt(rs4.getString("EndRollNo"));
		}

	}

}
