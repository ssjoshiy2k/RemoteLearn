package com.pict.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author santiago
 */
public class Records
{

	Connection conn;

	public ResultSet record(String assign_no, String uname, String gname) throws Exception
	{
		conn = ConnectDatabase.getConnection();
		CallableStatement cStmt = conn.prepareCall("call aa( ?, ?, ?)");
		cStmt.setString(1, assign_no);
		cStmt.setString(2, gname);
		cStmt.setString(3, uname);

		cStmt.executeQuery();
		ResultSet rs;
		PreparedStatement preparedStmt;
		int grpcode = 0;
		int subcode = 0;

		String q = "";
		q += "select GroupCode from GroupTable where GroupName = ?";

		preparedStmt = conn.prepareStatement(q);
		preparedStmt.setString(1, gname);
		rs = preparedStmt.executeQuery();
		while (rs.next())
		{
			grpcode = rs.getInt("GroupCode");
		}

		q = "";
		q += "select SubjectCode from UserInfo where UserID=? and GroupCode=?";
		preparedStmt = conn.prepareStatement(q);
		preparedStmt.setString(1, uname);
		preparedStmt.setInt(2, grpcode);
		rs = preparedStmt.executeQuery();
		while (rs.next())
		{
			subcode = rs.getInt("SubjectCode");
		}

		q = "";
		q += "select * from " + assign_no.trim() + " where SubjectCode =? and GroupCode = ?";
		preparedStmt = conn.prepareStatement(q);
		preparedStmt.setInt(1, subcode);
		preparedStmt.setInt(2, grpcode);

		rs = preparedStmt.executeQuery();

		return rs;
	};
}
