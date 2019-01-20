/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.Question;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author HaYYY
 */
public class Quiz_questionDB {

    private String dburl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public Quiz_questionDB(String dburl, String dbUser, String dbPassword) {
        this.dburl = dburl;
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
    }

    public Connection getConnection() throws SQLException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(dburl, dbUser, dbPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void createQuiz_questionTable() {
        Connection cnnct;
        Statement stmnt = null;

        try {
            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS quiz_question ("
                    + "id       int(11)     NOT NULL AUTO_INCREMENT,"
                    + "quiz     int(11)     NOT NULL,"
                    + "question int(11)     NOT NULL,"
                    + "PRIMARY KEY (id),"
                    + "FOREIGN KEY (quiz) REFERENCES quiz(id),"
                    + "FOREIGN KEY (question) REFERENCES question(id)"
                    + ")";
            stmnt.execute(sql);
            System.out.println("quiz_question table created");
            stmnt.close();
            cnnct.close();
        } catch (SQLException e) {
            while (e != null) {
                e.printStackTrace();
                e = e.getNextException();
            }
        } catch (IOException e) {
            while (e != null) {
                e.printStackTrace();
            }
        }
    }

    public boolean addQuiz_question(int quiz, int question) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO quiz_question (quiz, question)"
                    + " VALUES (?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, quiz);
            pStmnt.setInt(2, question);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
                System.out.println("quiz_question is added.");
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }
    
    public ArrayList<Question> queryQuiz_questionByQuizId(int quizId) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Question question = null;
        ArrayList<Question> questions = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatement = 
                    "SELECT * FROM question, quiz_question"
                    + " WHERE question.id = quiz_question.question"
                    + " AND quiz_question.quiz = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, quizId);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                question = new Question();
                question.setId(rs.getInt(1));
                question.setModule(rs.getInt(2));
                question.setQuestionType(rs.getString(3));
                question.setQuestion(rs.getString(4));
                question.setStatus(rs.getInt(5));
                questions.add(question);
                System.out.println("\n" + question);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return questions;
    }
    
    public boolean deleteQuestion(int quiz_id, int question_id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "DELETE FROM Quiz_question WHERE quiz=? AND question=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, quiz_id);
            pStmnt.setInt(2, question_id);            
            int rowCount = pStmnt.executeUpdate();
            isSuccess = rowCount >= 1;
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }
}
