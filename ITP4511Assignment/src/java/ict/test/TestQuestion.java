///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package ict.test;
//
//import ict.bean.Question;
//import ict.db.QuestionDB;
//
///**
// *
// * @author HaYYY
// */
//public class TestQuestion {
//
//    public static void main(String[] arg) {
//        String url = "jdbc:mysql://localhost:3306/happy_elearning";
//        String username = "root";
//        String password = "";
//        QuestionDB question = new QuestionDB(url, username, password);
//        question.createQuestionTable();
//
//        question.addQuestion(001, "Outsource is a major factor that undercut "
//                + "the salary of IT jobs in Hong Kong", "selection", 01);
//        question.addQuestion(002, "Off-shore is a major factor for the shortage "
//                + "IT workforce in Hong Kong", "selection", 02);
//        question.addQuestion(003, "Globalization is one of the reason of "
//                + "rich-poor divided in the developed country", "selection", 03);
//        question.addQuestion(001, "Big remuneration gap for ITP is very common "
//                + "in the developed country", "selection", 04);
//
//        question.queryQuestionByCategory(001);
//        question.queryQuestionByQuestionType("it");
//    }
//
//}
