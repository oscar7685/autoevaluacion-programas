/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.controller;

import com.sap.ejb.CaracteristicaFacade;
import com.sap.ejb.EncabezadoFacade;
import com.sap.ejb.EstudianteFacade;
import com.sap.ejb.FactorFacade;
import com.sap.ejb.FuenteFacade;
import com.sap.ejb.ModeloFacade;
import com.sap.ejb.MuestraFacade;
import com.sap.ejb.MuestraestudianteFacade;
import com.sap.ejb.MuestrapersonaFacade;
import com.sap.ejb.PonderacioncaracteristicaFacade;
import com.sap.ejb.PonderacionfactorFacade;
import com.sap.ejb.ProcesoFacade;
import com.sap.entity.Caracteristica;
import com.sap.entity.Estudiante;
import com.sap.entity.Factor;
import com.sap.entity.Modelo;
import com.sap.entity.Muestra;
import com.sap.entity.Muestraestudiante;
import com.sap.entity.Muestrapersona;
import com.sap.entity.Persona;
import com.sap.entity.Ponderacioncaracteristica;
import com.sap.entity.Ponderacionfactor;
import com.sap.entity.Proceso;
import com.sap.entity.Programa;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
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
 * @author 2013
 */
public class cpController extends HttpServlet {

    @EJB
    private ModeloFacade modeloFacade;
    @EJB
    private ProcesoFacade procesoFacade;
    @EJB
    private FactorFacade factorFacade;
    @EJB
    private PonderacionfactorFacade ponderacionfactorFacade;
    @EJB
    private CaracteristicaFacade caracteristicaFacade;
    @EJB
    private PonderacioncaracteristicaFacade PonderacioncaracteristicaFacade;
    @EJB
    private MuestraFacade muestraFacade;
    @EJB
    private MuestrapersonaFacade muestrapersonaFacade;
    @EJB
    private MuestraestudianteFacade muestraestudianteFacade;
    @EJB
    private EstudianteFacade estudianteFacade;
    @EJB
    private EncabezadoFacade encabezadoFacade;
    @EJB
    private FuenteFacade fuenteFacade;

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
        System.out.println("ACTION: " + action);
        Programa programa = (Programa) sesion.getAttribute("Programa");
        Modelo modelo = (Modelo) sesion.getAttribute("Modelo");
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");


        try {
            if (action.equals("indexCP")) {
                String url = "/WEB-INF/vista/comitePrograma/index.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("listarProceso")) {
                sesion.setAttribute("listProceso", procesoFacade.findAll());
                String url = "/WEB-INF/vista/comitePrograma/proceso/listar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("detalleProceso")) {
                Proceso p = (Proceso) sesion.getAttribute("Proceso");
                ArrayList<Proceso> l = new ArrayList<Proceso>();
                l.add(procesoFacade.find(p.getId()));
                sesion.setAttribute("listProceso", l);
                String url = "/WEB-INF/vista/comitePrograma/proceso/detalle.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("preparedCrearProceso")) {
                sesion.setAttribute("listModelo", modeloFacade.findAll());
                String url = "/WEB-INF/vista/comitePrograma/proceso/crear.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("crearProceso")) {
                Proceso p = new Proceso();

                String descripcion = (String) request.getParameter("descripcion");


                Integer id = Integer.valueOf(request.getParameter("modelo"));
                Modelo m = modeloFacade.find(id);

                p.setProgramaId(programa);
                p.setDescripcion(descripcion);
                p.setFechainicio("En Configuración");
                p.setModeloId(m);
                p.setFechacierre("--");

                sesion.setAttribute("EstadoProceso", 1);
                sesion.setAttribute("Proceso", p);
                sesion.setAttribute("Modelo", m);

                procesoFacade.create(p);
            } else if (action.equals("preparedPonderarFactor")) {
                sesion.setAttribute("listFactor", factorFacade.findByModelo(sesion.getAttribute("Modelo")));
                String url = "/WEB-INF/vista/comitePrograma/ponderacion/ponderarFactor.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("ponderarFactor")) {
                Ponderacionfactor pf = new Ponderacionfactor();

                List listFactor = (List) sesion.getAttribute("listFactor");

                Iterator i = listFactor.iterator();

                while (i.hasNext()) {
                    Factor f = new Factor();
                    f = (Factor) i.next();
                    Double ponderacion = Double.parseDouble(request.getParameter("ponderacion" + f.getId()));
                    String justificacion = request.getParameter("justificacion" + f.getId());

                    pf.setFactorId(f);
                    pf.setJustificacion(justificacion);
                    pf.setPonderacion(ponderacion);
                    pf.setProcesoId(proceso);

                    ponderacionfactorFacade.create(pf);
                }

            } else if (action.equals("preparedEditPonderarFactor")) {
                sesion.setAttribute("listPonderacionFactor", ponderacionfactorFacade.findByList("procesoId", sesion.getAttribute("Proceso")));
                String url = "/WEB-INF/vista/comitePrograma/ponderacion/editarpf.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editPonderarFactor")) {

                List listFactor = ponderacionfactorFacade.findByList("procesoId", sesion.getAttribute("Proceso"));

                Iterator i = listFactor.iterator();

                while (i.hasNext()) {

                    Ponderacionfactor pf = (Ponderacionfactor) i.next();
                    Double ponderacion = Double.parseDouble(request.getParameter("ponderacion" + pf.getId()));
                    String justificacion = request.getParameter("justificacion" + pf.getId());


                    pf.setJustificacion(justificacion);
                    pf.setPonderacion(ponderacion);


                    ponderacionfactorFacade.edit(pf);
                }

            } else if (action.equals("listPonderacionFactor")) {
                sesion.setAttribute("listPonderacionFactor", ponderacionfactorFacade.findAll());
                String url = "/WEB-INF/vista/comitePrograma/ponderacion/listarpf.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("preparedPonderarCara")) {
                sesion.setAttribute("listCara", caracteristicaFacade.findByModelo(modelo));
                String url = "/WEB-INF/vista/comitePrograma/ponderacion/ponderarCara.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("ponderarCara")) {
                Ponderacioncaracteristica pc = new Ponderacioncaracteristica();

                List listCara = (List) sesion.getAttribute("listCara");

                Iterator i = listCara.iterator();

                while (i.hasNext()) {
                    Caracteristica c = (Caracteristica) i.next();
                    Float importancia = Float.parseFloat(request.getParameter("importancia" + c.getId()));
                    Double ponderacion = Double.parseDouble(request.getParameter("ponderacion" + c.getId()));
                    String justificacion = request.getParameter("justificacion" + c.getId());

                    pc.setCaracteristicaId(c);
                    pc.setNivelimportancia(importancia);
                    pc.setJustificacion(justificacion);
                    pc.setPonderacion(ponderacion);

                    pc.setProcesoId(proceso);

                    PonderacioncaracteristicaFacade.create(pc);
                }
            } else if (action.equals("preparedEditPonderarCara")) {
                sesion.setAttribute("listPonderacionCara", PonderacioncaracteristicaFacade.findByList("procesoId", sesion.getAttribute("Proceso")));
                String url = "/WEB-INF/vista/comitePrograma/ponderacion/editarpc.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editPonderarCara")) {

                List listCara = PonderacioncaracteristicaFacade.findByList("procesoId", sesion.getAttribute("Proceso"));

                Iterator i = listCara.iterator();

                while (i.hasNext()) {

                    Ponderacioncaracteristica pc = (Ponderacioncaracteristica) i.next();
                    Integer importancia = Integer.parseInt(request.getParameter("importancia" + pc.getId()));
                    Double ponderacion = Double.parseDouble(request.getParameter("ponderacion" + pc.getId()));
                    String justificacion = request.getParameter("justificacion" + pc.getId());


                    pc.setJustificacion(justificacion);
                    pc.setNivelimportancia(importancia);
                    pc.setPonderacion(ponderacion);


                    PonderacioncaracteristicaFacade.edit(pc);
                }

            } else if (action.equals("listPonderacionCara")) {
                sesion.setAttribute("listPonderacionCara", PonderacioncaracteristicaFacade.findAll());
                String url = "/WEB-INF/vista/comitePrograma/ponderacion/listarpc.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("listMuestra")) {
                List<Muestra> lm = muestraFacade.findByList("procesoId", proceso);

                Muestra m = null;
                if (!lm.isEmpty()) {
                    Iterator i = lm.iterator();
                    while (i.hasNext()) {
                        m = (Muestra) i.next();
                        sesion.setAttribute("Muestra", m);
                    }
                    String url = "/WEB-INF/vista/comitePrograma/muestra/listarMuestra.jsp";
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);

                }

                sesion.setAttribute("Muestra", m);

                String url = "/WEB-INF/vista/comitePrograma/muestra/asignarMuestra.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("generarMuestra")) {

                Muestra m = new Muestra();
                m.setProcesoId(proceso);
                muestraFacade.create(m);

                sesion.setAttribute("Muestra", m);


                //Tamaño muestra
                double n = 0;
                //Nivel de confianza
                double z = 1.96;
                //Probabilidad Ocurrencia
                double p = 0.5;
                //Nivel de tolerancia 
                double e = 0.04;
                //Porbabilidad de no ocurrencia
                double q = 0.5;
                //Tamaño de la población
                double N = 0.0;

//Estudiante
                double aux = estudianteFacade.count();

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));
                }

                int tamanioMuestra = (int) Math.floor(n);

                List<Estudiante> le = estudianteFacade.generarMuestra(programa, tamanioMuestra);

                Iterator it = le.iterator();

                if (!le.isEmpty()) {
                    while (it.hasNext()) {
                        Estudiante est = (Estudiante) it.next();
                        Persona per = est.getPersonaId();

                        Muestrapersona mp = new Muestrapersona();

                        mp.setCedula(per.getId());
                        mp.setNombre(per.getNombre());
                        mp.setApellido(per.getApellido());
                        mp.setPassword(per.getPassword());
                        mp.setMail(per.getMail());
                        mp.setMuestraId(m);

                        muestrapersonaFacade.create(mp);

                        Muestraestudiante me = new Muestraestudiante();
                        me.setCodigo(est.getId());
                        me.setSemestre(est.getPeriodo());
                        me.setPeriodo(est.getPeriodo());
                        me.setAnio(est.getAnio());
                        me.setMuestrapersonaId(mp);

                        muestraestudianteFacade.create(me);
                    }
                }

            } else if (action.equals("selectorListMuestra")) {
                String fuente = "";
                if (request.getParameter("fuente") == null) {
                    fuente = (String) sesion.getAttribute("selectorFuente");
                } else {
                    fuente = request.getParameter("fuente");
                    sesion.setAttribute("selectorFuente", fuente);
                }

                System.out.println("Fuente: " + fuente);

                Muestra m = (Muestra) sesion.getAttribute("Muestra");
                if (fuente.equals("Estudiante")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestrapersonaFacade.findByList("muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(1));
                }
                String url = "/WEB-INF/vista/comitePrograma/muestra/selectorListMuestra.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("preparedEvaluador")) {
                sesion.setAttribute("listCara", caracteristicaFacade.findByModelo(modelo));
                String url = "/WEB-INF/vista/comitePrograma/muestra/crearEvaluador.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("crearEvaluador")) {
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String cedula = request.getParameter("cedula");
                String pass = request.getParameter("password");
                String mail = request.getParameter("mail");

                List lmp = muestrapersonaFacade.findByList("cedula", cedula);

                Iterator it = lmp.iterator();

                Muestrapersona mp = null;

                while (it.hasNext()) {
                    mp = (Muestrapersona) it.next();
                }

                if (mp == null) {
                    Muestrapersona mp1 = new Muestrapersona();
                    mp1.setCedula(cedula);
                    mp1.setNombre(nombre);
                    mp1.setApellido(apellido);
                    mp1.setPassword(pass);
                    mp1.setMail(mail);
                    mp1.setMuestraId((Muestra) sesion.getAttribute("Muestra"));
                    muestrapersonaFacade.create(mp1);
                    mp = mp1;
                }


                String fuente = (String) sesion.getAttribute("selectorFuente");

                if (fuente.equals("Estudiante")) {

                    String codigo = request.getParameter("codigo");
                    String semestre = request.getParameter("semestre");
                    String periodo = request.getParameter("periodo");
                    String anio = request.getParameter("anio");

                    List lme = muestraestudianteFacade.findByList("codigo", codigo);

                    Muestra m = (Muestra) sesion.getAttribute("Muestra");

                    Iterator it2 = lme.iterator();

                    Muestraestudiante me = null;

                    while (it2.hasNext()) {
                        me = (Muestraestudiante) it2.next();
                    }

                    if (me == null) {
                        Muestraestudiante me1 = new Muestraestudiante();
                        me1.setCodigo(codigo);
                        me1.setPeriodo(periodo);
                        me1.setAnio(anio);
                        me1.setSemestre(semestre);
                        me1.setMuestrapersonaId(mp);
                        muestraestudianteFacade.create(me1);
                    } else if (me.getMuestrapersonaId().getMuestraId().getId() != m.getId()) {
                        System.out.println("Muestra 1 = " + me.getMuestrapersonaId().getMuestraId());
                        System.out.println("Muestra 2 = " + sesion.getAttribute("Muestra"));
                        System.out.println("Cree para nuevo proceso");
                        muestrapersonaFacade.create(mp);
                        muestraestudianteFacade.create(me);
                    } else {
                        System.out.println("No inserte nada");
                    }
                }

            } else if (action.equals("iniciarProceso")) {
                Proceso p = (Proceso) sesion.getAttribute("Proceso");
                java.util.Date date = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
                String fecha = sdf.format(date);
                p.setFechainicio(fecha);
                p.setFechacierre("--");
                procesoFacade.edit(p);
                sesion.setAttribute("Proceso", p);
                sesion.setAttribute("EstadoProceso", "2");

                String url = "/WEB-INF/vista/comitePrograma/index.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("generarMuestraAleatoria")) {

                Muestra muestra = (Muestra) sesion.getAttribute("Muestra");
                List l = muestrapersonaFacade.findLast(sesion.getAttribute("Muestra"));

                Iterator it = l.iterator();

                int id = 0;

                while (it.hasNext()) {
                    Muestrapersona mp = (Muestrapersona) it.next();
                    id = mp.getId();
                }

                int numero = Integer.valueOf(request.getParameter("numero"));

                for (int i = 0; i < numero; i++) {

                    id++;

                    String pass = passwordGenerator.getPassword(
                            passwordGenerator.MAYUSCULAS
                            + passwordGenerator.NUMEROS, 6);


                    String nombre = "Usuario";
                    String apellido = "Aleatorio";
                    String cedula = programa.getId() + proceso.getId() + " - ";
                    String mail = "correo@correo.com";

                    Muestrapersona mp1 = new Muestrapersona();
                    String idx = "00" + programa.getId() + proceso.getId() + muestra.getId() + "-" + id;
                    mp1.setCedula(idx);
                    mp1.setNombre(nombre);
                    mp1.setApellido(apellido);
                    mp1.setPassword(pass);
                    mp1.setMail(mail);
                    mp1.setMuestraId((Muestra) sesion.getAttribute("Muestra"));

                    muestrapersonaFacade.create(mp1);

                    String fuente = (String) sesion.getAttribute("selectorFuente");

                    if (fuente.equals("Estudiante")) {

                        String codigo = String.valueOf(i);
                        String semestre = "--";
                        String periodo = "--";
                        String anio = "--";

                        Muestra m = (Muestra) sesion.getAttribute("Muestra");

                        Muestraestudiante me1 = new Muestraestudiante();
                        me1.setCodigo(idx);
                        me1.setPeriodo(periodo);
                        me1.setAnio(anio);
                        me1.setSemestre(semestre);
                        me1.setMuestrapersonaId(mp1);
                        muestraestudianteFacade.create(me1);
                    }
                }
            } else if (action.equals("preparedEditarMuestra")) {

                List e = estudianteFacade.findByList("programaId", sesion.getAttribute("Programa"));
                sesion.setAttribute("listPoblacion", e);

                List le = encabezadoFacade.findByList2("procesoId", sesion.getAttribute("Proceso"), "fuenteId", sesion.getAttribute("Fuente"));

                sesion.setAttribute("listEncabezado", le);

                String url = "/WEB-INF/vista/comitePrograma/muestra/editarMuestra.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
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
