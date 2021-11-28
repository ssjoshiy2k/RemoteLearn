package com.pict.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 5242880, maxFileSize = 10485760, maxRequestSize = 20971520)
public class FileUpload extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		response.setContentType("text/html;charset=UTF-8");

		final Part filePart = request.getPart("file");
		if (filePart == null)
		{
			System.out.println("File Part is NULL!!");
		}
		System.out.println("iqwriwque");
		String FileName = request.getParameter("FileName");
		String UserID = request.getParameter("UserID");
		String subject = request.getParameter("subjectname");
		String group = request.getParameter("groupname");
		System.out.println("afhIQ");
		System.out.println(subject);
		System.out.println(group);
		System.out.println("oals");
		InputStream pdfFileBytes = null;
		final PrintWriter writer = response.getWriter();
		int lim;
		lim = 429496729;
		try
		{

			if (!filePart.getContentType().equals("application/pdf"))
			{
				writer.println("<br/> Invalid File");
				return;
			}

			else if (filePart.getSize() > lim)
			{ // 2mb
				{
					writer.println("<br/> File size too big");
					return;
				}
			}

			pdfFileBytes = filePart.getInputStream(); // to get the body of the request as binary data

			final byte[] bytes = new byte[pdfFileBytes.available()];
			pdfFileBytes.read(bytes); // Storing the binary data in bytes array.

			Connection con = null;
			Statement stmt = null;

			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/remotelearndb", "root", "y2kk2y#68-");
			} catch (Exception e)
			{
				System.out.println(e);
				System.exit(0);
			}

			int success = 0;
			PreparedStatement pstmt = con.prepareStatement(
					"INSERT INTO FileDatabase(FileName,FileContent,UserID,SubjectName,GroupName) VALUES(?,?,?,?,?)");
			pstmt.setString(1, FileName);
			pstmt.setBytes(2, bytes); // Storing binary data in blob field.
			pstmt.setString(3, UserID);
			pstmt.setString(4, subject);
			pstmt.setString(5, group);
			success = pstmt.executeUpdate();
			if (success >= 1)
				System.out.println("Book Stored");
			con.close();

			response.sendRedirect("Welcome1.jsp");

		} catch (FileNotFoundException fnf)
		{
			writer.println("You  did not specify a file to upload");
			writer.println("<br/> ERROR: " + fnf.getMessage());

		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally
		{

			if (pdfFileBytes != null)
			{
				pdfFileBytes.close();
			}
			if (writer != null)
			{
				writer.close();
			}
		}

	}
}
