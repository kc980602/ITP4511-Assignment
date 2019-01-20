///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package ict.test;
//
//import ict.bean.User;
//import ict.db.UserDB;
//
///**
// *
// * @author tszch
// */
//public class TestCheckValid {
//    public static void main(String[] arg) {
//        String url = "jdbc:mysql://localhost:3306/ITP4511_DB";
//        String username = "root";
//        String password = "";
//        UserDB custDb = new UserDB(url, username, password);
//        String u = "Nancy";
//        String p = "123";
//        custDb.createUserTable();
//        if(custDb.isValidUser(u, p)){
//            System.out.println(u + " is OK");
//        } else {
//            System.out.println("No");
//        }
//        
//    }
//}
