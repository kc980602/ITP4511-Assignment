/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.tag;

import java.io.IOException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author Kevin
 */
public class Message extends SimpleTagSupport {

    private String message, type;

    @Override
    public void doTag() {
        String print = "";
        try {
            PageContext pageContext = (PageContext) getJspContext();
            JspWriter out = pageContext.getOut();
            if (message != null && type != null) {
                if (type.equals("success")) {
                    print = "<div class=\"alert alert-success\"><a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>" + message + "</div>";
                }
                if (type.equals("danager")) {
                    print = "<div class=\"alert alert-danger\"><a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>" + message + "</div>";
                }
                if (type.equals("info")) {
                    print = "<div class=\"alert alert-info\"><a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>" + message + "</div>";
                }
            }
            out.print(print);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setType(String type) {
        this.type = type;
    }

}
