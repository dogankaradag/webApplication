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
public class Database {
    private String fullname;
    private String username;
    private String password;
    
   public Database(){
       
   }
   public Database(String fullname,String username,String password){
       this.fullname = fullname;
       this.username = username;
       this.password = password;
   }
   
   public String getFullname(){
       return fullname;
   }
   
   public void setFullname(String fullname){
       this.fullname = fullname;
   }
   public String getUsername(){
       return username;
   }
   
   public void setUsername(String username){
       this.username = username;
   }
   public String getPassword(){
       return password;
   }
   
   public void setPassword(String password){
       this.password = password;
   }
    
}
