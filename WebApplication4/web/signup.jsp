<%-- 
    Document   : signup
    Created on : 15 Tem 2021, 15:39:37
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.myhotel.em.Database" %>
<%@page import="com.myhotel.em.Manager" %>
<%@page import="java.sql.*"%>
<%
    String inserting = request.getParameter("inserting");
    String message = "";
    if(inserting!=null){
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Database database = new Database(fullname,username,password);
        Manager manager = new Manager();
        
        manager.insert(database);
        message += "Basariyle uye oldunuz...";
        response.sendRedirect("login.jsp");
    
    }    

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
</head>
<body>
    <%@include file="navbar.jsp" %>
   <div class = "container">
    <form> 
        
             <h5>Kayıt Ol</h5>
             <hr>
        <div class="form-group">
            <label for="example1">İsim - Soyisim</label>
            <input name="fullname" type="text" class="form-control" id="example1" placeholder="Fullname">
        </div>
        <div class="form-group">
            <label for="example2">Kullanıcı adı</label>
            <input name="username" type="text" class="form-control" id="example2" placeholder="Username">
        </div>
        <div class="form-group">
            <label for="example3">Şifre</label>
            <input name="password" type="password" class="form-control" id="example3" placeholder="Password">
        </div>
        <button name="inserting" type="submit" class="btn btn-primary">Kayıt ol</button>
        
        
        
    </form>
       
           
   </div>
</body>
</html>
