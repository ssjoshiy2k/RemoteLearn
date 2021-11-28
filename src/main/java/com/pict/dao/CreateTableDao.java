/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pict.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateTableDao
{

	Connection conn;

	public void create(String uname, String AssignName, String date) throws ClassNotFoundException, SQLException
	{

		String finalAname = "A" + AssignName.trim();

		conn = ConnectDatabase.getConnection();
		String st = "call ab('" + finalAname + "','" + uname.trim() + "');";
		CallableStatement cstmt = conn.prepareCall(st);
		System.out.println(st);
		cstmt.execute();

		/*
		 * cstmt.setString(1,finalAname); cstmt.setString(2,gname);
		 * cstmt.setString(3,uname);
		 */ System.out.println(st);

	}

	public void updateDate(String uname, String AssignName, String date) throws SQLException
	{

		String finalAname = "A" + AssignName.trim();
		System.out.println("the date is  ...." + date);
		String query1 = "update " + finalAname.trim() + " set ScheduledDate='" + date.trim()
				+ "' where SubjectCode=(select distinct UserInfo.SubjectCode from SubjectCoordinator,UserInfo,GroupTable where SubjectCoordinator.UserID=UserInfo.UserID and UserInfo.GroupCode=GroupTable.groupCode and SubjectCoordinator.UserID='"
				+ uname.trim() + "' and GroupTable.EndRollno-GroupTable.StartRollNo<20);";
		System.out.println(query1);
		conn = ConnectDatabase.getConnection();

		Statement stmt = conn.createStatement();

		stmt.execute(query1);

	}

}
