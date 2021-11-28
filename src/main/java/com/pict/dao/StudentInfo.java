package com.pict.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentInfo
{

	Connection conn;

	public ResultSet getSubject(String username) throws ClassNotFoundException, SQLException
	{
		conn = ConnectDatabase.getConnection();
		String query2 = "select SubjectName from SubjectTable";
		Statement stmt2 = conn.createStatement();
		ResultSet rs2 = stmt2.executeQuery(query2);

		return rs2;

	}

	public int getApproved(String subname, String username) throws ClassNotFoundException, SQLException
	{

		String query1 = "select Approved from SubmissionTicket where SubjectCode=(select SubjectCode from SubjectTable where SubjectName='"
				+ subname + "') and RollNo=" + username + ";";
		System.out.println(query1);
		conn = ConnectDatabase.getConnection();

		Statement stmt1 = conn.createStatement();
		ResultSet rs1 = stmt1.executeQuery(query1);
		int Approved = 0;
		if (rs1.next())
		{
			Approved = (rs1.getInt("Approved"));

		}
		return Approved;

	}

	public ResultSet studAssign(String userid, String subject) throws ClassNotFoundException, SQLException
	{

		String stud_query1 = "select AssignmentName from AssignmentExist where GroupName=(select GroupName from GroupTable where GroupCode=(select GroupID from GroupStart where StartRollNo <= "
				+ userid + " and EndRollNo>=" + userid
				+ ") and UserID=(select UserID from UserInfo where SubjectCode=(select SubjectCode from SubjectTable where SubjectName='"
				+ subject + "') and GroupCode=(select GroupID from GroupStart where StartRollNo <=" + userid
				+ " and EndRollNo>=" + userid + ")));";
		// String stud_query2 = "select AssignmentName from AssignmentExist where
		// GroupName=(select GroupName from GroupTable where GroupCode=(select GroupID
		// from GroupStart where StartRollNo <= 3026 and EndRollNo>=3026)) and
		// UserID=(select UserID from UserInfo where SubjectCode=(select SubjectCode
		// from SubjectTable where SubjectName='SL-1') and GroupCode=(select GroupID
		// from GroupStart where StartRollNo <= 3026 and EndRollNo>=3026));
		// ";
		String ut_query = " select Marks,OutOfMarks from UnitTest where RollNo = " + userid
				+ " and SubjectCode = (select SubjectCode from SubjectTable where SubjectName = '" + subject + "');";
		String subject_query = "select SubjectCode from SubjectTable where SubjectName = '" + subject + "'";
		String stud_query2;

		System.out.println(stud_query1);

		conn = ConnectDatabase.getConnection();
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		Statement ut_stmt = conn.createStatement();
		Statement subject_stmt = conn.createStatement();

		ResultSet sub_rs = subject_stmt.executeQuery(subject_query);

		return sub_rs;
	}

	public ResultSet getAssign(String userid, String subject) throws ClassNotFoundException, SQLException
	{

		String stud_query1 = "select AssignmentName from AssignmentExist where GroupName=(select GroupName from GroupTable where GroupCode=(select GroupID from GroupStart where StartRollNo <= "
				+ userid + " and EndRollNo>=" + userid
				+ ") and UserID=(select UserID from UserInfo where SubjectCode=(select SubjectCode from SubjectTable where SubjectName='"
				+ subject + "') and GroupCode=(select GroupID from GroupStart where StartRollNo <=" + userid
				+ " and EndRollNo>=" + userid + ")));";
		// String stud_query2 = "select AssignmentName from AssignmentExist where
		// GroupName=(select GroupName from GroupTable where GroupCode=(select GroupID
		// from GroupStart where StartRollNo <= 3026 and EndRollNo>=3026)) and
		// UserID=(select UserID from UserInfo where SubjectCode=(select SubjectCode
		// from SubjectTable where SubjectName='SL-1') and GroupCode=(select GroupID
		// from GroupStart where StartRollNo <= 3026 and EndRollNo>=3026));
		// ";
		String ut_query = " select Marks,OutOfMarks from UnitTest where RollNo = " + userid
				+ " and SubjectCode = (select SubjectCode from SubjectTable where SubjectName = '" + subject + "');";
		String subject_query = "select SubjectCode from SubjectTable where SubjectName = '" + subject + "'";
		String stud_query2;

		System.out.println(stud_query1);

		conn = ConnectDatabase.getConnection();
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		Statement ut_stmt = conn.createStatement();
		Statement subject_stmt = conn.createStatement();

		ResultSet rs = subject_stmt.executeQuery(stud_query1);

		return rs;
	}

	public ResultSet utquery(String userid, String subject) throws ClassNotFoundException, SQLException
	{

		String ut_query = " select Marks,OutOfMarks from UnitTest where RollNo = " + userid
				+ " and SubjectCode = (select SubjectCode from SubjectTable where SubjectName = '" + subject + "');";

		conn = ConnectDatabase.getConnection();

		Statement subject_stmt = conn.createStatement();

		ResultSet rs = subject_stmt.executeQuery(ut_query);

		return rs;
	}

	public ResultSet datequery(String userid, String subject, String asg_name)
			throws ClassNotFoundException, SQLException
	{

		String ut_query = " select Marks,OutOfMarks from UnitTest where RollNo = " + userid
				+ " and SubjectCode = (select SubjectCode from SubjectTable where SubjectName = '" + subject + "');";

		conn = ConnectDatabase.getConnection();

		Statement stmt2 = conn.createStatement();

		String stud_query2 = "select ScheduledDate,SubmissionDate , Marks from " + asg_name + " where RollNo = "
				+ userid + " and Approved =1;";
		ResultSet rs2 = stmt2.executeQuery(stud_query2);

		return rs2;
	}

}
