/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author HaYYY
 */
public class Quiz implements Serializable {

    private int id, attempts, timeLimit, status;
    private String name, intro;
    private Timestamp timeOpen, timeClose, timeCreated;

    public Quiz() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAttempts() {
        return attempts;
    }

    public void setAttempts(int attempts) {
        this.attempts = attempts;
    }

    public int getTimeLimit() {
        return timeLimit;
    }

    public void setTimeLimit(int timeLimit) {
        this.timeLimit = timeLimit;
    }

    public Timestamp getTimeCreated() {
        return timeCreated;
    }

    public void setTimeCreated(Timestamp timeCreated) {
        this.timeCreated = timeCreated;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Timestamp getTimeOpen() {
        return timeOpen;
    }

    public void setTimeOpen(Timestamp timeOpen) {
        this.timeOpen = timeOpen;
    }

    public Timestamp getTimeClose() {
        return timeClose;
    }

    public void setTimeClose(Timestamp timeClose) {
        this.timeClose = timeClose;
    }

    public String toString() {
        return "Quiz id: " + getId()
                + "\nAttempts: " + getAttempts()
                + "\nTime Limit: " + getTimeLimit()
                + "\nTime Created: " + getTimeCreated()
                + "\nStatus: " + getStatus()
                + "\nName: " + getName()
                + "\nIntro: " + getIntro()
                + "\nTime Open: " + getTimeOpen()
                + "\nTime Close: " + getTimeClose();
    }
}
