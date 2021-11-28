package com.pict.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GetUnitTestInfo
{

	Connection conn;

	public int getSubCode(String subname) throws SQLException, ClassNotFoundException
	{
		int code = 0;
		conn = ConnectDatabase.getConnection();
		ResultSet rs;
		PreparedStatement stmt;
		String q = "";
		q += "select SubjectCode from SubjectTable where SubjectName = ?";

		stmt = conn.prepareStatement(q);
		stmt.setString(1, subname);
		rs = stmt.executeQuery();
		while (rs.next())
		{
			code = rs.getInt("SubjectCode");
		}
		return code;
	}

	public ResultSet getTable(int subcode, String username) throws SQLException, ClassNotFoundException
	{

		conn = ConnectDatabase.getConnection();

		String query = "select GroupCode from UserInfo where SubjectCode=" + subcode + " and UserID='" + username.trim()
				+ "';";
		Statement stmt1 = conn.createStatement();
		ResultSet r = stmt1.executeQuery(query);
		int gcode = 0;
		if (r.next())
		{

			gcode = r.getInt("GroupCode");
		}

		String query2 = "call utproc(" + gcode + "," + subcode + ");";
		stmt1.execute(query2);

		ResultSet rs;
		PreparedStatement stmt;
		String q = "";
		q += "select RollNo,UT1,UT2 from UnitTest where SubjectCode = ? order by RollNo;";

		stmt = conn.prepareStatement(q);

		stmt.setInt(1, subcode);
		rs = stmt.executeQuery();

		return rs;
	}

}
