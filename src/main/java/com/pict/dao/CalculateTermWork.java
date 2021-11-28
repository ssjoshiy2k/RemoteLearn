package com.pict.dao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CalculateTermWork
{

	Connection conn;

	public ResultSet termWork(String username, String groupname) throws ClassNotFoundException, SQLException
	{
		conn = ConnectDatabase.getConnection();
		String query5 = "select StartRollNo,EndRollNo from GroupTable where GroupCode=(select GroupCode from GroupTable where GroupName='"
				+ groupname.trim() + "');";

		Statement stmt2 = conn.createStatement();
		ResultSet rs4 = stmt2.executeQuery(query5);
		int startnum = 0, endnum = 0;

		if (rs4.next())
		{

			startnum = Integer.parseInt(rs4.getString("StartRollNo"));
			endnum = Integer.parseInt(rs4.getString("EndRollNo"));
		}
		System.out.println("Start is " + startnum + "the end num is " + endnum);

		System.out.println("username is " + username + "groupname is " + groupname);
		while (endnum >= startnum)
		{

			String query4 = "select sum(UT1),sum(UT2),sum(OutOfMarks) from UnitTest where RollNo=" + startnum
					+ " and SubjectCode=any(select SubjectCode from UserInfo where UserID='" + username.trim() + "') ;";

			System.out.println(query4);
			Statement stmt = conn.createStatement();
			ResultSet rs3 = stmt.executeQuery(query4);

			int sum1 = 0;
			int total = 0;
			String sut1 = null, sut2 = null, soutofmarks = null;
			if (rs3.next())
			{

				sut1 = rs3.getString("sum(UT1)");
				if (sut1 != null)
				{
					sum1 += Integer.parseInt(sut1.trim());
				} else
				{
					sum1 += 0;
				}

				sut2 = rs3.getString("sum(UT2)");
				if (sut2 != null)
				{
					sum1 += Integer.parseInt(sut2.trim());
				} else
				{
					sum1 += 0;
				}

				// sum1 += Integer.parseInt(rs3.getString("sum(UT2)"));

				soutofmarks = rs3.getString("sum(OutOfMarks)");
				if (soutofmarks != null)
				{
					total += Integer.parseInt(soutofmarks.trim());
				} else
				{
					total += 0;
				}

				// total += Integer.parseInt(rs3.getString("sum(OutOfMarks)"));

			}

			System.out.println(total);
			System.out.println(sum1);

			if (sum1 != 0)
			{
				sum1 = (20 * sum1) / total;
			}

			String query2 = "select SubjectCode from UserInfo where UserID='" + username.trim()
					+ "' and GroupCode=(select GroupCode from GroupTable where GroupName='" + groupname.trim()
					+ "' and EndRollNo-StartRollNo<20);";

			Statement stmt1 = conn.createStatement();

			ResultSet rs = stmt1.executeQuery(query2);

			int subjectCode = 0;

			System.out.println(groupname);
			if (rs.next())
			{

				subjectCode = Integer.parseInt(rs.getString("SubjectCode"));

			}

			String query3 = "select AssignmentName from AssignmentExist where SubjectCode=" + subjectCode + ";";

			rs = stmt1.executeQuery(query3);
			int sum = 0;

			int i = 0;

			while (rs.next())
			{

				String temp = rs.getString("AssignmentName");
				String query6 = "select Marks,Approved from " + temp.trim() + " where Rollno =" + startnum
						+ " and SubjectCode=" + subjectCode + " ;";

				Statement stmt3 = conn.createStatement();
				ResultSet rs1 = stmt3.executeQuery(query6);
				while (rs1.next())
				{

					if (rs1.getString("Approved").equals("1"))
					{
						sum += Integer.parseInt(rs1.getString("Marks"));
						System.out.println(sum);
					} else
					{
						sum = 0;
						break;
					}
				}
				i++;
			}

			System.out.println(i);

			sum = (60 * sum) / (i * 10);
			System.out.println("TermWork for practical is " + sum);

			int tw = ((sum + sum1) * 25) / 80;
			System.out.println("the  TermWork is " + tw);
			String query7 = "insert into TermWork values(" + startnum + "," + tw + "," + tw * 2 + "," + subjectCode
					+ ") on duplicate key update RollNo=values(RollNo),OutOf25=values(OutOf25),OutOf50=values(OutOf50),SubjectCode=values(SubjectCode);";
			System.out.println(query7);
			Statement stmt3 = conn.createStatement();

			stmt3.execute(query7);

			startnum += 1;
		}
		String query = "select StartRollNo,EndRollNo from GroupTable where GroupName='" + groupname.trim() + "';";

		Statement stmt1 = conn.createStatement();
		ResultSet rs5 = stmt1.executeQuery(query);
		startnum = 0;
		endnum = 0;

		if (rs5.next())
		{

			startnum = Integer.parseInt(rs4.getString("StartRollNo"));
			endnum = Integer.parseInt(rs4.getString("EndRollNo"));
		}

		String finalquery = "select *from TermWork where RollNo >=" + startnum + " and RollNo <=" + endnum + ";";

		Statement s = conn.createStatement();
		ResultSet r = s.executeQuery(finalquery);

		return r;

	}
}