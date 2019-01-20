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
import java.util.Stack;
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
@WebServlet(name = "StudentController", urlPatterns = {"/studentQuiz"})
public class StudentController extends HttpServlet {

    private QuestionDB questionDB;
    private Question_multichoiceDB question_multichoiceDB;
    private Question_selectionDB question_selectionDB;
    private QuizDB quizDB;
    private Quiz_questionDB quiz_questionDB;
    private QuizAssignmentDB quiz_assignmentDB;
    private UserDB userDb;
    private Student_quizDB student_quizDb;
    public User user;

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");

        userDb = new UserDB(dbUrl, dbUser, dbPassword);
        questionDB = new QuestionDB(dbUrl, dbUser, dbPassword);
        question_multichoiceDB = new Question_multichoiceDB(dbUrl, dbUser, dbPassword);
        question_selectionDB = new Question_selectionDB(dbUrl, dbUser, dbPassword);
        quizDB = new QuizDB(dbUrl, dbUser, dbPassword);
        quiz_assignmentDB = new QuizAssignmentDB(dbUrl, dbUser, dbPassword);
        quiz_questionDB = new Quiz_questionDB(dbUrl, dbUser, dbPassword);
        student_quizDb = new Student_quizDB(dbUrl, dbUser, dbPassword);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            HttpSession session = request.getSession();
            user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            String action;
            if ((action = request.getParameter("action")) != null) {
                switch (action) {
                    case "quiz":
                        doQuiz(request, response);
                        break;
                    case "finish":
                        finishQuiz(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
                }
            } else {
                listQuiz(request, response);
            }
        } else {
            response.sendRedirect("login");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private boolean isAuthenticated(HttpServletRequest request) {
        boolean result = false;
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            result = true;
        }
        return result;
    }

    public void listQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Quiz> quizzes = null;
        int number = 0;
        ArrayList numberOfAttempt = new ArrayList();
        if (user.getRoles() == 1) {
            quizzes = quiz_assignmentDB.getAssignedQuiz(user.getId());
            for (int i = 0; i < quizzes.size(); i++) {
                Quiz q = quizzes.get(i);
                number = student_quizDb.getNumberAttempt(user.getId(), q.getId());
                numberOfAttempt.add(number);
            }

            request.setAttribute("quizzes", quizzes);
            request.setAttribute("numberOfAttempt", numberOfAttempt);

            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher("/portal/studentQuizList.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("main");
        }
    }

    public void doQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 1) {
            ArrayList answers = new ArrayList();
            String action = request.getParameter("action");
            int quizId = Integer.parseInt(request.getParameter("quizId"));
            if ("quiz".equalsIgnoreCase(action)) {
                Quiz quiz = quizDB.getQuiz(quizId);
                int numberOfAttempt = student_quizDb.getNumberAttempt(user.getId(), quizId);
                if (numberOfAttempt <= quiz.getAttempts()) {
                    ArrayList<Question> questions = quiz_questionDB.queryQuiz_questionByQuizId(quizId);
                    for (int i = 0; i < questions.size(); i++) {
                        Question q = questions.get(i);
                        int id = q.getId();
                        if (q.getQuestionType().equalsIgnoreCase("multichoice")) {
                            Question_multichoice qm = question_multichoiceDB.queryAnswerByQuestionId(id);
                            answers.add(qm);
                        } else if (q.getQuestionType().equalsIgnoreCase("selection")) {
                            Question_selection qs = question_selectionDB.queryAnswerByQuestionId(id);
                            answers.add(qs);
                        }
                    }
                    request.setAttribute("user", user);
                    request.setAttribute("quiz", quiz);
                    request.setAttribute("questions", questions);
                    request.setAttribute("answers", answers);
                    RequestDispatcher rd;
                    rd = getServletContext().getRequestDispatcher("/portal/attemptQuiz.jsp");
                    rd.forward(request, response);
                } else {
                    response.sendRedirect("studentQuiz?failed=true&message=No more attempts are allowed");
                }
            } else {
                response.sendRedirect("main");
            }
        } else {
            response.sendRedirect("main");
        }
    }

    public void finishQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (user.getRoles() == 1) {
            int marks = 0;
            ArrayList<Student_quiz> sqs;
            String[] answerSet;

            int quiz = Integer.parseInt(request.getParameter("quizId"));
            ArrayList<Question> questions = quiz_questionDB.queryQuiz_questionByQuizId(quiz);
            Quiz quizInfo = quizDB.getActiveQuiz(quiz);
            int numberOfAttempt = 0;
            numberOfAttempt = student_quizDb.getNumberAttempt(user.getId(), quiz) + 1;
            if (numberOfAttempt <= quizInfo.getAttempts()) {
                int count = 0;
                for (int i = 0; i < questions.size(); i++) {
                    count++;
                    Question q = questions.get(i);
                    answerSet = request.getParameterValues("Q" + (i + 1));
                    String fullAnswer = "";
                    if (answerSet != null) {
                        for (int j = 0; j < answerSet.length; j++) {
                            if (j + 1 == answerSet.length) {
                                fullAnswer += answerSet[j];
                            } else {
                                fullAnswer += answerSet[j] + ";";
                            }
                        }
                    }
                    if (q.getQuestionType().equalsIgnoreCase("multichoice")) {
                        marks += question_multichoiceDB.checkAnswer(q.getId(), fullAnswer);
                    } else if (q.getQuestionType().equalsIgnoreCase("selection")) {
                        marks += question_selectionDB.checkAnswer(q.getId(), fullAnswer);
                    }
                }

                student_quizDb.addStudent_Quiz(quiz, user.getId(), marks, numberOfAttempt);
                sqs = student_quizDb.studentAttemptDetails(user.getId(), quiz);

                request.setAttribute("quiz", quiz);
                request.setAttribute("marks", marks);
                request.setAttribute("attemptDetail", sqs);
                request.setAttribute("totalMarks", count);

                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/portal/studentResult.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("studentQuiz?failed=true&message=No more attempts are allowed");
            }
        } else {
            response.sendRedirect("main");
        }
    }
}
