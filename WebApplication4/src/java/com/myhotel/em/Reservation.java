/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myhotel.em;

/**
 *
 * @author USER
 */
public class Reservation {
    private String username;
    private int id;
    private String dates;
    private String location;
    private String name;
    private int price;
    
    public Reservation(String username,int id,String dates,String location,String name,int price){
        this.username = username;
        this.id = id;
        this.dates = dates;
        this.location = location;
        this.name = name;
        this.price = price;
    }
   public String getUsername(){
       return username;
   }
   
   public void setUsername(String username){
       this.username = username;
   }
   public int getId(){
       return id;
   }
   
   public void setId(int id){
       this.id = id;
   }
   public String getDates(){
       return dates;
   }
   
   public void setDates(String dates){
       this.dates = dates;
   }
    public String getLocation(){
       return location;
   }
   
   public void setLocation(String location){
       this.location = location;
   }
    public String getName(){
       return name;
   }
   
   public void setName(String name){
       this.name = name;
   }
    public int getPrice(){
       return price;
   }
   
   public void setPrice(int price){
       this.price = price;
   }
   
}
