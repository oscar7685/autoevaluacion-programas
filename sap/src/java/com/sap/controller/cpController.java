/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.controller;

import com.sap.ejb.AdministrativoFacade;
import com.sap.ejb.AgenciagubernamentalFacade;
import com.sap.ejb.CaracteristicaFacade;
import com.sap.ejb.DirectorprogramaFacade;
import com.sap.ejb.DocenteFacade;
import com.sap.ejb.EgresadoFacade;
import com.sap.ejb.EmpleadorFacade;
import com.sap.ejb.EncabezadoFacade;
import com.sap.ejb.EstudianteFacade;
import com.sap.ejb.FactorFacade;
import com.sap.ejb.FuenteFacade;
import com.sap.ejb.ModeloFacade;
import com.sap.ejb.MuestraFacade;
import com.sap.ejb.MuestraadministrativoFacade;
import com.sap.ejb.MuestraagenciaFacade;
import com.sap.ejb.MuestradirectorFacade;
import com.sap.ejb.MuestradocenteFacade;
import com.sap.ejb.MuestraegresadoFacade;
import com.sap.ejb.MuestraempleadorFacade;
import com.sap.ejb.MuestraestudianteFacade;
import com.sap.ejb.MuestrapersonaFacade;
import com.sap.ejb.PonderacioncaracteristicaFacade;
import com.sap.ejb.PonderacionfactorFacade;
import com.sap.ejb.ProcesoFacade;
import com.sap.entity.Administrativo;
import com.sap.entity.Agenciagubernamental;
import com.sap.entity.Caracteristica;
import com.sap.entity.Directorprograma;
import com.sap.entity.Docente;
import com.sap.entity.Egresado;
import com.sap.entity.Empleador;
import com.sap.entity.Estudiante;
import com.sap.entity.Factor;
import com.sap.entity.Modelo;
import com.sap.entity.Muestra;
import com.sap.entity.Muestraadministrativo;
import com.sap.entity.Muestraagencia;
import com.sap.entity.Muestradirector;
import com.sap.entity.Muestradocente;
import com.sap.entity.Muestraegresado;
import com.sap.entity.Muestraempleador;
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
    private MuestradocenteFacade muestradocenteFacade;
    @EJB
    private MuestraegresadoFacade muestraegresadoFacade;
    @EJB
    private MuestraadministrativoFacade muestraadministrativoFacade;
    @EJB
    private MuestradirectorFacade muestradirectorFacade;
    @EJB
    private MuestraagenciaFacade muestraagenciaFacade;
    @EJB
    private MuestraempleadorFacade muestraempleadorFacade;
    @EJB
    private EstudianteFacade estudianteFacade;
    @EJB
    private DocenteFacade docenteFacade;
    @EJB
    private EgresadoFacade egresadoFacade;
    @EJB
    private AdministrativoFacade administrativoFacade;
    @EJB
    private DirectorprogramaFacade directorprogramaFacadeFacade;
    @EJB
    private EmpleadorFacade empleadorFacade;
    @EJB
    private AgenciagubernamentalFacade agenciagubernamentalFacade;
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
                System.out.println("Proceso: " + proceso);
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

                //********************************Estudiante
                double aux = estudianteFacade.countByProperty("programaId", sesion.getAttribute("Programa"));

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));
                }



                double cociente = n / N;


                for (int i = 3; i < 10; i++) {

                    int tamanioMuestra1 = 0;

                    int tamaniosem = estudianteFacade.countByProperty2("programaId", sesion.getAttribute("Programa"), "semestre", "0" + i);

                    tamanioMuestra1 = (int) Math.round(tamaniosem * cociente);

                    List<Estudiante> le = estudianteFacade.generarMuestraEst(programa, tamanioMuestra1, "semestre", "0" + i);

                    System.out.println("Tamaño: " + le.size());

                    System.out.println("Tmañao smestre " + i + " : " + tamaniosem);
                    System.out.println("Muestra smestre " + i + " : " + tamanioMuestra1);

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
                            me.setSemestre(est.getSemestre());
                            me.setPeriodo(est.getPeriodo());
                            me.setAnio(est.getAnio());
                            me.setMuestrapersonaId(mp);

                            muestraestudianteFacade.create(me);
                        }
                    }


                }


                //********************************Docente

                aux = estudianteFacade.countByProperty("programaId", sesion.getAttribute("Programa"));

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));
                }


                int tamanioMuestra = 0;

                tamanioMuestra = (int) Math.floor(n);

                List<Docente> ld = docenteFacade.generarMuestra(programa, tamanioMuestra);


                Iterator it = ld.iterator();

                if (!ld.isEmpty()) {
                    while (it.hasNext()) {
                        Docente doc = (Docente) it.next();
                        Persona per = doc.getPersonaId();

                        Muestrapersona mp = new Muestrapersona();

                        mp.setCedula(per.getId());
                        mp.setNombre(per.getNombre());
                        mp.setApellido(per.getApellido());
                        mp.setPassword(per.getPassword());
                        mp.setMail(per.getMail());
                        mp.setMuestraId(m);

                        muestrapersonaFacade.create(mp);

                        Muestradocente md = new Muestradocente();
                        md.setTipo(doc.getTipo());
                        md.setMuestrapersonaId(mp);

                        muestradocenteFacade.create(md);
                    }
                }

                //********************************Egresado

                aux = egresadoFacade.countByProperty("programaId", sesion.getAttribute("Programa"));

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));
                }

                tamanioMuestra = (int) Math.floor(n);

                List<Egresado> leg = egresadoFacade.generarMuestra(programa, tamanioMuestra);

                it = leg.iterator();

                if (!leg.isEmpty()) {
                    while (it.hasNext()) {
                        Egresado eg = (Egresado) it.next();
                        Persona per = eg.getPersonaId();

                        Muestrapersona mp = new Muestrapersona();

                        mp.setCedula(per.getId());
                        mp.setNombre(per.getNombre());
                        mp.setApellido(per.getApellido());
                        mp.setPassword(per.getPassword());
                        mp.setMail(per.getMail());
                        mp.setMuestraId(m);

                        muestrapersonaFacade.create(mp);

                        Muestraegresado meg = new Muestraegresado();
                        meg.setMuestrapersonaId(mp);

                        muestraegresadoFacade.create(meg);
                    }
                }

                //********************************Director

                aux = directorprogramaFacadeFacade.countByProperty("programaId", sesion.getAttribute("Programa"));

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));
                }

                tamanioMuestra = (int) Math.floor(n);

                List<Directorprograma> ldp = directorprogramaFacadeFacade.generarMuestra(programa, tamanioMuestra);

                it = ldp.iterator();

                if (!ldp.isEmpty()) {
                    while (it.hasNext()) {
                        Directorprograma dp = (Directorprograma) it.next();
                        Persona per = dp.getPersonaId();

                        Muestrapersona mp = new Muestrapersona();

                        mp.setCedula(per.getId());
                        mp.setNombre(per.getNombre());
                        mp.setApellido(per.getApellido());
                        mp.setPassword(per.getPassword());
                        mp.setMail(per.getMail());
                        mp.setMuestraId(m);

                        muestrapersonaFacade.create(mp);

                        Muestradirector mdp = new Muestradirector();
                        mdp.setMuestrapersonaId(mp);

                        muestradirectorFacade.create(mdp);
                    }
                }

                //********************************Administrativo

                aux = administrativoFacade.countByProperty("programaId", sesion.getAttribute("Programa"));

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));
                }

                tamanioMuestra = (int) Math.floor(n);

                List<Administrativo> lad = administrativoFacade.generarMuestra(programa, tamanioMuestra);

                it = lad.iterator();

                if (!lad.isEmpty()) {
                    while (it.hasNext()) {
                        Administrativo ad = (Administrativo) it.next();
                        Persona per = ad.getPersonaId();

                        Muestrapersona mp = new Muestrapersona();

                        mp.setCedula(per.getId());
                        mp.setNombre(per.getNombre());
                        mp.setApellido(per.getApellido());
                        mp.setPassword(per.getPassword());
                        mp.setMail(per.getMail());
                        mp.setMuestraId(m);

                        muestrapersonaFacade.create(mp);

                        Muestraadministrativo mad = new Muestraadministrativo();
                        mad.setCargo(ad.getCargo());
                        mad.setMuestrapersonaId(mp);

                        muestraadministrativoFacade.create(mad);
                    }
                }

                //********************************EMpleador

                aux = empleadorFacade.count();

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));
                }

                tamanioMuestra = (int) Math.floor(n);

                List<Empleador> lem = empleadorFacade.generarMuestraSinPrograma(tamanioMuestra);

                it = lem.iterator();

                if (!lem.isEmpty()) {
                    while (it.hasNext()) {
                        Empleador em = (Empleador) it.next();
                        Persona per = em.getPersonaId();

                        Muestrapersona mp = new Muestrapersona();

                        mp.setCedula(per.getId());
                        mp.setNombre(per.getNombre());
                        mp.setApellido(per.getApellido());
                        mp.setPassword(per.getPassword());
                        mp.setMail(per.getMail());
                        mp.setMuestraId(m);

                        muestrapersonaFacade.create(mp);

                        Muestraempleador mem = new Muestraempleador();
                        mem.setEmpresa(em.getEmpresa());
                        mem.setCargo(em.getCargo());
                        mem.setMuestrapersonaId(mp);

                        muestraempleadorFacade.create(mem);
                    }
                }

                //********************************Agencia

                aux = agenciagubernamentalFacade.count();

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));
                }

                tamanioMuestra = (int) Math.floor(n);

                List<Agenciagubernamental> lag = agenciagubernamentalFacade.generarMuestraSinPrograma(tamanioMuestra);

                it = lag.iterator();

                if (!lag.isEmpty()) {
                    while (it.hasNext()) {
                        Agenciagubernamental ag = (Agenciagubernamental) it.next();
                        Persona per = ag.getPersonaId();

                        Muestrapersona mp = new Muestrapersona();

                        mp.setCedula(per.getId());
                        mp.setNombre(per.getNombre());
                        mp.setApellido(per.getApellido());
                        mp.setPassword(per.getPassword());
                        mp.setMail(per.getMail());
                        mp.setMuestraId(m);

                        muestrapersonaFacade.create(mp);

                        Muestraagencia mag = new Muestraagencia();
                        mag.setDescripcion(ag.getDescripcion());
                        mag.setMuestrapersonaId(mp);

                        muestraagenciaFacade.create(mag);
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
                    sesion.setAttribute("listMuestraSeleccionada", muestraestudianteFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(1));
                    sesion.setAttribute("Semestre", "--");
                } else if (fuente.equals("Docente")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestradocenteFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(2));
                } else if (fuente.equals("Egresado")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestraegresadoFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(2));
                } else if (fuente.equals("Administrativo")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestraadministrativoFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(4));
                } else if (fuente.equals("Directivo")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestradirectorFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(5));
                } else if (fuente.equals("Empleador")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestraempleadorFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(7));
                } else if (fuente.equals("Agencia")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestraagenciaFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(6));
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

                Muestra m = (Muestra) sesion.getAttribute("Muestra");

                String fuente = (String) sesion.getAttribute("selectorFuente");

                List lmp = muestrapersonaFacade.findByList2("cedula", cedula, "muestraId", m);

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

                    if (fuente.equals("Egresado")) {

                        Muestraegresado me = new Muestraegresado();

                        me.setMuestrapersonaId(mp1);

                        muestraegresadoFacade.create(me);

                    } else if (fuente.equals("Administrativo")) {

                        String cargo = request.getParameter("cargo");

                        Muestraadministrativo ma = new Muestraadministrativo();

                        ma.setCargo(cargo);
                        ma.setMuestrapersonaId(mp1);

                        muestraadministrativoFacade.create(ma);

                    } else if (fuente.equals("Directivo")) {
                        Muestradirector md = new Muestradirector();

                        md.setMuestrapersonaId(mp1);

                        muestradirectorFacade.create(md);

                    } else if (fuente.equals("Empleador")) {

                        String cargo = request.getParameter("cargo");
                        String empresa = request.getParameter("empresa");

                        Muestraempleador mem = new Muestraempleador();
                        mem.setCargo(cargo);
                        mem.setEmpresa(empresa);
                        mem.setMuestrapersonaId(mp1);

                        muestraempleadorFacade.create(mem);

                    } else if (fuente.equals("Agencia")) {

                        String descripcion = request.getParameter("descripcion");

                        Muestraagencia ma = new Muestraagencia();
                        ma.setDescripcion(descripcion);
                        ma.setMuestrapersonaId(mp1);

                        muestraagenciaFacade.create(ma);

                    }
                } else {
                    System.out.println("Cedula Duplicada Para Este Proceso");
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

                    if (fuente.equals("Docente")) {
                        Muestra m = (Muestra) sesion.getAttribute("Muestra");

                        Muestradocente md1 = new Muestradocente();
                        md1.setTipo("--");
                        md1.setMuestrapersonaId(mp1);
                        muestradocenteFacade.create(md1);
                    } else if (fuente.equals("Egresado")) {
                        Muestra m = (Muestra) sesion.getAttribute("Muestra");

                        Muestraegresado meg1 = new Muestraegresado();
                        meg1.setMuestrapersonaId(mp1);
                        muestraegresadoFacade.create(meg1);
                    } else if (fuente.equals("Administrativo")) {
                        Muestra m = (Muestra) sesion.getAttribute("Muestra");

                        Muestraadministrativo mad1 = new Muestraadministrativo();
                        mad1.setCargo("--");
                        mad1.setMuestrapersonaId(mp1);
                        muestraadministrativoFacade.create(mad1);
                    } else if (fuente.equals("Directivo")) {
                        Muestra m = (Muestra) sesion.getAttribute("Muestra");

                        Muestradirector mdir1 = new Muestradirector();
                        mdir1.setMuestrapersonaId(mp1);
                        muestradirectorFacade.create(mdir1);
                    } else if (fuente.equals("Empleador")) {
                        Muestra m = (Muestra) sesion.getAttribute("Muestra");

                        Muestraempleador mem1 = new Muestraempleador();
                        mem1.setCargo("--");
                        mem1.setEmpresa("--");
                        mem1.setMuestrapersonaId(mp1);
                        muestraempleadorFacade.create(mem1);
                    } else if (fuente.equals("Agencia")) {
                        Muestra m = (Muestra) sesion.getAttribute("Muestra");

                        Muestraagencia mag1 = new Muestraagencia();
                        mag1.setDescripcion("--");
                        mag1.setMuestrapersonaId(mp1);
                        muestraagenciaFacade.create(mag1);
                    }
                }
            } else if (action.equals("preparedEditarMuestra")) {

                List e = estudianteFacade.findByList2("programaId", sesion.getAttribute("Programa"), "semestre", sesion.getAttribute("Semestre"));
                sesion.setAttribute("listPoblacion", e);

                List le = encabezadoFacade.findByList2("procesoId", sesion.getAttribute("Proceso"), "fuenteId", sesion.getAttribute("Fuente"));

                sesion.setAttribute("listEncabezado", le);

                String url = "/WEB-INF/vista/comitePrograma/muestra/editarMuestra.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editarMuestra")) {

                List lme = muestraestudianteFacade.findByList2("muestrapersonaId.muestraId", sesion.getAttribute("Muestra"), "semestre", sesion.getAttribute("Semestre"));
                Iterator it1 = lme.iterator();

                while (it1.hasNext()) {
                    Muestraestudiante me1 = (Muestraestudiante) it1.next();
                    Muestrapersona mp1 = me1.getMuestrapersonaId();

                    muestraestudianteFacade.remove(me1);
                    muestrapersonaFacade.remove(mp1);

                }

                Muestra m = (Muestra) sesion.getAttribute("Muestra");


                List le = estudianteFacade.findByList2("programaId", sesion.getAttribute("Programa"), "semestre", sesion.getAttribute("Semestre"));

                Iterator it = le.iterator();

                while (it.hasNext()) {
                    Estudiante est = (Estudiante) it.next();
                    System.out.println("Variable   " + request.getParameter(String.valueOf(est.getPersonaId().getId())));
                    if ("1".equals(request.getParameter(String.valueOf(est.getPersonaId().getId())))) {


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
                        me.setSemestre(est.getSemestre());
                        me.setPeriodo(est.getPeriodo());
                        me.setAnio(est.getAnio());
                        me.setMuestrapersonaId(mp);

                        muestraestudianteFacade.create(me);

                    }
                }

                String url = "/WEB-INF/vista/comitePrograma/muestra/editarMuestra.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("selectorListSemestre")) {

                String semestre = request.getParameter("semestre");

                sesion.setAttribute("Semestre", semestre);

                Muestra m = (Muestra) sesion.getAttribute("Muestra");

                sesion.setAttribute("listMuestraSeleccionada", muestraestudianteFacade.findByList2("muestrapersonaId.muestraId", m, "semestre", semestre));
                sesion.setAttribute("Fuente", fuenteFacade.find(1));

                String fuente;

                if (request.getParameter("fuente") == null) {
                    fuente = (String) sesion.getAttribute("selectorFuente");
                } else {
                    fuente = request.getParameter("fuente");
                    sesion.setAttribute("selectorFuente", fuente);
                }



                String url = "/WEB-INF/vista/comitePrograma/muestra/selectorListMuestra.jsp";
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
