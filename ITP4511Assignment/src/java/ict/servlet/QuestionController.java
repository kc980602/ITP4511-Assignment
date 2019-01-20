/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.*;
import ict.db.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HaYYY
 */
@WebServlet(name = "QuestionController", urlPatterns = {"/question"})
public class QuestionController extends HttpServlet {

    private QuizDB quizDb;
    private GroupDB groupDb;
    private UserDB userDb;
    private QuizAssignmentDB qaDb;
    private Quiz_questionDB quizQuestionDb;
    private QuestionDB questionDb;
    private Question_multichoiceDB questionMultichoiceDb;
    private Question_selectionDB questionSelectionDB;
    private ModuleDB moduleDB;
    public User user;

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        quizDb = new QuizDB(dbUrl, dbUser, dbPassword);
        groupDb = new GroupDB(dbUrl, dbUser, dbPassword);
        userDb = new UserDB(dbUrl, dbUser, dbPassword);
        qaDb = new QuizAssignmentDB(dbUrl, dbUser, dbPassword);
        quizQuestionDb = new Quiz_questionDB(dbUrl, dbUser, dbPassword);
        questionDb = new QuestionDB(dbUrl, dbUser, dbPassword);
        questionMultichoiceDb = new Question_multichoiceDB(dbUrl, dbUser, dbPassword);
        questionSelectionDB = new Question_selectionDB(dbUrl, dbUser, dbPassword);
        moduleDB = new ModuleDB(dbUrl, dbUser, dbPassword);

        questionDb.createQuestionTable();
        questionMultichoiceDb.createQuestion_multichoiceTable();
        questionSelectionDB.createQuestion_selectionTable();
    }

    private boolean isAuthenticated(HttpServletRequest request) {
        boolean result = false;
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            result = true;
        }
        return result;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            HttpSession session = request.getSession();
            user = (User) session.getAttribute("user");
            request.setAttribute("modulelist", moduleDB.queryModuleInHashMap());
            request.setAttribute("user", user);
            String action;
            if ((action = request.getParameter("action")) != null) {
                switch (action) {
                    case "edit":
                        editQuestion(request, response);
                        break;
                    case "delete":
                        deleteQuestion(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
                }
            } else {
                showList(request, response);
            }
        } else {
            response.sendRedirect("login");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            HttpSession session = request.getSession();
            user = (User) session.getAttribute("user");
            request.setAttribute("modulelist", moduleDB.queryModuleInHashMap());
            request.setAttribute("user", user);
            String action;
            if ((action = request.getParameter("action")) != null) {
                switch (action) {
                    case "add":
                        addQuestion(request, response);
                        break;
                    case "update":
                        updateQuestion(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
                }
            }
        } else {
            response.sendRedirect("login");
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.removeAttribute("action");
        if (user.getRoles() == 0) {
            ArrayList<Question> questions = questionDb.getAllQuestion();
            request.setAttribute("questions", questions);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/question.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("main");
        }
    }

    private void editQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            ArrayList<Question> question = questionDb.queryQuestionById(Integer.parseInt(request.getParameter("questionId")));
            Question_multichoice qm = questionMultichoiceDb.queryAnswerByQuestionId(Integer.parseInt(request.getParameter("questionId")));

            request.setAttribute("question", question);
            request.setAttribute("answer", qm);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/editQuestion.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("main");
        }
    }

    private void updateQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            int qid = Integer.parseInt(request.getParameter("qid"));
            int aid = Integer.parseInt(request.getParameter("aid"));
            int moduleid = Integer.parseInt(request.getParameter("module"));
            String type = request.getParameter("type");
            String question = request.getParameter("question");
            String offeranswer = request.getParameter("offeranswer");
            String correctanswer = request.getParameter("correctanswer");
            Boolean isSuccess = false;
            isSuccess = questionDb.updateQuestion(qid, moduleid, type, question);
            if (type.equals("selection")) {
                isSuccess = questionSelectionDB.updateAnswer(aid, offeranswer, correctanswer);
            } else {
                isSuccess = questionMultichoiceDb.updateAnswer(aid, offeranswer, correctanswer);
            }
            ArrayList<Question> questions = questionDb.getAllQuestion();
            request.setAttribute("questions", questions);
            request.setAttribute("updatefailed", !isSuccess);
            request.removeAttribute("action");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/question.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("main");
        }
    }

    private void addQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            int moduleid = Integer.parseInt(request.getParameter("module"));
            String type = request.getParameter("type");
            String question = request.getParameter("question");
            String offeranswer = request.getParameter("offeranswer");
            String correctanswer = request.getParameter("correctanswer");
            Boolean isSuccess = false;

            int generatedKey = questionDb.addQuestion(moduleid, type, question);
            if (type.equals("selection")) {
                isSuccess = questionSelectionDB.addAnswer(generatedKey, offeranswer, correctanswer);
            } else {
                isSuccess = questionMultichoiceDb.addAnswer(generatedKey, offeranswer, correctanswer);
            }
            request.setAttribute("addfailed", !isSuccess);
            request.setAttribute("questions", questionDb.getAllQuestion());
            request.removeAttribute("action");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/question.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("main");
        }
    }

    private void deleteQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 0) {
            int qid = Integer.parseInt(request.getParameter("questionId"));
            String type = request.getParameter("type");
            Boolean isSuccess = questionDb.deleteQuestion(qid);
            if (type.equals("selection")) {
                isSuccess = questionSelectionDB.deleteQuestion(qid);
            } else {
                isSuccess = questionMultichoiceDb.deleteQuestion(qid);
            }
            request.setAttribute("addfailed", !isSuccess);
            request.setAttribute("questions", questionDb.getAllQuestion());
            request.removeAttribute("action");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/portal/question.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("main");
        }
    }

}
