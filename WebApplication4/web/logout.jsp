<%-- 
    Document   : logout
    Created on : 16 Tem 2021, 15:37:35
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username_3 = (String)session.getAttribute("username");
    if(username_3 == null){
        response.sendRedirect("login.jsp");
        return;
    }


    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">    

</head>
<body>
    <%@include file="navbar.jsp" %>
    <%
       session.removeAttribute("username");
       response.sendRedirect("home.jsp");
        %>
</body>
</html>
