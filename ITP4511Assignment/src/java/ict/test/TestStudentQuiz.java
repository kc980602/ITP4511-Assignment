/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.test;

import ict.bean.Question;
import ict.bean.Student_quiz;
import ict.bean.User;
import ict.db.QuestionDB;
import ict.db.Student_quizDB;
import java.util.ArrayList;

/**
 *
 * @author HaYYY
 */
public class TestStudentQuiz {

    public static void main(String[] arg) {
        String url = "jdbc:mysql://localhost:3306/happy_elearning";
        String username = "root";
        String password = "";
        Student_quizDB sqDB = new Student_quizDB(url, username, password);
        //sqDB.createStudent_QuizTable();
        //sqDB.addStudent_Quiz(29, 6, 80, 1);
        ArrayList<User> user = sqDB.getMinByQuiz(29);
        //System.out.println(user.get(0).getFirstname() + user.get(0).getLastname());
        ArrayList<Integer> sq = sqDB.getQuizListByStudent(6);
        System.out.println(sq.get(0));
        ArrayList<Student_quiz> quizList = sqDB.getResultListByQuiz(6, 29);
        System.out.println(quizList.get(0));

    }

}
