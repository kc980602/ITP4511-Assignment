/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.test;

import ict.bean.Groups;
import ict.bean.Question;
import ict.bean.User;
import ict.db.QuizDB;
import ict.db.GroupDB;
import ict.db.QuizAssignmentDB;
import ict.db.Student_quizDB;
import ict.db.UserDB;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author HaYYY
 */
public class TestQuiz {

    public static void main(String[] arg) {
        String url = "jdbc:mysql://localhost:3306/happy_elearning";
        String username = "root";
        String password = "";
        QuizDB quiz = new QuizDB(url, username, password);
        QuizAssignmentDB qa = new QuizAssignmentDB(url, username, password);
        GroupDB group = new GroupDB(url, username, password);
        UserDB user = new UserDB(url, username, password);
        Student_quizDB sq= new Student_quizDB(url, username, password);

        quiz.createQuizTable();
        qa.createQuizAssignmentTable();
        Timestamp open = Timestamp.valueOf("2007-09-23 10:10:0.0");
        Timestamp close = Timestamp.valueOf("2007-09-23 10:10:0.0");
        Timestamp now = new Timestamp(System.currentTimeMillis());
        qa.updateQuizAssignment(1, "student", 6);
        System.out.println(sq.getAverageByQuiz(29));
        System.out.println(sq.getAverageByGroup(1));
        //quiz.addQuiz("Quiz 1", "", open, close, 3, 120, now);
        //quiz.addQuiz("Quiz 2", "", open, close, 2, 1200, now);
        //quiz.editQuiz(1, "Quiz Test", "", open, close, 5, 1000);
//        ArrayList<Groups> groups = group.getAllGroups();
//                ArrayList<User> s = user.getAllStudent();
//
//        for(int i = 0; i < s.size(); i++){
//            System.out.println(s.get(i).getFirstname());
//        }
        //System.out.println(quiz.getLatestID());
    }

}
