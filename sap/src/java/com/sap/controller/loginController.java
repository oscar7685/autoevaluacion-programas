/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.controller;

import com.sap.ejb.EncuestaFacade;
import com.sap.ejb.ProcesoFacade;
import com.sap.ejb.RepresentanteFacade;
import com.sap.entity.Encuesta;
import com.sap.entity.Proceso;
import com.sap.entity.Representante;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ususario
 */
public class loginController extends HttpServlet {

    @EJB
    private RepresentanteFacade representanteFacade;
    @EJB
    private EncuestaFacade encuestaFacade;
    @EJB
    private ProcesoFacade procesoFacade;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (String) request.getParameter("action");
        if (action != null) {
            request.getSession().invalidate();
        } else {
            String un = (String) request.getParameter("un");
            String pw = (String) request.getParameter("pw");
            String tp = (String) request.getParameter("tp");
            HttpSession session = request.getSession();

            response.setContentType("text/plain");
            PrintWriter out = response.getWriter();

            if (tp != null && tp.equals("Estudiantes")) {
                session.setAttribute("tipoLogin", "Fuente");
                Encuesta e = encuestaFacade.find(1);
                session.setAttribute("encuesta", e);
                out.println(0);

            } else {
                if (tp != null && tp.equals("Comite central")) {

                    Representante r = representanteFacade.find(Integer.parseInt(un));
                    if (r != null && r.getPassword().equals(pw) && r.getRol().equals("Comite central")) {
                        session.setAttribute("tipoLogin", "Comite central");
                        session.setAttribute("nombre", "" + r.getNombre() + " " + r.getApellido());
                        out.println(0);
                    } else {
                        out.println(1);
                    }
                } else if (tp != null && tp.equals("Comite programa")) {

                    Representante r = representanteFacade.find(Integer.parseInt(un));
                    if (r != null && r.getPassword().equals(pw)) {
                        session.setAttribute("tipoLogin", "Comite programa");
                        session.setAttribute("nombre", "" + r.getNombre() + " " + r.getApellido());
                        session.setAttribute("Programa", r.getProgramaId());
                        List procesos = (List) procesoFacade.findByPrograma(r.getProgramaId());
                        if (procesos.size() != 0) {
                            Iterator iter = procesos.iterator();
                            while (iter.hasNext()) {
                                Proceso p = (Proceso) iter.next();
                                if (p.getFechacierre().equals("En Configuración")) {
                                    session.setAttribute("EstadoProceso", 1);
                                    session.setAttribute("Proceso", p);
                                    session.setAttribute("Modelo", p.getModeloId());
                                } else if (p.getFechacierre().equals("En Ejecución")) {
                                    session.setAttribute("EstadoProceso", 2);
                                    session.setAttribute("Proceso", p);
                                    session.setAttribute("Modelo", p.getModeloId());
                                } else {
                                    session.setAttribute("EstadoProceso", 3);
                                }
                            }
                        } else {
                            session.setAttribute("EstadoProceso", 0);
                        }
                    }
                    System.out.println("Estado del Proceso: " + session.getAttribute("EstadoProceso"));
                    out.println(0);
                } else {
                    out.println(1);
                }
            }

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
