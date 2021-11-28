# RemoteLearn
Assignment Submissions are undoubtedly the most hectic tasks in college life. Checking long  journals and entering its records in the hard cover record book can be very cumbersome to a professor.  The sole of the project is to make this task as efficient as possible with zero paper-work for record keeping. The project provides a platform to keep record for the user ( majorly comprising of Professors and Students ) and easy retrieval of the required information to the user.  Currently the project has been structured purposefully to meet the need for  users of Pune Institute of Computer Technology.

In this pandamic situation, such project will be extremely helpful to the students as well as faculties to maintain the academic records of students even from remote places.

## Instructions to configure the project
1. This is a maven project created in eclipse which has required dependencies in pom.xml file.
2. Additionally, you need to configure a server for hosting the application. This application is built and tested with apache-tomcat-9.0.55. (https://tomcat.apache.org/download-90.cgi)
3. Add apache-tomcat-9.0.55\bin and apache-tomcat-9.0.55\lib in java build path.
4. Create database remoteLearDb in my-sql and update the connection strings in the DAO with appropriate user and passwords.
5. Use database file remoteLearnDb.sql which is created using command mysqldump -u root -p remotelearndb > remoteLearnDb.sql 
6. Update the database with the stored procedures in the RemoteLearn/DB directory.
7. Check the DB connection and run the Login.jsp.
