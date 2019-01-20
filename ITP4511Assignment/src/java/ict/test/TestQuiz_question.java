///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package ict.test;
//
//import ict.db.QuestionDB;
//import ict.db.QuizDB;
//import ict.db.Quiz_questionDB;
//import java.sql.Timestamp;
//
///**
// *
// * @author HaYYY
// */
//public class TestQuiz_question {
//
//    public static void main(String[] arg) {
//        String url = "jdbc:mysql://localhost:3306/happy_elearning";
//        String username = "root";
//        String password = "";
//
//        QuizDB quiz = new QuizDB(url, username, password);
//        quiz.createQuizTable();
//        Timestamp open = Timestamp.valueOf("2007-09-23 10:10:10.0");
//        Timestamp close = Timestamp.valueOf("2007-09-23 10:10:10.0");
//        Timestamp now = new Timestamp(System.currentTimeMillis());
//        quiz.addQuiz("Quiz 1", "", open, close, 3, 120, now);
//        quiz.addQuiz("IT exam", "", open, close, 3, 120, now);
//        quiz.addQuiz("Network IQ test", "", open, close, 3, 120, now);
//
//        QuestionDB question = new QuestionDB(url, username, password);
//        question.createQuestionTable();
//        question.addQuestion(001, "Quiz1 Q1 selection", "selection", 01);
//        question.addQuestion(002, "Quiz2 Q1 selection", "selection", 02);
//        question.addQuestion(003, "Quiz3 Q1 selection", "selection", 03);
//        question.addQuestion(001, "Quiz1 Q2 selection", "selection", 04);
//        question.addQuestion(001, "Quiz1 Q3 multichoice", "multichoice", 01);
//        question.addQuestion(002, "Quiz2 Q2 multichoice", "multichoice", 02);
//        question.addQuestion(003, "Quiz3 Q2 multichoice", "multichoice", 03);
//        question.addQuestion(001, "Quiz1 Q4 multichoice", "multichoice", 04);
//
//        question.queryQuestionByCategory(001);
//        question.queryQuestionByQuestionType("it");
//
//        Quiz_questionDB quiz_question = new Quiz_questionDB(url, username, password);
//        quiz_question.createQuiz_questionTable();
//
//        quiz_question.addQuiz_question(1, 1);
//        quiz_question.addQuiz_question(2, 2);
//        quiz_question.addQuiz_question(3, 3);
//        quiz_question.addQuiz_question(1, 4);
//        quiz_question.addQuiz_question(1, 5);
//        quiz_question.addQuiz_question(2, 6);
//        quiz_question.addQuiz_question(3, 7);
//        quiz_question.addQuiz_question(1, 8);
//
//        question.queryQuestionByQuestionType("selection");
//        
//        quiz_question.queryQuiz_questionByQuizId(1);
//        quiz_question.queryQuiz_questionByQuizId(2);
//        quiz_question.queryQuiz_questionByQuizId(3);
//    }
//}
