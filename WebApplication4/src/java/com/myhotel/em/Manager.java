/*
 * To change this license header, choose License Headers in Project Properties.
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myhotel.em;
import java.sql.*;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 *
 * @author USER
 */
public class Manager {
    
    public void insert(Database database)throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
    
        String url = "jdbc:mysql://localhost:3306/wbblog";
        String user = "root";
        String password = "";

        Connection connection = DriverManager.getConnection(url,user,password);
        String sql = "Insert into users(name,username,password) values(?,?,?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,database.getFullname());
        statement.setString(2,database.getUsername());
        statement.setString(3,database.getPassword());

        int affected = statement.executeUpdate();
        connection.close();
            
        return;
    }
    
    public boolean find(String entered_username, String entered_password)throws Exception{
        
        Class.forName("com.mysql.jdbc.Driver");
    
        String url = "jdbc:mysql://localhost:3306/wbblog";
        String user = "root";
        String password = "";

        Connection connection = DriverManager.getConnection(url,user,password);
        
        String sql = "Select password From users Where username = ? and password = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,entered_username);
        statement.setString(2,entered_password);
        ResultSet result = statement.executeQuery();
        while(result.next()){
            String value = result.getString("password");
            return value.equals(entered_password);
        }
         connection.close();
         return false;
           
    }
    public List<Hotel> list() throws Exception{
        List<Hotel> hotelList = new ArrayList<Hotel>();
        
        Class.forName("com.mysql.jdbc.Driver");
    
        String url = "jdbc:mysql://localhost:3306/wbblog";
        String user = "root";
        String password = "";

        Connection connection = DriverManager.getConnection(url,user,password);
        String sql = "Select * from hotels";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet result = statement.executeQuery();
        while(result.next()){
            int id = result.getInt("id");
            String name = result.getString("name");
            String location = result.getString("location");
            int price = result.getInt("price");
            String image = result.getString("image");
            Hotel hotel = new Hotel(id,name,location,price,image);
            hotelList.add(hotel);
        }
        
        connection.close();
        
        return hotelList;
    }
    
    public List<Hotel> search_list(String searching_location) throws Exception{
        
        List<Hotel> searchList = new ArrayList<Hotel>();
        String url = "jdbc:mysql://localhost:3306/wbblog";
        String user = "root";
        String password = "";

        Connection connection = DriverManager.getConnection(url,user,password);
        String sql = "Select * from hotels where location = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,searching_location);
        ResultSet result = statement.executeQuery();
        while(result.next()){
            int id = result.getInt("id");
            String name = result.getString("name");
            String location = result.getString("location");
            int price = result.getInt("price");
            String image = result.getString("image");
            Hotel hotel = new Hotel(id,name,location,price,image);
            searchList.add(hotel);
        }
        
        connection.close();
        
        return searchList;
    }
    public boolean isValidDate(String dayOfIn,String monOfIn,String yearOfIn,String dayOfOut,String monOfOut,String yearOfOut)throws Exception{
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        String textOfIn = dayOfIn + "-" + monOfIn + "-" + yearOfIn;
        String textOfOut = dayOfOut + "-" + monOfOut + "-" + yearOfOut;
        Date d1 = simpleDateFormat.parse(textOfIn);
        Date d2 = simpleDateFormat.parse(textOfOut);
        
        return d1.before(d2);
 
        
    }
    public long numOfDays(String dayOfIn,String monOfIn,String yearOfIn,String dayOfOut,String monOfOut,String yearOfOut)throws Exception{
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        String textOfIn = dayOfIn + "-" + monOfIn + "-" + yearOfIn;
        String textOfOut = dayOfOut + "-" + monOfOut + "-" + yearOfOut;
        Date d1 = simpleDateFormat.parse(textOfIn);
        Date d2 = simpleDateFormat.parse(textOfOut);
        long diff = d2.getTime() - d1.getTime();
        return diff  / (1000 * 60 * 60 * 24);
    }
    public void insert_reservation(String logged_username,int hotel_id,String dates, String location, String hotel_name, long price)throws Exception{
        
         String url = "jdbc:mysql://localhost:3306/wbblog";
         String user = "root";
         String password = "";

        Connection connection = DriverManager.getConnection(url,user,password);
        String sql = "Insert into reservations(username,id,dates,location,hotel_name,price) values(?,?,?,?,?,?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,logged_username);
        statement.setInt(2,hotel_id);
        statement.setString(3,dates);
        statement.setString(4,location);
        statement.setString(5,hotel_name);
        statement.setLong(6,price);
        int affected = statement.executeUpdate();
        connection.close();
            
        return;    
    }
    public List<Reservation> showReservation(String logged_username)throws Exception{
        List<Reservation> searchList = new ArrayList<Reservation>();
        String url = "jdbc:mysql://localhost:3306/wbblog";
        String user = "root";
        String password = "";

        Connection connection = DriverManager.getConnection(url,user,password);
        String sql = "Select *  from reservations where username = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,logged_username);
        ResultSet result = statement.executeQuery();
        while(result.next()){
            String username = result.getString("username");
            int id = result.getInt("id");
            String dates = result.getString("dates");
            String location = result.getString("location");
            String name = result.getString("hotel_name");
            int price = result.getInt("price");
            Reservation reservation = new Reservation(username,id,dates,location,name,price);
            searchList.add(reservation);
        }
        connection.close();
        return searchList;
    }
}
