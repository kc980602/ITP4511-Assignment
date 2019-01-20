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
public class Question_selection implements Serializable {

    private int id, question, status;
    private String offeredAnswer, correctAnswer;

    public Question_selection() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuestion() {
        return question;
    }

    public void setQuestion(int question) {
        this.question = question;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getOfferedAnswer() {
        return offeredAnswer;
    }

    public void setOfferedAnswer(String offeredAnswer) {
        this.offeredAnswer = offeredAnswer;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    @Override
    public String toString() {
        return "Question_multichoice{" + "id=" + id + ", question=" + question + ", status=" + status + ", offeredAnswer=" + offeredAnswer + ", correctAnswer=" + correctAnswer + '}';
    }
}
