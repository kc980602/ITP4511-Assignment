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
public class QuestionDB {

    private String dburl = "";
    private String dbUser = "";
    private String dbPassword = "";

    public QuestionDB(String dburl, String dbUser, String dbPassword) {
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

    public void createQuestionTable() {
        Connection cnnct;
        Statement stmnt = null;

        try {
            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS question ("
                    + "id           int(11)         NOT NULL AUTO_INCREMENT,"
                    + "module     int(11)         NOT NULL,"
                    + "questionType varchar(100)    NOT NULL,"
                    + "question         varchar(255)    NOT NULL,"
                    + "status       int(11)         DEFAULT 0 NOT NULL,"
                    + "PRIMARY KEY (id),"
                    + "FOREIGN KEY (module) REFERENCES module(id)"
                    + ")";
            stmnt.execute(sql);
            System.out.println("question table created");
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

    public int addQuestion(int module, String questionType, String question) {
        int generatedKey = 0;
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO question (module, questionType, question)" + " VALUES (?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement, Statement.RETURN_GENERATED_KEYS);
            pStmnt.setInt(1, module);
            pStmnt.setString(2, questionType);
            pStmnt.setString(3, question);
            pStmnt.executeUpdate();
            ResultSet rs = pStmnt.getGeneratedKeys();
            if (rs.next()) {
                generatedKey = rs.getInt(1);
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
        return generatedKey;
    }

    public boolean updateQuestion(int qid, int module, String questionType, String question) {
        int generatedKey = 0;
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE question SET module=?,questionType=?,question=? WHERE id=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, module);
            pStmnt.setString(2, questionType);
            pStmnt.setString(3, question);
            pStmnt.setInt(4, qid);
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

    public boolean deleteQuestion(int qid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE question SET status=1 WHERE id=?";
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

    public ArrayList<Question> queryQuestionById(int id) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Question question = null;
        ArrayList<Question> questions = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM question WHERE id=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, id);
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

    public ArrayList<Question> getAllQuestion() {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Question question = null;
        ArrayList<Question> questions = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM question";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
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

    public ArrayList<Question> queryQuestionByCategory(int category) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Question question = null;
        ArrayList<Question> questions = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM question WHERE category=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, category);
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

    public ArrayList<Question> queryQuestionByQuestionType(String questionType) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        Question question = null;
        ArrayList<Question> questions = new ArrayList();
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM question WHERE questionType=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, questionType);
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
}
