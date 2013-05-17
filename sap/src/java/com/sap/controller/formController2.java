/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.controller;

import com.sap.ejb.CaracteristicaFacade;
import com.sap.ejb.EncuestaFacade;
import com.sap.ejb.FactorFacade;
import com.sap.ejb.IndicadorFacade;
import com.sap.ejb.ModeloFacade;
import com.sap.ejb.PreguntaFacade;
import com.sap.entity.Encuesta;
import com.sap.entity.Factor;
import com.sap.entity.Modelo;
import com.sap.entity.Pregunta;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
    private EncuestaFacade encuestaFacade;
    @EJB
    private PreguntaFacade preguntaFacade;
    @EJB
    private IndicadorFacade indicadorFacade;
    @EJB
    private CaracteristicaFacade caracteristicaFacade;
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

        try {
            if (action.equals("indexCC")) {
                String url = "/WEB-INF/vista/comiteCentral/index.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else {
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

                            } else {
                                if (action.equals("entrarModeloCC")) {
                                    String idM = request.getParameter("id");
                                    Modelo m = modeloFacade.find(Integer.parseInt(idM));
                                    sesion.setAttribute("modelo", m);
                                    sesion.setAttribute("listaF", factorFacade.findByModelo(m));
                                    sesion.setAttribute("listaC", caracteristicaFacade.findByModelo(m));
                                    sesion.setAttribute("listaI", indicadorFacade.findByModelo(m));
                                    sesion.setAttribute("listaP", preguntaFacade.findByModelo(m));
                                    sesion.setAttribute("listaE", encuestaFacade.findByModelo(m));
                                    String url = "/WEB-INF/vista/comiteCentral/inicio.jsp";
                                    RequestDispatcher rd = request.getRequestDispatcher(url);
                                    rd.forward(request, response);

                                }
                            }
                        }
                    }
                } else {
                    if (action.toLowerCase().contains("factor")) {
                        if (action.equals("crearFactor")) {
                            String codigo = (String) request.getParameter("codigo");
                            String nombre = (String) request.getParameter("nombre");
                            Modelo m2 = (Modelo) sesion.getAttribute("modelo");
                            Factor f = new Factor();
                            f.setCodigo(codigo);
                            f.setNombre(nombre);
                            f.setModeloId(m2);
                            factorFacade.create(f);
                        } else {
                            if (action.equals("listarFactoresCC")) {
                                String url = "/WEB-INF/vista/comiteCentral/factor/listar.jsp";
                                RequestDispatcher rd = request.getRequestDispatcher(url);
                                rd.forward(request, response);
                            } else {
                                if (action.equals("crearFactorCC")) {
                                    String url = "/WEB-INF/vista/comiteCentral/factor/crear.jsp";
                                    RequestDispatcher rd = request.getRequestDispatcher(url);
                                    rd.forward(request, response);
                                }
                            }

                        }
                    } else {
                        if (action.toLowerCase().contains("caracteristica")) {
                            if (action.equals("crearCaracteristica")) {
                                String codigo = (String) request.getParameter("codigo");
                                String nombre = (String) request.getParameter("nombre");
                                Modelo m2 = (Modelo) sesion.getAttribute("modelo");
                                Factor f = new Factor();
                                f.setCodigo(codigo);
                                f.setNombre(nombre);
                                f.setModeloId(m2);
                                factorFacade.create(f);
                                sesion.setAttribute("listaF", factorFacade.findByModelo(m2));
                            } else {
                                if (action.equals("crearCaracteristicaCC")) {
                                    String url = "/WEB-INF/vista/comiteCentral/caracteristica/crear.jsp";
                                    Modelo m = (Modelo) sesion.getAttribute("modelo");
                                    sesion.setAttribute("listaF", factorFacade.findByModelo(m));
                                    RequestDispatcher rd = request.getRequestDispatcher(url);
                                    rd.forward(request, response);
                                } else {
                                    if (action.equals("listarCaracteristicasCC")) {
                                        String url = "/WEB-INF/vista/comiteCentral/caracteristica/listar.jsp";
                                        RequestDispatcher rd = request.getRequestDispatcher(url);
                                        rd.forward(request, response);
                                    }
                                }
                            }
                        } else {
                            if (action.toLowerCase().contains("indicador")) {
                                if (action.equals("crearIndicador")) {
                                    String codigo = (String) request.getParameter("codigo");
                                    String nombre = (String) request.getParameter("nombre");

                                } else {
                                    if (action.equals("crearIndicadorCC")) {
                                        String url = "/WEB-INF/vista/comiteCentral/indicador/crear.jsp";

                                        RequestDispatcher rd = request.getRequestDispatcher(url);
                                        rd.forward(request, response);
                                    } else {
                                        if (action.equals("listarIndicadoresCC")) {
                                            String url = "/WEB-INF/vista/comiteCentral/indicador/listar.jsp";
                                            RequestDispatcher rd = request.getRequestDispatcher(url);
                                            rd.forward(request, response);
                                        }
                                    }
                                }
                            } else {
                                if (action.toLowerCase().contains("pregunta")) {
                                    if (action.equals("crearPregunta")) {
                                        String codigo = (String) request.getParameter("codigo");
                                        String nombre = (String) request.getParameter("nombre");

                                    } else {
                                        if (action.equals("crearPreguntaCC")) {
                                            String url = "/WEB-INF/vista/comiteCentral/pregunta/crear.jsp";

                                            RequestDispatcher rd = request.getRequestDispatcher(url);
                                            rd.forward(request, response);
                                        } else {
                                            if (action.equals("listarPreguntasCC")) {
                                                String url = "/WEB-INF/vista/comiteCentral/pregunta/listar.jsp";
                                                RequestDispatcher rd = request.getRequestDispatcher(url);
                                                rd.forward(request, response);
                                            }
                                        }
                                    }
                                } else {
                                    if (action.toLowerCase().contains("encuesta")) {
                                        if (action.equals("crearEncuesta")) {
                                            String nombre = (String) request.getParameter("nombre");
                                            String objetivo = (String) request.getParameter("objetivo");
                                            String instrucciones = (String) request.getParameter("instrucciones");
                                            String codigo = (String) request.getParameter("codigo");
                                            String version = (String) request.getParameter("version");
                                            String fecha = (String) request.getParameter("fecha");
                                            Modelo m = (Modelo) sesion.getAttribute("modelo");
                                            Encuesta e = new Encuesta();
                                            e.setCodigo(codigo);
                                            e.setNombre(nombre);
                                            e.setObjetivo(objetivo);
                                            e.setInstrucciones(instrucciones);
                                            e.setVersion(version);
                                            e.setFecha(fecha);
                                            e.setModeloId(m);
                                            encuestaFacade.create(e);
                                            sesion.setAttribute("listaE", encuestaFacade.findByModelo(m));

                                        } else {
                                            if (action.equals("crearEncuestaCC")) {
                                                String url = "/WEB-INF/vista/comiteCentral/encuesta/crear.jsp";

                                                RequestDispatcher rd = request.getRequestDispatcher(url);
                                                rd.forward(request, response);
                                            } else {
                                                if (action.equals("listarEncuestasCC")) {
                                                    String url = "/WEB-INF/vista/comiteCentral/encuesta/listar.jsp";
                                                    RequestDispatcher rd = request.getRequestDispatcher(url);
                                                    rd.forward(request, response);
                                                } else {
                                                    if (action.equals("editarEncuestaCC")) {
                                                        String idE = request.getParameter("id");
                                                        Encuesta e = encuestaFacade.find(Integer.parseInt(idE));
                                                        sesion.setAttribute("encuesta", e);
                                                        String url = "/WEB-INF/vista/comiteCentral/encuesta/editar.jsp";
                                                        RequestDispatcher rd = request.getRequestDispatcher(url);
                                                        rd.forward(request, response);

                                                    } else {
                                                        if (action.equals("editarEncuesta")) {
                                                            Encuesta e = (Encuesta) sesion.getAttribute("encuesta");
                                                            String nombre = (String) request.getParameter("nombre");
                                                            String objetivo = (String) request.getParameter("objetivo");
                                                            String instrucciones = (String) request.getParameter("instrucciones");
                                                            String codigo = (String) request.getParameter("codigo");
                                                            String version = (String) request.getParameter("version");
                                                            String fecha = (String) request.getParameter("fecha");
                                                            Modelo m = (Modelo) sesion.getAttribute("modelo");
                                                            e.setCodigo(codigo);
                                                            e.setNombre(nombre);
                                                            e.setObjetivo(objetivo);
                                                            e.setInstrucciones(instrucciones);
                                                            e.setVersion(version);
                                                            e.setFecha(fecha);
                                                            e.setModeloId(m);

                                                            List<Pregunta> listadePreguntas = (List<Pregunta>) sesion.getAttribute("listaP");
                                                            List<Pregunta> aux = new ArrayList<Pregunta>();
                                                            for (int i = 0; i < listadePreguntas.size(); i++) {
                                                                Pregunta pregunta = listadePreguntas.get(i);
                                                                if (request.getParameter("P" + listadePreguntas.get(i).getId()).equals("1")) {
                                                                    aux.add(pregunta);
                                                                }
                                                            }
                                                            e.setPreguntaList(aux);
                                                            encuestaFacade.edit(e);
                                                            sesion.setAttribute("listaE", encuestaFacade.findByModelo(m));
                                                            sesion.setAttribute("listaP", preguntaFacade.findByModelo(m));


                                                        } else {
                                                            if (action.equals("vistaPreviaEncuestaCC")) {
                                                                String idE = request.getParameter("id");
                                                                Encuesta e = encuestaFacade.find(Integer.parseInt(idE));
                                                                sesion.setAttribute("encuesta", e);
                                                                String url = "/WEB-INF/vista/comiteCentral/encuesta/vistaPrevia.jsp";
                                                                RequestDispatcher rd = request.getRequestDispatcher(url);
                                                                rd.forward(request, response);
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        if (action.equals("inicioCC")) {
                                            String url = "/WEB-INF/vista/comiteCentral/inicio.jsp";
                                            RequestDispatcher rd = request.getRequestDispatcher(url);
                                            rd.forward(request, response);
                                        }
                                    }

                                }
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
