
package com.pict.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SubmissionTicketDao
{

	Connection conn;

	public ResultSet getTicket(String username, String groupname, int assignCount)
			throws ClassNotFoundException, SQLException
	{

		conn = ConnectDatabase.getConnection();
		String q = "update UserInfo set AssignCount=" + assignCount + " where UserID='" + username.trim()
				+ "' and GroupCode=(select GroupCode from GroupTable where GroupName='" + groupname.trim() + "');";

		Statement s = conn.createStatement();

		s.execute(q);

		String query4 = "select SubjectCode from UserInfo where UserID='" + username.trim()
				+ "' and GroupCode=(select GroupCode from GroupTable where GroupName='" + groupname.trim() + "');";

		Statement stmt1 = conn.createStatement();

		ResultSet rs = stmt1.executeQuery(query4);

		int subjectCode = 0;

		System.out.println(groupname);
		if (rs.next())
		{

			subjectCode = Integer.parseInt(rs.getString("SubjectCode"));

		}
		String query1 = "select count(AssignmentName) from AssignmentExist where SubjectCode=" + subjectCode + ";";

		Statement stmt = conn.createStatement();
		rs = stmt.executeQuery(query1);

		if (rs.next())
		{
			if (assignCount != Integer.parseInt(rs.getString("count(AssignmentName)")))
			{

				System.out.println("All Assignments are not Created by Respctive faculty as specified earlier");

				ResultSet ts = null;
				return ts;
			} else
			{

				String query2 = "select StartRollNo,EndRollNo from GroupTable where GroupCode=(select GroupCode from GroupTable where GroupName='"
						+ groupname.trim() + "');";

				Statement stmt2 = conn.createStatement();
				ResultSet rs4 = stmt2.executeQuery(query2);
				int startnum = 0, endnum = 0;

				if (rs4.next())
				{

					startnum = Integer.parseInt(rs4.getString("StartRollNo"));
					endnum = Integer.parseInt(rs4.getString("EndRollNo"));
				}

				while (endnum >= startnum)
				{

					String query3 = "select AssignmentName from AssignmentExist where SubjectCode=" + subjectCode + ";";

					rs = stmt.executeQuery(query3);
					int sum = 0;

					int i = 0;

					int flag = 0;
					while (rs.next())
					{

						String temp = rs.getString("AssignmentName");
						String query6 = "select Approved from " + temp.trim() + " where Rollno =" + startnum
								+ " and SubjectCode=" + subjectCode + " ;";

						Statement stmt3 = conn.createStatement();
						ResultSet rs1 = stmt3.executeQuery(query6);
						while (rs1.next())
						{

							if (rs1.getString("Approved").equals("1"))
							{
								continue;

							} else
							{
								String query7 = "insert into SubmissionTicket values(" + startnum + ",0," + subjectCode
										+ ") on duplicate key update Approved=0;";

								Statement stmt4 = conn.createStatement();

								stmt4.execute(query7);
								System.out.println("DisApprove");
								flag = 1;
								break;
							}
						}
						i++;
					}
					if (flag == 0)
					{

						String query7 = "insert into SubmissionTicket values(" + startnum + ",1," + subjectCode
								+ ") on duplicate key update Approved=1; ";

						Statement stmt4 = conn.createStatement();

						System.out.println("Approve");
						stmt4.execute(query7);

					}
					startnum++;
				}

				String query = "select StartRollNo,EndRollNo from GroupTable where GroupCode=(select GroupCode from GroupTable where GroupName='"
						+ groupname.trim() + "');";

				Statement stm = conn.createStatement();
				ResultSet rs5 = stm.executeQuery(query);
				startnum = 0;
				endnum = 0;

				if (rs5.next())
				{

					startnum = Integer.parseInt(rs4.getString("StartRollNo"));
					endnum = Integer.parseInt(rs4.getString("EndRollNo"));
				}
				/*
				 * String subjectquery = "select SubjectCode from UserInfo where UserID='" +
				 * username.trim() +
				 * "' and GroupCode=(select GroupCode from GroupTable where GroupName='" +
				 * groupname.trim() + "');";
				 * 
				 * Statement stm = conn.createStatement();
				 * 
				 * rs = stmt1.executeQuery(subjectquery);
				 * 
				 * int subjectCode = 0;
				 * 
				 * System.out.println(groupname); if (rs.next()) {
				 * 
				 * subjectCode = Integer.parseInt(rs.getString("SubjectCode"));
				 * 
				 * }
				 */
				String finalquery = "select *from SubmissionTicket where RollNo >=" + startnum + " and RollNo <="
						+ endnum + " and SubjectCode=" + subjectCode + ";";

				Statement st = conn.createStatement();
				ResultSet r = s.executeQuery(finalquery);

				return r;
			}

		}
		return null;
	}
}