<%@page import="java.io.IOException" %>
<%@page import="com.mongodb.DB" %>
<%@page import="com.mongodb.BasicDBObject" %>
<%@page import="com.mongodb.DBCollection" %>
<%@page import="com.mongodb.MongoClient" %>
<%@page import="com.mongodb.DBCursor" %>
<%@page import="com.mongodb.DBObject" %>
<%@page import="com.mongodb.client.MongoCollection" %>
<%@page import="com.mongodb.client.MongoDatabase" %>
<%@page import="org.bson.types.ObjectId" %>
<%@page import="java.io.File" %>
<%@page import="com.ConnectionDb" %>

<%@page import="org.apache.log4j.Logger" %>


<html>
<body style='background-color: darkorange';>
 <head><h1 align='center'><u>User Management</u></h1></head>
 <table width=80% border=1>  
 <form action='Add.jsp'><input type='submit' value='Add New'></form>
 <caption><h3>User Data:</h3></caption>
 <form action='index.jsp'><input type='submit' value='Logout'></form>
 <th>Name</th>
  <th>Password</th>
  <th>Email</th> 
  <th>Mobile</th>
   <th>ID</th>
    <th>Options</th>
     </tr>

<%! final static Logger logger = Logger.getLogger(Login_jsp.class); %>
<%
try
{
	logger.info("This is test 2.");
  
      MongoCollection collection = ConnectionDb.getConnection();
    DBCursor dbo = (DBCursor) collection.find();
            while(dbo.hasNext())
    {
       DBObject dbq=dbo.next();
       ObjectId id = (ObjectId) dbq.get( "_id" );
          String name=(String) dbq.get("name");
      String pass=(String) dbq.get("pass");
      String mob=(String) dbq.get("mobile Number");
      String email=(String) dbq.get("email");
       out.println("<tr>");
        out.println("<td>"+name+"</td>");
     out.println("<td>"+pass+"</td>");
         out.println("<td>"+email+"</td>");
     out.println("<td>"+mob+"</td>");
     out.println("<td>"+id+"</td>");
     out.println("<td><a href='Delete.jsp?uname="+id+"'>Delete</a></td> ");
      out.println("<td><a href='Update.jsp?uname="+id+"'>Edit</a></td></form>");

  }
  
}


catch(Exception e)
{

}
%>
</html>