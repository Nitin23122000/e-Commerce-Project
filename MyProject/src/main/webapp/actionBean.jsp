<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="emp" class="com.bean.Emp" scope="page">
<jsp:setProperty property="eid" name="emp" value="1"/>
<jsp:setProperty property="ename" name="emp" value="Nitin"/>
<jsp:setProperty property="sal" name="emp" value="15000"/>
</jsp:useBean>

<h1>Employee Data</h1>
EID : <jsp:getProperty property="eid" name="emp"/>
Emp Name : <jsp:getProperty property="ename" name="emp"/>
Salary : <jsp:getProperty property="sal" name="emp"/>

</body>
</html>