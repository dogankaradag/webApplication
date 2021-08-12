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
public class Hotel {
    private int id;
    private String name;
    private String location;
    private int price;
    private String image;
    
    public Hotel(int id,String name,String location,int price,String image){
        
        this.id = id;
        this.name = name;
        this.location = location;
        this.price = price;
        this.image = image;    
    }
    
     public int getId(){
       return id;
   }
   
   public void setId(int id){
       this.id = id;
   }
   public String getName(){
       return name;
   }
   
   public void setName(String name){
       this.name = name;
   }
    public String getLocation(){
       return location;
   }
   
   public void setLocation(String location){
       this.location = location;
   }
    public int getPrice(){
       return price;
   }
   
   public void setPrice(int price){
       this.price = price;
   }
   
    public String getImage(){
       return image;
   }
   
   public void setImage(String fullname){
       this.image = image;
   }
   
}
