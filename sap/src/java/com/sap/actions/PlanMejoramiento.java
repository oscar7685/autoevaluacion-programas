/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.CaracteristicaFacade;
import com.sap.ejb.HallazgoFacade;
import com.sap.entity.Hallazgo;
import com.sap.entity.Modelo;
import com.sap.entity.Proceso;
import com.sap.interfaz.Action;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acreditacion
 */
public class PlanMejoramiento implements Action {
    CaracteristicaFacade caracteristicaFacade = lookupCaracteristicaFacadeBean();
    HallazgoFacade hallazgoFacade = lookupHallazgoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        Modelo modelo = (Modelo) sesion.getAttribute("Modelo");
        List<Hallazgo> ha = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "hallazgo");
        List<Hallazgo> forta = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "fortaleza");
        sesion.setAttribute("listaC", caracteristicaFacade.findByModelo(modelo));
        sesion.setAttribute("listHallazgos", ha);
        sesion.setAttribute("listFortalezas", forta);
        return  "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/hallazgos/listar.jsp";
    }

    private HallazgoFacade lookupHallazgoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (HallazgoFacade) c.lookup("java:global/sap/HallazgoFacade!com.sap.ejb.HallazgoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private CaracteristicaFacade lookupCaracteristicaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (CaracteristicaFacade) c.lookup("java:global/sap/CaracteristicaFacade!com.sap.ejb.CaracteristicaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
