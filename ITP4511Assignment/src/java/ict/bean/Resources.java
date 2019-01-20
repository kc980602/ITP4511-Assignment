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
 * @author PokeGuys
 */
public class Resources implements Serializable {
    private Module module;
    private int id, category, section, status;
    private String name, fileName;
    private Timestamp timeopen, timeclose;

    public Resources() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategory() {
        return category ;
    }

    public void setCategory (int category ) {
        this.category  = category ;
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

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Timestamp getTimeopen() {
        return timeopen;
    }

    public void setTimeopen(Timestamp timeopen) {
        this.timeopen = timeopen;
    }

    public Timestamp getTimeclose() {
        return timeclose;
    }

    public void setTimeclose(Timestamp timeclose) {
        this.timeclose = timeclose;
    }
    
    public Module getModule() {
        return module;
    }
    
    public void setModule(Module module) {
        this.module = module;
    }
}
