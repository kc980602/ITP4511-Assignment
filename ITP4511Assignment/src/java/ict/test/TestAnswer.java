/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.test;

import ict.db.*;
import java.sql.Timestamp;

/**
 *
 * @author HaYYY
 */
public class TestAnswer {

    public static void main(String[] arg) {
        String url = "jdbc:mysql://localhost:3306/happy_elearning";
        String username = "root";
        String password = "";
        QuestionDB question = new QuestionDB(url, username, password);
        Question_selectionDB qs = new Question_selectionDB(url, username, password);
        Question_multichoiceDB qm = new Question_multichoiceDB(url, username, password);
        Quiz_questionDB qq = new Quiz_questionDB(url, username, password);
        QuizDB quiz = new QuizDB(url, username, password);
        QuizAssignmentDB qa = new QuizAssignmentDB(url, username, password);
        Student_quizDB sq = new Student_quizDB(url, username, password);

        question.createQuestionTable();
        qs.createQuestion_selectionTable();
        qm.createQuestion_multichoiceTable();
        quiz.createQuizTable();
        qq.createQuiz_questionTable();
        qa.createQuizAssignmentTable();
        sq.createStudent_QuizTable();

//        Timestamp open = Timestamp.valueOf("2007-09-23 10:10:10.0");
//        Timestamp close = Timestamp.valueOf("2007-09-23 10:10:10.0");
//        Timestamp now = new Timestamp(System.currentTimeMillis());
//        quiz.addQuiz("Quiz 1", "", open, close, 3, 120, now);
//        quiz.addQuiz("IT exam", "", open, close, 3, 120, now);
//        quiz.addQuiz("Network IQ test", "", open, close, 3, 120, now);
//        question.addQuestion(1, "multichoice", "Outsource is a major factor that undercut "
//                + "the salary of IT jobs in Hong Kong");
//        question.addQuestion(1, "multichoice", "Off-shore is a major factor for the shortage "
//                + "IT workforce in Hong Kong");
//        question.addQuestion(1, "multichoice", "Globalization is one of the reason of "
//                + "rich-poor divided in the developed country");
//        question.addQuestion(1, "multichoice", "Big remuneration gap for ITP is very common "
//                + "in the developed country");
//        question.addQuestion(1, "multichoice", "To most of employers, technical competence of"
//                + " their staff is more important than morality");
//        question.addQuestion(1, "multichoice", "CPD and professional membership status can"
//                + " guarantee the career path of an IT Professional.");
//        question.addQuestion(1, "multichoice", "CPD is one of the keys to sustain the competitive"
//                + " advantage of an IT professional.");
//        question.addQuestion(1, "multichoice", "Life Long Learning is equivalent to Continuous"
//                + " Professional Development to most of ITPs");
//        question.addQuestion(1, "multichoice", "Many professional bodies have mandatory CPD "
//                + "hours for their members.");
//        question.addQuestion(1, "multichoice", "Mentoring Higher Diploma students is an "
//                + "example of CPD for an ITP.");
//
//        qm.addAnswer(1, "True;False;All of above;None of above", "True");
//        qm.addAnswer(2, "True;False;All of above;None of above", "False");
//        qm.addAnswer(3, "True;False;All of above;None of above", "True");
//        qm.addAnswer(4, "True;False;All of above;None of above", "True");
//        qm.addAnswer(5, "True;False;All of above;None of above", "False");
//        qm.addAnswer(6, "True;False;All of above;None of above", "False");
//        qm.addAnswer(7, "True;False;All of above;None of above", "True");
//        qm.addAnswer(8, "True;False;All of above;None of above", "False");
//        qm.addAnswer(9, "True;False;All of above;None of above", "True");
//        qm.addAnswer(10, "True;False;All of above;None of above", "True");
//        
//        qq.addQuiz_question(1, 1);
//        qq.addQuiz_question(1, 2);
//        qq.addQuiz_question(1, 3);
//        qq.addQuiz_question(1, 4);
//        qq.addQuiz_question(1, 5);
//        qq.addQuiz_question(1, 6);
//        qq.addQuiz_question(1, 7);
//        qq.addQuiz_question(1, 8);
//        qq.addQuiz_question(1, 9);
//        qq.addQuiz_question(1, 10);
//        qa.addQuizAssignment(1, "student", 3);
//
//        question.addQuestion(1, "selection", "It is considered illegal to use the Internet for private use while at work.");
//        question.addQuestion(1, "selection", "All ethics principles that are universal, i.e. they are the same in every part of the world.");
//        question.addQuestion(1, "selection", "Most ITPs would agree that the application of ethics in their field is more difficult than in other disciplines.");
//        question.addQuestion(1, "selection", "Moral relativism is ethical principle focus on there is no absolute reference.");
//        question.addQuestion(1, "selection", "Ethical standard is generally lower but boarder than legal standard.");
//        
//        question.addQuestion(1, "selection", "It is considered unethical to use the Internet for private use while at work.");
//        question.addQuestion(1, "selection", "Corporate policies are examples of informal guidelines for ITP to make ethical decision.");
//        question.addQuestion(1, "selection", "The two mandatory ethical guidelines for IT Professionals are sunshine test and reciprocal test.");
//        question.addQuestion(1, "selection", "Hacking is considered ethical unless non-repairable damage to hardware or files has occurred.");
//        question.addQuestion(1, "selection", "Moral relativism is ethical principle focus on there is no absolute reference.");
//
//        qs.addAnswer(11, "True;False;All of above;None of above", "False");
//        qs.addAnswer(12, "True;False;All of above;None of above", "False");
//        qs.addAnswer(13, "True;False;All of above;None of above", "True");
//        qs.addAnswer(14, "True;False;All of above;None of above", "True");
//        qs.addAnswer(15, "True;False;All of above;None of above", "False");
//        
//        qs.addAnswer(16, "True;False;All of above;None of above", "True");
//        qs.addAnswer(17, "True;False;All of above;None of above", "False");
//        qs.addAnswer(18, "True;False;All of above;None of above", "False");
//        qs.addAnswer(19, "True;False;All of above;None of above", "False");
//        qs.addAnswer(20, "True;False;All of above;None of above", "True");
//
//        qq.addQuiz_question(2, 11);
//        qq.addQuiz_question(2, 12);
//        qq.addQuiz_question(2, 13);
//        qq.addQuiz_question(2, 14);
//        qq.addQuiz_question(2, 15);
//        qq.addQuiz_question(2, 16);
//        qq.addQuiz_question(2, 17);
//        qq.addQuiz_question(2, 18);
//        qq.addQuiz_question(2, 19);
//        qq.addQuiz_question(2, 20);
//
//        qq.addQuiz_question(3, 1);
//        qq.addQuiz_question(3, 12);
//        qq.addQuiz_question(3, 3);
//        qq.addQuiz_question(3, 14);
//        qq.addQuiz_question(3, 5);
//        qq.addQuiz_question(3, 16);
//        qq.addQuiz_question(3, 7);
//        qq.addQuiz_question(3, 18);
//        qq.addQuiz_question(3, 9);
//        qq.addQuiz_question(3, 20);
    }

}
