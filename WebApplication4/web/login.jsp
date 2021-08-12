<%-- 
    Document   : login
    Created on : 16 Tem 2021, 00:15:43
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.myhotel.em.Database" %>
<%@page import="com.myhotel.em.Manager" %>
<%@page import="java.sql.*"%>

<%
    String inserting = request.getParameter("inserting");
    String message = "";
    boolean result = false;
    if(inserting!=null){
       
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Manager manager = new Manager();
        
        
        if(manager.find(username,password)){
            session.setAttribute("username",username);
            response.sendRedirect("search.jsp");
        }
        else{
            message = "Kullanıcı adı veya şifre yanlış...";
        }
       
    
    }    

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
    <form> 
        <div class = "container">
             <h5>Giriş Yap</h5>
             <hr>
        <div class="form-group">
            <label for="example2">Kullanıcı adı</label>
            <input name="username" type="text" class="form-control" id="example2" placeholder="Username">
        </div>
        <div class="form-group">
            <label for="example3">Şifre</label>
            <input name="password" type="password" class="form-control" id="example3" placeholder="Password">
        </div>
        <button name="inserting" type="submit" class="btn btn-primary">Giriş Yap</button>
        
        
         </div>
        
    </form>
    <div class="container">
        <br>
    <%=message%>
    
    </div>
    
   
</body>
</html>
 