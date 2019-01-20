/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author HaYYY
 */
public class Module implements Serializable {
    private ArrayList<Module_sections> section;
    private ArrayList<Module_selection> assigned;
    private int id, status;
    private String name, code;

    public Module() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    
    public ArrayList<Module_sections> getSection() {
        return section;
    }
    
    public void setSection(ArrayList<Module_sections> section) {
        this.section = section;
    }

    public ArrayList<Module_selection> getAssigned() {
        return assigned;
    }

    public void setAssigned(ArrayList<Module_selection> assigned) {
        this.assigned = assigned;
    }
}
