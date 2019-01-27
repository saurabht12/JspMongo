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
<%@page import="com.ConnectionDb" %>
<html>
<body style='background-color: darkorange';>
<form  action='Add.jsp' >
<head><h1 align='center' style='margin-top:30px;' ><u>Add User</u></h1></head>
<table align='center' style='margin-top:70px;height:300px;' border=1>
<tr><td>Name</td><td><input type='text' name='uname'></td></tr>
<tr><td>Mobile No</td><td><input type='text' name='mob' ></td></tr>
<tr><td>Password</td><td><input type='password' name='pass'></td></tr>
<tr><td>Email</td><td><input type='text' name='email'></td></tr></table>
 <input type="submit" align="center" style='margin-left:450;width:90px;height:40px;margin-top:30px;' value="submit"></form>
<%
String getValue=request.getParameter("uname");
if(!getValue.equals(null))
{
	
String str=request.getParameter("uname");
String str2=request.getParameter("mob");
String str1=request.getParameter("pass");
String str3=request.getParameter("email");
try
{
	
	 MongoCollection collection = ConnectionDb.getConnection();
	        DBObject document1 = new BasicDBObject();
        document1.put("name", str);
        document1.put("pass", str1);
        document1.put("mobile Number",str2);
        document1.put("email",str3);
        collection.insertOne(document1);
         response.sendRedirect("login");
     }
catch(Exception e)
{

}
}
%>
</html>
