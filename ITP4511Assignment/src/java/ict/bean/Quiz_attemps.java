/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.io.Serializable;

/**
 *
 * @author HaYYY
 */
public class Quiz_attemps implements Serializable {

    private int id, quiz, userId, attempt, timeModified, timeStart, timeFinish;

    public Quiz_attemps() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuiz() {
        return quiz;
    }

    public void setQuiz(int quiz) {
        this.quiz = quiz;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAttempt() {
        return attempt;
    }

    public void setAttempt(int attempt) {
        this.attempt = attempt;
    }

    public int getTimeModified() {
        return timeModified;
    }

    public void setTimeModified(int timeModified) {
        this.timeModified = timeModified;
    }

    public int getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(int timeStart) {
        this.timeStart = timeStart;
    }

    public int getTimeFinish() {
        return timeFinish;
    }

    public void setTimeFinish(int timeFinish) {
        this.timeFinish = timeFinish;
    }

}
