/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.controller;

import com.sap.ejb.FactorFacade;
import com.sap.ejb.ModeloFacade;
import com.sap.entity.Factor;
import com.sap.entity.Modelo;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ususario
 */
public class formController2 extends HttpServlet {

    @EJB
    private FactorFacade factorFacade;
    @EJB
    private ModeloFacade modeloFacade;

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
        HttpSession sesion = request.getSession();
        String action = (String) request.getParameter("action");
        System.out.println("ACTION" + action);
        try {
            if (action.equals("indexCC")) {
                String url = "/WEB-INF/vista/comiteCentral/index.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else {
                System.out.println("ACTION" + action);
                if (action.toLowerCase().contains("modelo")) {
                    if (action.equals("crearModelo")) {
                        String nombre = (String) request.getParameter("nombre");
                        String descripcion = (String) request.getParameter("descripcion");
                        java.util.Date date = new java.util.Date();
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
                        String fecha = sdf.format(date);
                        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
                        Date fecha2 = null;
                        try {

                            fecha2 = formatoDelTexto.parse(fecha);

                        } catch (ParseException ex) {

                            ex.printStackTrace();

                        }
                        Modelo m = new Modelo();
                        m.setFechacreacion(fecha2);
                        m.setDescripcion(descripcion);
                        m.setNombre(nombre);
                        modeloFacade.create(m);
                    } else {
                        if (action.equals("crearModeloCC")) {
                            String url = "/WEB-INF/vista/comiteCentral/modelo/crear.jsp";
                            RequestDispatcher rd = request.getRequestDispatcher(url);
                            rd.forward(request, response);
                        } else {
                            if (action.equals("listarModeloCC")) {
                                String url = "/WEB-INF/vista/comiteCentral/modelo/listar.jsp";
                                RequestDispatcher rd = request.getRequestDispatcher(url);
                                sesion.setAttribute("listaM", modeloFacade.findAll());
                                rd.forward(request, response);

                            }
                        }
                    }
                } else {
                    if (action.toLowerCase().contains("factor")) {
                        if (action.equals("crearFactor")) {
                            String codigo = (String) request.getParameter("codigo");
                            String nombre = (String) request.getParameter("nombre");
                            Factor f = new Factor();
                            f.setCodigo(codigo);
                            f.setNombre(nombre);
                            factorFacade.create(f);
                        } else {
                            if (action.equals("listarFactoresCC")) {
                                String url = "/WEB-INF/vista/comiteCentral/factor/listar.jsp";
                                RequestDispatcher rd = request.getRequestDispatcher(url);
                                sesion.setAttribute("listaF", factorFacade.findAll());
                                rd.forward(request, response);
                            }

                        }
                    }
                }
            }
        } catch (Exception e) {
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
        processRequest(request, response);
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
