/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions.comitecentral;

import com.sap.actions.Action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class ListarModelo implements Action{
   

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
          HttpSession session = request.getSession();
          ///falta XXXXXXXXX
          return "/WEB-INF/vista/comiteCentral/modelo/listar.jsp";
    }
        
}
