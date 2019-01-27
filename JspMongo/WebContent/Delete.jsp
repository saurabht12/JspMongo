<%@page import="java.io.IOException" %>
<%@page import="com.mongodb.DB" %>
<%@page import="com.mongodb.BasicDBObject" %>
<%@page import="com.mongodb.DBCollection" %>
<%@page  import="com.mongodb.MongoClient" %>
<%@page  import="com.mongodb.DBCursor" %>
<%@page import="com.mongodb.DBObject" %>
<%@page import="com.mongodb.client.MongoCollection" %>
<%@page import="com.mongodb.client.MongoDatabase" %>
<%@page import="org.bson.types.ObjectId" %>
<%@page  import="java.io.File" %>
<%@page import="org.bson.Document" %>
<%@page import="com.ConnectionDb" %>
<%
String str=request.getParameter("uname");
try
{
	
	 MongoCollection collection = ConnectionDb.getConnection();
     collection.deleteOne(new Document("_id", new ObjectId(str)));
     out.println("Record Deleted");
	
    response.sendRedirect("Login.jsp");


	}
	catch(Exception e)
	{
     out.println("Exception");
	}
%>
</html>
