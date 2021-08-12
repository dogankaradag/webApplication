<%-- 
    Document   : home
    Created on : 16 Tem 2021, 14:55:49
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.myhotel.em.Hotel" %>
<%@page import="com.myhotel.em.Manager" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">    

</head>
<body>
    <%@include file="navbar.jsp" %>
        <div class = "container">
            <%String username_1 = (String)session.getAttribute("username"); %>
              <%if(username_1 == null){%>
            <h2>Hoşgeldiniz</h2>
            <hr>
            <p>Tur sayfamıza hoşgeldiniz... Otel aramak ve rezervasyon yapmak için lütfen giriş yapın...</p>
    
            <%}%>
            <%String username_2 = (String)session.getAttribute("username"); %>
              <%if(username_2 != null){%>
              <h2>Hoşgeldiniz <%=username_2%></h2>
              <hr>
              <p>Otel arayabilir ve rezervasyon yapabilirsiniz...</p>
              <%}%>
        </div>
        
           
</body>
</html>
