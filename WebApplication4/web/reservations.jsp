<%-- 
    Document   : reservations
    Created on : 24 Tem 2021, 00:54:39
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.myhotel.em.Hotel" %>
<%@page import="com.myhotel.em.Manager" %>
<%@page import="com.myhotel.em.Reservation" %>
<%@page import="java.sql.*" %>

<%
    String username_3 = (String)session.getAttribute("username");
    if(username_3 == null){
        response.sendRedirect("login.jsp");
        return;
    }
    Manager manager = new Manager();
    String logged_username = (String)session.getAttribute("username");
    List<Reservation> reservationList = manager.showReservation(logged_username);



%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">    

    <title>JSP Page</title>
</head>
<body>
        <%@include file="navbar.jsp" %>
<div class="container">
    <p>kullanıcı: <%=logged_username%></p>
</div>        
<div class="container">
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">Tarih</th>
                <th scope="col">Konum</th>
                <th scope="col">Otel Adı</th>
                <th scope="col">Fiyat</th>
            </tr>
        </thead>
        <% for(Reservation reservation : reservationList){ %>
        <tbody>
            <tr>
                <th scope="row"><%=reservation.getDates()%></th>
                <td><%=reservation.getLocation()%></td>
                <td><%=reservation.getName()%></td>
                <td><%=reservation.getPrice()%> TL</td>
            </tr>
            
            <% } %>
        </tbody>    
</div>
    </body>
</html>
