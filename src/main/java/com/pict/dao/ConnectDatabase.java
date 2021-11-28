package com.pict.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDatabase
{

	public static Connection getConnection()
	{
		String url = "jdbc:mysql://localhost:3306/remotelearndb";
		String driverName = "com.mysql.jdbc.Driver";
		String username = "root";
		String password = "y2kk2y#68-";
		Connection con = null;
		try
		{
			Class.forName(driverName);
			try
			{
				con = DriverManager.getConnection(url, username, password);
				System.out.println("Connection to the database establihed..!");
			} catch (SQLException ex)
			{
				// log an exception. fro example:
				System.out.println("Failed to create the database connection.");
			}
		} catch (ClassNotFoundException ex)
		{
			// log an exception. for example:
			System.out.println("Driver not found.");
		}
		return con;
	}
}
