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
//public class TestAddRecord {
//    public static void main(String[] arg) {
//        String url = "jdbc:mysql://localhost:3306/ITP4511_DB";
//        String username = "root";
//        String password = "";
//        UserDB custDb = new UserDB(url, username, password);
//        custDb.createUserTable();
//        custDb.addUser("1", "Peter", "123", "Student");
//        System.out.println("Peter is added");
//        custDb.addUser("2", "Nancy", "123", "Teacher");
//        System.out.println("Nancy is added");
//
//    }
//}
