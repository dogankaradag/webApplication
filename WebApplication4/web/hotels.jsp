<%-- 
    Document   : hotels
    Created on : 17 Tem 2021, 13:35:39
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.myhotel.em.Hotel" %>
<%@page import="com.myhotel.em.Manager" %>
<%
    String username_3 = (String)session.getAttribute("username");
    if(username_3 == null){
        response.sendRedirect("login.jsp");
        return;
    }
    Manager manager = new Manager();
    List<Hotel> hotelList = (List<Hotel>)session.getAttribute("searchList");
    long days = (long)session.getAttribute("days");
    int person = (int)session.getAttribute("person");
    String dates = (String)session.getAttribute("dates");
   
    for( Hotel hotel : hotelList){
        String s = "reservation" + hotel.getId();
        String reservation = request.getParameter(s);
        if(reservation != null){
            long price = hotel.getPrice() * days * person;
            String username_2 = (String)session.getAttribute("username");                     
            manager.insert_reservation(username_2,hotel.getId(),dates,hotel.getLocation(),hotel.getName(),price);
            response.sendRedirect("reservations.jsp");
                   }
                 
    } 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">    
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <style>
      .blink {
      animation: blinker 0.9s linear infinite;
      }
      @keyframes blinker {  
      50% { opacity: 0; }
      }
    </style>
    <title>JSP Page</title>
</head>
<body>
    <%@include file="navbar.jsp" %>
    <% for( Hotel hotel : hotelList) { %>
        <div class="container">
            <form>
            <div class="card" style="width: 36rem;">
                <img class="card-img-top" src="img/<%=hotel.getImage()%>.jpg" alt="Card image cap">
                <div class="card-body">
                <h5 id="name" name="name" class="card-title"><i class="fas fa-hotel"></i> <%=hotel.getName()%></h5>
                <br>
                <p id="location" name ="location" class="card-text"><i class="fas fa-map-marker"></i> <%=hotel.getLocation()%></p>
                <p id="price" name="price" class="card-text"><i class="fas fa-lira-sign"></i> <%=hotel.getPrice()*days*person%></p>
                <p class="card-text"><i class="fas fa-utensils"></i> Sağlıklı & Lokal Her Şey Dahil</p>
                <p class="card-text blink"><i class="fas fa-check"></i> 12 Taksit Seçeneği</p>
                <button name="reservation<%=hotel.getId()%>" class="btn btn-primary">Rezervasyon Yap</button>
            </div>
        </div>
             </form>   
    
                <br>
        </div>
       <% } %>
      
                

</body>
</html>
