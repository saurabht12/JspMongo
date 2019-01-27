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
<html>
<form  action='update' method='GET'>
<html><body style='background-color: darkorange;height:200px';>
		<head><h1 align='center'><u>Update User Record</u></h1></head>
		<table width=30% align='center' border=1>
		<tr><td>Update Mobile</td><td><input type='text' name='mob'></td>
		<tr><td>Update Password</td><td><input type='text' name='pass'></td>
        <trr><td> id</td><td><input type='hidden' type='text' name='getId' value='"+id+"'></td>
		<tr><td>Update Email</td><td><input type='text' name='email'></td></tr>
		<tr><td><input type='submit' name='submit' value='submit'><td></tr></form>
		</html>
		<%
		String mob=request.getParameter("mob");
		String pass=request.getParameter("pass");
		String email=request.getParameter("email");
		String newId=request.getParameter("getId");
	    if(!newId.equals(null)){
		try
		{  
			 MongoCollection collection = ConnectionDb.getConnection();
			Document Query = new Document("_id", new ObjectId(newId));
         	Document infoObject = new Document("mobile Number", mob);
			infoObject.put("pass",pass);
			infoObject.put("email",email);
			Document updateObject = new Document("$set", infoObject);
			collection.updateOne(Query, updateObject);
			response.sendRedirect("Login.jsp");
		}
		catch(Exception e)
		{
      out.println("404");
		}
	  }
	  else
	  {
	  	out.println("else");
	  }
%>