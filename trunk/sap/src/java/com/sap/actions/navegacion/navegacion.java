/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions.navegacion;


import com.sap.actions.Action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.sql.Result;



public class navegacion implements Action {

    public String procesar(HttpServletRequest request)
            throws IOException, ServletException {

        HttpSession session = request.getSession();

        String path = request.getParameter("action");

        if (path.equals("indexCC")) {
            path = "comiteCentral/index";
        } 



        String url = "/WEB-INF/vista/" + path + ".jsp";



        return url;
    }
}
