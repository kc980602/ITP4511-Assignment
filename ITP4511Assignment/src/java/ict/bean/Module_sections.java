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
public class Module_sections implements Serializable {
    private ArrayList<Resources> resources;
    private int id, module, section, status;
    private String name;

    public Module_sections() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getModule() {
        return module;
    }

    public void setModule(int module) {
        this.module = module;
    }

    public int getSection() {
        return section;
    }

    public void setSection(int section) {
        this.section = section;
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
    
    public ArrayList<Resources> getResources() {
        return resources;
    }
    
    public void setResources(ArrayList<Resources> res) {
        resources = res;
    }

}
