package com.pict.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteTable
{

	Connection conn;

	public void deleteAssign(String username, String assignName) throws SQLException
	{

		conn = ConnectDatabase.getConnection();
		String query = "call deleteA('" + username.trim() + "','" + assignName.trim() + "');";
		Statement stmt = conn.createStatement();
		stmt.execute(query);
	}

}
