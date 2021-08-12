<%-- 
    Document   : navbar
    Created on : 16 Tem 2021, 14:57:22
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>

</head>
<body>
    <nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
    
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="home.jsp">Ana Sayfa</a>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
          <%String username = (String)session.getAttribute("username"); %>
              <%if(username != null){%>
          <!--<li class="nav-item active">
            <a class="nav-link" href="hotels.jsp">Oteller</a>
          </li> -->
          <li class="nav-item active">
            <a class="nav-link" href="search.jsp">Otel Ara</a>
          </li>
          <%}%>
      </ul>
      <ul class="navbar-nav ml-auto">
          <%String username2 = (String)session.getAttribute("username"); %>
              <%if(username2 != null){%>
                <li class="nav-item-active">
                <a class="nav-link" href="reservations.jsp">Rezervasyonlarım</a>
                </li> 
                     
          <li class="nav-item-active">
              <a class="nav-link" href="logout.jsp">Çıkış Yap</a>
          </li>
                <% } %>
                
          <% if(username2 == null) { %>      
          <li class="nav-item-active">
            <a class="nav-link" href="login.jsp">Giriş Yap</a>
          </li>
        

      
          
        <li class="nav-item-active">
            <a class="nav-link" href="signup.jsp">Kayıt Olun</a>
        </li>
        <% }%>
      </ul>
      
    </div>
</nav>
    <br><br><br>
</body>
</html>
