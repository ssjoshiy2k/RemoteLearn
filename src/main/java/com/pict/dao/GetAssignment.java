package com.pict.dao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author sameer
 */
public class GetAssignment
{

	Connection conn;

//Change the function header i.e replace the line below
	public void assignmentList(String usrname, String grpname, String tableName[], int count[], int total[])
			throws ClassNotFoundException, SQLException, JSONException
	{

		String query = "select AssignmentName from AssignmentExist where SubjectCode=(select SubjectCode from UserInfo where UserID='"
				+ usrname.trim() + "' and GroupCode=(select GroupCode from GroupTable where GroupName='"
				+ grpname.trim() + "')) order by AssignmentName;";

		conn = ConnectDatabase.getConnection();
		JSONObject assigns = new JSONObject();

		PreparedStatement stmt = conn.prepareStatement(query);
		ResultSet rs = stmt.executeQuery();
		int i = 0;
		// Replace code from the line below till line number 49 as it is
		while (rs.next())
		{
			tableName[i] = rs.getString("AssignmentName");
			String query1 = "select count(Approved) from " + tableName[i].trim()
					+ " where Approved=1 and SubjectCode=(select SubjectCode from UserInfo where UserID='"
					+ usrname.trim() + "'and GroupCode=(select GroupCode from GroupTable where GroupName='"
					+ grpname.trim() + "')) and RollNo>=(select StartRollNo from GroupTable where GroupName='"
					+ grpname.trim() + "') and RollNo<=(select EndRollNo from GroupTable where GroupName='"
					+ grpname.trim() + "')";
			String query2 = "select count(RollNo) from " + tableName[i].trim()
					+ " where SubjectCode=(select SubjectCode from UserInfo where UserID='" + usrname.trim()
					+ "'and GroupCode=(select GroupCode from GroupTable where GroupName='" + grpname.trim()
					+ "')) and RollNo>=(select StartRollNo from GroupTable where GroupName='" + grpname.trim()
					+ "') and RollNo<=(select EndRollNo from GroupTable where GroupName='" + grpname.trim() + "')";
			System.out.println(query1);
			PreparedStatement stmt1 = conn.prepareStatement(query1);
			ResultSet rs1 = stmt1.executeQuery();
			if (rs1.next())
			{
				count[i] = rs1.getInt("count(Approved)");
			}
			PreparedStatement stmt2 = conn.prepareStatement(query2);
			ResultSet rs2 = stmt2.executeQuery();
			if (rs2.next())
			{
				total[i] = rs2.getInt("count(RollNo)");
			}
			// till here
			i++;
		}

	}

	public int assignmentCount(String usrname, String grpname) throws ClassNotFoundException, SQLException
	{

		conn = ConnectDatabase.getConnection();
		// String query2="select StartRollNo,EndRollNo from GroupStart where
		// GroupID=(select GroupCode from GroupTable where
		// GroupName="+grpname.trim()+");";

		String query = "select count(AssignmentName) from AssignmentExist where SubjectCode=(select SubjectCode from UserInfo where UserID='"
				+ usrname.trim() + "' and GroupCode=(select GroupCode from GroupTable where GroupName='"
				+ grpname.trim() + "'));";

		PreparedStatement stmt = conn.prepareStatement(query);

		ResultSet rs = stmt.executeQuery();
		if (rs.next())
		{
			return Integer.parseInt(rs.getString("count(AssignmentName)"));
		}
		return 0;
	}

	/*
	 * public JSONObject assignment(String usrname, String grpname) throws
	 * ClassNotFoundException, SQLException, JSONException {
	 * 
	 * String query =
	 * "select AssignmentName from AssignmentExist where GroupName=? and UserID=?;";
	 * 
	 * conn = ConnectDatabase.getConnection(); JSONObject assigns = new
	 * JSONObject();
	 * 
	 * PreparedStatement stmt = conn.prepareStatement(query); stmt.setString(1,
	 * grpname); stmt.setString(2, usrname); ResultSet rs = stmt.executeQuery(); int
	 * i = 0; assigns.put("name", "Sameer");
	 * 
	 * return assigns; }
	 */
	public boolean isCoordinator(String username) throws SQLException
	{

		conn = ConnectDatabase.getConnection();
		String query1 = "select UserID from SubjectCoordinator where UserID='" + username.trim()
				+ "' and SubjectCode=any(select SubjectCode from UserInfo where UserID='" + username.trim()
				+ "' and GroupCode=any(select GroupCode from GroupTable where EndRollNo-StartRollNo<20));";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query1);
		if (rs.next())
		{
			return true;
		} else
		{
			return false;
		}
	}

	public int dropcheck(int j, int subcode) throws ClassNotFoundException, SQLException
	{

		conn = ConnectDatabase.getConnection();

		String Ass;
		Ass = "A" + j;

		String query = "select count(AssignmentName) from AssignmentExist where AssignmentName='" + Ass.trim()
				+ "' and SubjectCode=" + subcode + ";";
		System.out.println(query);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		int i = 0;
		if (rs.next())
		{
			// i=Integer.parseInt(rs.getString("count(AssignmentName)").trim());
			System.out.println("wrawe" + rs.getInt("count(AssignmentName)"));
			return rs.getInt("count(AssignmentName)");
		}

		return 0;
	}
}