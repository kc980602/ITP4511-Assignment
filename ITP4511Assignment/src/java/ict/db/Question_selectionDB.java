/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.Question_selection;
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
public class Question_selectionDB {

    private String dburl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public Question_selectionDB(String dburl, String dbUser, String dbPassword) {
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

    public void createQuestion_selectionTable() {
        Connection cnnct;
        Statement stmnt = null;

        try {
            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS question_selection ("
                    + "id               int(11)         NOT NULL AUTO_INCREMENT,"
                    + "question         int(11)         NOT NULL,"
                    + "offeredAnswer    varchar(500)    NOT NULL,"
                    + "correctAnswer    varchar(500)    NOT NULL,"
                    + "status           int(11)         DEFAULT 0 NOT NULL,"
                    + "PRIMARY KEY (id),"
                    + "FOREIGN KEY (question) REFERENCES question(id)"
                    + ")";
            stmnt.execute(sql);
            System.out.println("Q.Selection table created");
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

    public boolean addAnswer(int question, String offeredAnswer, String correctAnswer) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO question_selection (question, offeredAnswer, correctAnswer)" + " VALUES (?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, question);
            pStmnt.setString(2, offeredAnswer);
            pStmnt.setString(3, correctAnswer);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
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

    public Question_selection queryAnswerByQuestionId(int id) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Question_selection answer = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM question_selection WHERE question=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, id);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                answer = new Question_selection();
                answer.setId(rs.getInt(1));
                answer.setQuestion(rs.getInt(2));
                answer.setOfferedAnswer(rs.getString(3));
                answer.setCorrectAnswer(rs.getString(4));
                answer.setStatus(rs.getInt(5));
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
        return answer;
    }

    public boolean updateAnswer(int aid, String offeredAnswer, String correctAnswer) {
        Connection cnnct;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;

        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE question_selection SET offeredAnswer=?, correctAnswer=? WHERE id=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, offeredAnswer);
            pStmnt.setString(2, correctAnswer);
            pStmnt.setInt(3, aid);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
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

    public boolean deleteQuestion(int qid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE question_selection SET status=1 WHERE question=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, qid);
            pStmnt.executeUpdate();
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
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

    public int checkAnswer(int questionNo, String answer) {
        int marks = 0;
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM question_selection WHERE question=? AND correctAnswer=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, questionNo);
            pStmnt.setString(2, answer);
            ResultSet rs = null;
            pStmnt.execute();
            rs = pStmnt.getResultSet();
            while (rs.next()) {
                marks = 1;
                System.out.println("Correct!");
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
        return marks;
    }
}
