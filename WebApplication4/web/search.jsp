<%-- 
    Document   : search
    Created on : 18 Tem 2021, 16:12:43
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.myhotel.em.Hotel" %>
<%@page import="com.myhotel.em.Manager" %>
<%@page import="java.sql.*" %>
<%  String username_3 = (String)session.getAttribute("username");
    if(username_3 == null){
        response.sendRedirect("login.jsp");
        return;
    }
    String searching = request.getParameter("searching");
    String location = request.getParameter("location");
    String message = "";
    
    if(searching!=null) {
        String dateOfIn = request.getParameter("dateOfIn");
        String[] arrayOfIn = dateOfIn.split("-");
        String dateOfOut = request.getParameter("dateOfOut");
        String[] arrayOfOut = dateOfOut.split("-");
        String numOfPerson_s = request.getParameter("numOfPerson");
        int numOfPerson = Integer.parseInt(numOfPerson_s);
        Manager manager = new Manager();
        if(manager.isValidDate(arrayOfIn[2],arrayOfIn[1],arrayOfIn[0],arrayOfOut[2],arrayOfOut[1],arrayOfOut[0])){
            long days = manager.numOfDays(arrayOfIn[2],arrayOfIn[1],arrayOfIn[0],arrayOfOut[2],arrayOfOut[1],arrayOfOut[0]);
            session.setAttribute("days",days);
            session.setAttribute("person",numOfPerson);
            String dates = arrayOfIn[2] + "." + arrayOfIn[1] + "." + arrayOfIn[0] + " - " + arrayOfOut[2] + "." + arrayOfOut[1] + "." + arrayOfOut[0] ;
            session.setAttribute("dates",dates);
            List<Hotel> searchList = manager.search_list(location);
            session.setAttribute("searchList",searchList);
            response.sendRedirect("hotels.jsp");
            return;
        }  
        else {
            message = "Geçersiz Bilgi...";
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

    <title>Search</title>
</head>
<body> 
        <%@include file="navbar.jsp" %>
        <div class = "container">
            <form>
            <div class="form-group col-md-4">
                <h5><i class="fas fa-location-arrow"></i> Gidilecek Yer</h5> <hr>
                <label for="inputState"></label>
               <select id="inputState" class="form-control" name = "location">
                    <option selected>Kemer</option>
                    <option>Alanya</option>
                    <option>Bodrum</option>
                    <option>Marmaris</option>
                    <option>Lara</option>
                </select>
            </div>
            <hr>
            <div class="row">
                <div class = "col">
            <div class="form-group col-md-6">
                <h5>Giriş Tarihi <i class="fas fa-plane-departure"></i></h5> <hr>
                <input type="date" name="dateOfIn" value="2021-06-06">
            </div>
            
                        
                        </div>
               <div class = "col">         
             <div class="form-group col-md-6">
                <h5>Çıkış Tarihi <i class="fas fa-plane-arrival"></i></h5> <hr>
               <input type="date" name="dateOfOut" value="2021-06-06">
            </div>
           
                       
              
               </div>
                        </div>
                        <hr>
            <div class="form-group col-md-4">
                <h5>Kişi Sayısı <i class="fas fa-users"></i></h5>
                <hr>
                <button type="button" class="btn btn-danger" onclick="myFunction()">-</button>
                <input type="submit" class="btn btn-light" value = "2" id="num"></input>
                <input type="hidden" name ="numOfPerson" id = "num_hidden"></input>
                <button type="button" class="btn btn-success" onclick="myFunction2()">+</button>
            </div>
                        <br>      
            <button name="searching" type="submit" class="btn btn-primary" onclick="myFunction3()">Otel Ara</button>
            <h5 style="color:red;""><%=message%></h5>
            </form>
        </div>
    
            <script>
                function myFunction2(){
                
                let a = document.querySelector('#num');
                if(Number(a.value) < 5){
                a.value = Number(a.value) + 1;
            }
            }
            function myFunction(){
                
                let a = document.querySelector('#num');
                if(Number(a.value) > 1){
                a.value = Number(a.value) - 1;
            }
            }
            function myFunction3(){
                let b = document.querySelector('#num_hidden');
                let a = document.querySelector('#num');
                b.value = a.value;
             
            }
                
            </script>
</body>
</html>
