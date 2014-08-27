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
import com.sap.ejb.EncuestaFacade;
import com.sap.ejb.EstudianteFacade;
import com.sap.ejb.FactorFacade;
import com.sap.ejb.FuenteFacade;
import com.sap.ejb.HallazgoFacade;
import com.sap.ejb.IndicadorFacade;
import com.sap.ejb.InstrumentoFacade;
import com.sap.ejb.MetasFacade;
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
import com.sap.ejb.NumericadocumentalFacade;
import com.sap.ejb.ObjetivosFacade;
import com.sap.ejb.PersonaFacade;
import com.sap.ejb.PonderacioncaracteristicaFacade;
import com.sap.ejb.PonderacionfactorFacade;
import com.sap.ejb.PreguntaFacade;
import com.sap.ejb.ProcesoFacade;
import com.sap.ejb.ProgramaFacade;
import com.sap.ejb.RepresentanteFacade;
import com.sap.ejb.ResultadoevaluacionFacade;
import com.sap.entity.Administrativo;
import com.sap.entity.Agenciagubernamental;
import com.sap.entity.Asignacionencuesta;
import com.sap.entity.Caracteristica;
import com.sap.entity.Directorprograma;
import com.sap.entity.Docente;
import com.sap.entity.Egresado;
import com.sap.entity.Empleador;
import com.sap.entity.Encabezado;
import com.sap.entity.Encuesta;
import com.sap.entity.Estudiante;
import com.sap.entity.Factor;
import com.sap.entity.Fuente;
import com.sap.entity.Hallazgo;
import com.sap.entity.Indicador;
import com.sap.entity.Instrumento;
import com.sap.entity.Metas;
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
import com.sap.entity.Numericadocumental;
import com.sap.entity.Objetivos;
import com.sap.entity.Persona;
import com.sap.entity.Ponderacioncaracteristica;
import com.sap.entity.Ponderacionfactor;
import com.sap.entity.Pregunta;
import com.sap.entity.Proceso;
import com.sap.entity.Programa;
import com.sap.entity.Representante;
import com.sap.entity.Resultadoevaluacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
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
    private MetasFacade metasFacade;
    @EJB
    private ObjetivosFacade objetivosFacade;
    @EJB
    private HallazgoFacade hallazgoFacade;
    @EJB
    private PersonaFacade personaFacade;
    @EJB
    private ResultadoevaluacionFacade resultadoevaluacionFacade;
    @EJB
    private EncuestaFacade encuestaFacade;
    @EJB
    private PreguntaFacade preguntaFacade;
    @EJB
    private RepresentanteFacade representanteFacade;
    @EJB
    private ProgramaFacade programaFacade;
    @EJB
    private DirectorprogramaFacade directorprogramaFacade;
    @EJB
    private PonderacioncaracteristicaFacade ponderacioncaracteristicaFacade;
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
    private EmpleadorFacade empleadorFacade;
    @EJB
    private AgenciagubernamentalFacade agenciagubernamentalFacade;
    @EJB
    private EncabezadoFacade encabezadoFacade;
    @EJB
    private FuenteFacade fuenteFacade;
    @EJB
    private IndicadorFacade indicadorFacade;
    @EJB
    private NumericadocumentalFacade numericadocumentalFacade;
    @EJB
    private InstrumentoFacade instrumentoFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
        Programa programa = (Programa) sesion.getAttribute("Programa");
        Modelo modelo = (Modelo) sesion.getAttribute("Modelo");
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");

        try {
            if (action.equals("indexCP")) {
                String url = "/WEB-INF/vista/comitePrograma/index.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("inicio")) {
                String url = "/WEB-INF/vista/comitePrograma/inicio.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("listarProceso")) {
                sesion.setAttribute("listProceso", procesoFacade.findByList("programaId", programa));
                String url = "/WEB-INF/vista/comitePrograma/proceso/listar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("verPProceso")) {

                int id = Integer.parseInt(request.getParameter("id"));

                Proceso p = procesoFacade.find(id);

                sesion.setAttribute("Proceso", p);
                sesion.setAttribute("Modelo", p.getModeloId());
                sesion.setAttribute("EstadoProceso", 3);

            } else if (action.equals("crearHallazgo")) {
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/hallazgos/crear.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("crearFortaleza")) {
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/fortalezas/crear.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("crearObjetivo")) {
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/objetivos/crear.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("crear2Objetivo")) {
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/objetivos2/crear.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("crearMeta")) {
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/metas/crear.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("crear2Meta")) {
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/metas2/crear.jsp";
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
                sesion.setAttribute("listPrograma", programaFacade.findAll());
                String url = "/WEB-INF/vista/comitePrograma/proceso/crear.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("planMejoramiento")) {
                List<Hallazgo> ha = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "hallazgo");
                List<Hallazgo> forta = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "fortaleza");
                sesion.setAttribute("listaC", caracteristicaFacade.findByModelo(modelo));
                sesion.setAttribute("listHallazgos", ha);
                sesion.setAttribute("listFortalezas", forta);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/hallazgos/listar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("crearProceso")) {

                Proceso p = new Proceso();

                String descripcion = (String) request.getParameter("descripcion");

                Integer id1 = Integer.valueOf(request.getParameter("programa"));
                Programa p0 = programaFacade.find(id1);

                Integer id = Integer.valueOf(request.getParameter("modelo"));
                Modelo m = modeloFacade.find(id);

                List l = procesoFacade.findByList("programaId", p0);
                Iterator i = l.iterator();

                int aux = 0;

                while (i.hasNext()) {
                    Proceso pro = (Proceso) i.next();
                    if (pro.getFechacierre().equals("--")) {
                        aux = 1;
                    }
                }

                if (aux == 0) {

                    p.setProgramaId(p0);
                    p.setDescripcion(descripcion);
                    p.setFechainicio("En Configuración");
                    p.setModeloId(m);
                    p.setFechacierre("--");

                    sesion.setAttribute("EstadoProceso", 1);
                    sesion.setAttribute("Proceso", p);
                    sesion.setAttribute("Modelo", m);

                    procesoFacade.create(p);

                    out.println(1);
                } else {
                    out.println(0);
                }
            } else if (action.equals("preparedPonderarFactor")) {
                sesion.setAttribute("listFactor", factorFacade.findByModelo((Modelo) modelo));
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
                sesion.setAttribute("listPonderacionFactor", ponderacionfactorFacade.findByList("procesoId", proceso));
                String url = "/WEB-INF/vista/comitePrograma/ponderacion/editarpf.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editPonderarFactor")) {

                List listFactor = ponderacionfactorFacade.findByList("procesoId", proceso);

                Iterator i = listFactor.iterator();

                while (i.hasNext()) {

                    Ponderacionfactor pf = (Ponderacionfactor) i.next();
                    Double ponderacion = Double.parseDouble(request.getParameter("ponderacion" + pf.getId()));
                    String justificacion = request.getParameter("justificacion" + pf.getId());

                    pf.setJustificacion(justificacion);
                    pf.setPonderacion(ponderacion);
                    ponderacionfactorFacade.edit(pf);

                    Factor f = pf.getFactorId();

                    List suma0 = f.getCaracteristicaList();

                    Iterator i1 = suma0.iterator();

                    double suma = 0;
                    List<Ponderacioncaracteristica> listpondC = (List<Ponderacioncaracteristica>) sesion.getAttribute("listPonderacionCara");
                    if (listpondC != null && listpondC.size() > 0) {
                        while (i1.hasNext()) {
                            Caracteristica c = (Caracteristica) i1.next();
                            Ponderacioncaracteristica pc1 = PonderacioncaracteristicaFacade.findBySingle2("caracteristicaId", c, "procesoId", proceso);
                            suma += pc1.getNivelimportancia();
                        }

                        Iterator i2 = suma0.iterator();

                        while (i2.hasNext()) {
                            Caracteristica c = (Caracteristica) i2.next();
                            Ponderacioncaracteristica pc1 = PonderacioncaracteristicaFacade.findBySingle2("caracteristicaId", c, "procesoId", proceso);

                            double vi = pc1.getNivelimportancia();

                            //System.out.println("Ponderacion FActor: " + pf.getPonderacion());
                            double a = (100 * vi) / suma;
                            double b = ((pf.getPonderacion() * a) / 100);

                            double r;

                            int decimalPlaces = 2;
                            BigDecimal bde = new BigDecimal(b);

// setScale is immutable
                            bde = bde.setScale(decimalPlaces, BigDecimal.ROUND_HALF_UP);
                            r = bde.doubleValue();

                            pc1.setPonderacion(r);
                            PonderacioncaracteristicaFacade.edit(pc1);
                        }
                    }

                }

            } else if (action.equals("listPonderacionFactor")) {
                sesion.setAttribute("listPonderacionFactor", ponderacionfactorFacade.findByList("procesoId", proceso));
                String url = "/WEB-INF/vista/comitePrograma/ponderacion/listarpf.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("preparedPonderarCara")) {
                sesion.setAttribute("listCara", caracteristicaFacade.findByModelo(modelo));
                String url = "/WEB-INF/vista/comitePrograma/ponderacion/ponderarCara.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("crearHallazgo2")) {
                Proceso pr = (Proceso) proceso;
                String hallazgo = (String) request.getParameter("hallazgo");
                String caracteristica = (String) request.getParameter("caracteristica");
                Caracteristica c = caracteristicaFacade.find(Integer.parseInt(caracteristica));

                Hallazgo h = new Hallazgo();
                h.setHallazgo(hallazgo);
                h.setCaracteristicaId(c);
                h.setProcesoId(proceso);
                h.setTipo("hallazgo");
                hallazgoFacade.create(h);

                Hallazgo recienCreado = hallazgoFacade.findUltimo("idhallazgo").get(0);
                List<Hallazgo> hallagos = pr.getHallazgoList();
                hallagos.add(recienCreado);
                pr.setHallazgoList(hallagos);
                procesoFacade.edit(pr);
            } else if (action.equals("crearFortaleza2")) {
                Proceso pr = (Proceso) proceso;
                String hallazgo = (String) request.getParameter("hallazgo");
                String caracteristica = (String) request.getParameter("caracteristica");
                Caracteristica c = caracteristicaFacade.find(Integer.parseInt(caracteristica));

                Hallazgo h = new Hallazgo();
                h.setHallazgo(hallazgo);
                h.setCaracteristicaId(c);
                h.setProcesoId(proceso);
                h.setTipo("fortaleza");
                hallazgoFacade.create(h);

                Hallazgo recienCreado = hallazgoFacade.findUltimo("idhallazgo").get(0);
                List<Hallazgo> hallagos = pr.getHallazgoList();
                hallagos.add(recienCreado);
                pr.setHallazgoList(hallagos);
                procesoFacade.edit(pr);

            } else if (action.equals("crearObjetivo2")) {
                String objetivo = (String) request.getParameter("objetivo");
                Hallazgo h = (Hallazgo) sesion.getAttribute("hallazgo");
                Objetivos o = new Objetivos();
                o.setObjetivo(objetivo);
                o.setHallazgoIdhallazgo(h);
                objetivosFacade.create(o);

                Objetivos recienCreado = objetivosFacade.findUltimo("idobjetivos").get(0);
                List<Objetivos> objetivos = h.getObjetivosList();
                objetivos.add(recienCreado);
                h.setObjetivosList(objetivos);
                hallazgoFacade.edit(h);
            } else if (action.equals("crear2Objetivo2")) {
                String objetivo = (String) request.getParameter("objetivo");
                Hallazgo h = (Hallazgo) sesion.getAttribute("fortaleza");
                Objetivos o = new Objetivos();
                o.setObjetivo(objetivo);
                o.setHallazgoIdhallazgo(h);
                objetivosFacade.create(o);

                Objetivos recienCreado = objetivosFacade.findUltimo("idobjetivos").get(0);
                List<Objetivos> objetivos = h.getObjetivosList();
                objetivos.add(recienCreado);
                h.setObjetivosList(objetivos);
                hallazgoFacade.edit(h);
            } else if (action.equals("crearMeta2")) {
                Objetivos o = (Objetivos) sesion.getAttribute("objetivo");
                String meta = (String) request.getParameter("meta");
                String estrategia = (String) request.getParameter("estrategia");
                String indicador = (String) request.getParameter("indicador");
                String finicio = (String) request.getParameter("inicio");
                String ffinal = (String) request.getParameter("final");
                String responsables = (String) request.getParameter("responsables");
                String recursos = (String) request.getParameter("recursos");

                SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
                Date fechaI = null;
                try {

                    fechaI = formatoDelTexto.parse(finicio);

                } catch (Exception ex) {

                    ex.printStackTrace();

                }
                Date fechaF = null;
                try {

                    fechaF = formatoDelTexto.parse(ffinal);

                } catch (Exception ex) {

                    ex.printStackTrace();

                }

                Metas m = new Metas();
                m.setMeta(meta);
                m.setEstrategia(estrategia);
                m.setIndicadorCumplimiento(indicador);
                m.setResponsable(responsables);
                m.setFinanciacion(recursos);
                m.setObjetivosIdobjetivos(o);
                m.setFechaInicio(fechaI);
                m.setFechaFinal(fechaF);

                metasFacade.create(m);

                Metas recienCreado = metasFacade.findUltimo("idmeta").get(0);
                List<Metas> metas = o.getMetasList();
                metas.add(recienCreado);
                o.setMetasList(metas);
                objetivosFacade.edit(o);
            } else if (action.equals("crear2Meta2")) {
                Objetivos o = (Objetivos) sesion.getAttribute("objetivo");
                String meta = (String) request.getParameter("meta");
                String estrategia = (String) request.getParameter("estrategia");
                String indicador = (String) request.getParameter("indicador");
                String finicio = (String) request.getParameter("inicio");
                String ffinal = (String) request.getParameter("final");
                String responsables = (String) request.getParameter("responsables");
                String recursos = (String) request.getParameter("recursos");

                SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
                Date fechaI = null;
                try {

                    fechaI = formatoDelTexto.parse(finicio);

                } catch (Exception ex) {

                    ex.printStackTrace();

                }
                Date fechaF = null;
                try {

                    fechaF = formatoDelTexto.parse(ffinal);

                } catch (Exception ex) {

                    ex.printStackTrace();

                }

                Metas m = new Metas();
                m.setMeta(meta);
                m.setEstrategia(estrategia);
                m.setIndicadorCumplimiento(indicador);
                m.setResponsable(responsables);
                m.setFinanciacion(recursos);
                m.setObjetivosIdobjetivos(o);
                m.setFechaInicio(fechaI);
                m.setFechaFinal(fechaF);

                metasFacade.create(m);

                Metas recienCreado = metasFacade.findUltimo("idmeta").get(0);
                List<Metas> metas = o.getMetasList();
                metas.add(recienCreado);
                o.setMetasList(metas);
                objetivosFacade.edit(o);
            } else if (action.equals("editarMeta2")) {
                Metas m = (Metas) sesion.getAttribute("meta");
                String meta = (String) request.getParameter("meta");
                String estrategia = (String) request.getParameter("estrategia");
                String indicador = (String) request.getParameter("indicador");
                String finicio = (String) request.getParameter("inicio");
                String ffinal = (String) request.getParameter("final");
                String responsables = (String) request.getParameter("responsables");
                String recursos = (String) request.getParameter("recursos");

                SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
                Date fechaI = null;
                try {

                    fechaI = formatoDelTexto.parse(finicio);

                } catch (Exception ex) {

                    ex.printStackTrace();

                }
                Date fechaF = null;
                try {

                    fechaF = formatoDelTexto.parse(ffinal);

                } catch (Exception ex) {

                    ex.printStackTrace();

                }

                m.setMeta(meta);
                m.setEstrategia(estrategia);
                m.setIndicadorCumplimiento(indicador);
                m.setResponsable(responsables);
                m.setFinanciacion(recursos);
                m.setFechaInicio(fechaI);
                m.setFechaFinal(fechaF);

                metasFacade.edit(m);
            } else if (action.equals("editar2Meta2")) {
                Metas m = (Metas) sesion.getAttribute("meta");
                String meta = (String) request.getParameter("meta");
                String estrategia = (String) request.getParameter("estrategia");
                String indicador = (String) request.getParameter("indicador");
                String finicio = (String) request.getParameter("inicio");
                String ffinal = (String) request.getParameter("final");
                String responsables = (String) request.getParameter("responsables");
                String recursos = (String) request.getParameter("recursos");

                SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
                Date fechaI = null;
                try {

                    fechaI = formatoDelTexto.parse(finicio);

                } catch (Exception ex) {

                    ex.printStackTrace();

                }
                Date fechaF = null;
                try {

                    fechaF = formatoDelTexto.parse(ffinal);

                } catch (Exception ex) {

                    ex.printStackTrace();

                }

                m.setMeta(meta);
                m.setEstrategia(estrategia);
                m.setIndicadorCumplimiento(indicador);
                m.setResponsable(responsables);
                m.setFinanciacion(recursos);
                m.setFechaInicio(fechaI);
                m.setFechaFinal(fechaF);

                metasFacade.edit(m);

            } else if (action.equals("ponderarCara")) {
                Ponderacioncaracteristica pc = new Ponderacioncaracteristica();

                List listCara = (List) sesion.getAttribute("listCara");

                Iterator i = listCara.iterator();

                while (i.hasNext()) {
                    Caracteristica c = (Caracteristica) i.next();
                    Float importancia = Float.parseFloat(request.getParameter("importancia" + c.getId()));
                    //Double ponderacion = Double.parseDouble(request.getParameter("ponderacion" + c.getId()));
                    String justificacion = request.getParameter("justificacion" + c.getId());

                    pc.setCaracteristicaId(c);
                    pc.setNivelimportancia(importancia);
                    pc.setJustificacion(justificacion);
                    pc.setPonderacion(0);

                    pc.setProcesoId(proceso);

                    PonderacioncaracteristicaFacade.create(pc);
                }

                List lpc = PonderacioncaracteristicaFacade.findByList("procesoId", proceso);

                i = lpc.iterator();

                while (i.hasNext()) {
                    pc = (Ponderacioncaracteristica) i.next();

                    double vi = pc.getNivelimportancia();

                    Factor f = pc.getCaracteristicaId().getFactorId();

                    Ponderacionfactor pf = ponderacionfactorFacade.findBySingle2("factorId", f, "procesoId", proceso);

                    List suma0 = f.getCaracteristicaList();

                    Iterator i1 = suma0.iterator();

                    double suma = 0;

                    while (i1.hasNext()) {
                        Caracteristica c = (Caracteristica) i1.next();
                        Ponderacioncaracteristica pc1 = PonderacioncaracteristicaFacade.findBySingle2("caracteristicaId", c, "procesoId", proceso);
                        suma += pc1.getNivelimportancia();
                        // System.out.println("Factor Id: " + f.getCodigo());
                        // System.out.println("Caracteristica Id: " + c.getCodigo());
                    }

                    //  System.out.println("Suma: " + suma);
                    double a = (100 * vi) / suma;
                    double b = ((pf.getPonderacion() * a) / 100);

                    double r;

                    int decimalPlaces = 2;
                    BigDecimal bde = new BigDecimal(b);

// setScale is immutable
                    bde = bde.setScale(decimalPlaces, BigDecimal.ROUND_HALF_UP);
                    r = bde.doubleValue();

                    pc.setPonderacion(r);

                    PonderacioncaracteristicaFacade.edit(pc);

                }

            } else if (action.equals("preparedEditPonderarCara")) {
                sesion.setAttribute("listPonderacionCara", PonderacioncaracteristicaFacade.findByList("procesoId", proceso));
                String url = "/WEB-INF/vista/comitePrograma/ponderacion/editarpc.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editPonderarCara")) {

                List listCara = PonderacioncaracteristicaFacade.findByList("procesoId", proceso);

                Iterator i = listCara.iterator();

                while (i.hasNext()) {

                    Ponderacioncaracteristica pc = (Ponderacioncaracteristica) i.next();
                    Float importancia = Float.parseFloat(request.getParameter("importancia" + pc.getId()));
                    //Double ponderacion = Double.parseDouble(request.getParameter("ponderacion" + pc.getId()));
                    String justificacion = request.getParameter("justificacion" + pc.getId());

                    pc.setJustificacion(justificacion);
                    pc.setNivelimportancia(importancia);
                    //   pc.setPonderacion(ponderacion);

                    PonderacioncaracteristicaFacade.edit(pc);
                }

                List lpc = PonderacioncaracteristicaFacade.findByList("procesoId", proceso);

                i = lpc.iterator();

                while (i.hasNext()) {
                    Ponderacioncaracteristica pc = (Ponderacioncaracteristica) i.next();

                    double vi = pc.getNivelimportancia();

                    Factor f = pc.getCaracteristicaId().getFactorId();

                    Ponderacionfactor pf = ponderacionfactorFacade.findBySingle2("factorId", f, "procesoId", proceso);

                    List suma0 = f.getCaracteristicaList();

                    Iterator i1 = suma0.iterator();

                    double suma = 0;

                    while (i1.hasNext()) {
                        Caracteristica c = (Caracteristica) i1.next();
                        Ponderacioncaracteristica pc1 = PonderacioncaracteristicaFacade.findBySingle2("caracteristicaId", c, "procesoId", proceso);
                        suma += pc1.getNivelimportancia();
                        //  System.out.println("Factor Id: " + f.getCodigo());
                        //  System.out.println("Caracteristica Id: " + c.getCodigo());
                    }

                    //System.out.println("Suma: " + suma);
                    double a = (100 * vi) / suma;
                    double b = ((pf.getPonderacion() * a) / 100);

                    double r;

                    int decimalPlaces = 2;
                    BigDecimal bde = new BigDecimal(b);

// setScale is immutable
                    bde = bde.setScale(decimalPlaces, BigDecimal.ROUND_HALF_UP);
                    r = bde.doubleValue();

                    pc.setPonderacion(r);

                    PonderacioncaracteristicaFacade.edit(pc);

                }

            } else if (action.equals("listPonderacionCara")) {
                if (ponderacionfactorFacade.findByList("procesoId", proceso).isEmpty()) {
                    out.print(0);
                } else {
                    sesion.setAttribute("listPonderacionCara", PonderacioncaracteristicaFacade.findByList("procesoId", proceso));
                    out.print(1);
                }
            } else if (action.equals("listPonderacionCara2")) {
                String url = "/WEB-INF/vista/comitePrograma/ponderacion/listarpc.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("listarHallazgos")) {
                List<Hallazgo> ha = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "hallazgo");
                List<Hallazgo> forta = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "fortaleza");
                sesion.setAttribute("listHallazgos", ha);
                sesion.setAttribute("listFortalezas", forta);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/hallazgos/listar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("listarFortalezas")) {
                List<Hallazgo> ha = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "hallazgo");
                List<Hallazgo> forta = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "fortaleza");
                sesion.setAttribute("listHallazgos", ha);
                sesion.setAttribute("listFortalezas", forta);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/fortalezas/listar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("listarObjetivos")) {
                String id = request.getParameter("id");
                Hallazgo h = hallazgoFacade.find(Integer.parseInt(id));
                List<Objetivos> objetivos = objetivosFacade.findByList("hallazgoIdhallazgo", h);
                List<Hallazgo> forta = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "fortaleza");
                sesion.setAttribute("listObjetivos", objetivos);
                sesion.setAttribute("hallazgo", h);
                sesion.setAttribute("listFortalezas", forta);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/objetivos/listar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("listar2Objetivos")) {
                String id = request.getParameter("id");
                Hallazgo fortaleza = hallazgoFacade.find(Integer.parseInt(id));
                List<Objetivos> objetivos = objetivosFacade.findByList("hallazgoIdhallazgo", fortaleza);
                List<Hallazgo> halla = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "hallazgo");
                sesion.setAttribute("listObjetivos", objetivos);
                sesion.setAttribute("fortaleza", fortaleza);
                sesion.setAttribute("listHallazgos", halla);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/objetivos2/listar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("verMetas")) {
                String id = request.getParameter("id");
                Objetivos o = objetivosFacade.find(Integer.parseInt(id));
                List<Metas> metas = metasFacade.findByList("objetivosIdobjetivos", o);
                List<Hallazgo> forta = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "fortaleza");
                sesion.setAttribute("listMetas", metas);
                sesion.setAttribute("objetivo", o);
                sesion.setAttribute("listFortalezas", forta);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/metas/listar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("ver2Metas")) {
                String id = request.getParameter("id");
                Objetivos o = objetivosFacade.find(Integer.parseInt(id));
                List<Metas> metas = metasFacade.findByList("objetivosIdobjetivos", o);
                List<Hallazgo> halla = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "hallazgo");
                sesion.setAttribute("listMetas", metas);
                sesion.setAttribute("objetivo", o);
                sesion.setAttribute("listHallazgos", halla);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/metas2/listar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("listEncuestas")) {
                String url = "/WEB-INF/vista/comitePrograma/encuesta/listar.jsp";
                sesion.setAttribute("listaE2", encuestaFacade.findByModelo(modelo));
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("vistaPreviaPEncuesta")) {
                String idE = request.getParameter("id");
                Encuesta e = encuestaFacade.find(Integer.parseInt(idE));
                sesion.setAttribute("encuesta", e);
                String url = "/WEB-INF/vista/comitePrograma/encuesta/vistaPrevia.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("PM")) {
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/vistaPreviaPlan.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("PM2")) {
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/vistaPreviaPlan2.jsp";
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

                } else {
                    sesion.setAttribute("Muestra", m);
                    String url = "/WEB-INF/vista/comitePrograma/muestra/asignarMuestra.jsp";
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                }

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
                double aux = estudianteFacade.cantEstudiantesEntre3y9ByPrograma((Programa) programa);

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));
                }

                double cociente = n / N;

                for (int i = 3; i < 10; i++) {

                    int tamanioMuestra1 = 0;

                    int tamaniosem = estudianteFacade.countByProperty2("programaId", programa, "semestre", "0" + i);

                    tamanioMuestra1 = (int) Math.round(tamaniosem * cociente);

                    List<Estudiante> le = estudianteFacade.generarMuestraEst(programa, tamanioMuestra1, "semestre", "0" + i);

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
                            me.setProgramaId(programa);

                            muestraestudianteFacade.create(me);
                        }
                    }

                }

                //********************************Docente
                int tamanioMuestra = 0;
                Iterator it;
                aux = docenteFacade.countByProperty("programaId", programa);

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));

                    tamanioMuestra = (int) Math.floor(n);

                    List<Docente> ld = docenteFacade.generarMuestra(programa, tamanioMuestra);

                    it = ld.iterator();

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

                }

                //********************************Egresado
                aux = egresadoFacade.countByProperty("programaId", programa);

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));

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
                }

                //********************************Director
                aux = directorprogramaFacade.countByProperty("programaId", programa);

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));

                    tamanioMuestra = (int) Math.floor(n);

                    List<Directorprograma> ldp = directorprogramaFacade.generarMuestra(programa, tamanioMuestra);

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

                }

                //********************************Administrativo
                aux = administrativoFacade.countByProperty("programaId", programa);

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));

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

                }

                //********************************EMpleador
                aux = empleadorFacade.countByProperty("programaId", programa);

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));

                    tamanioMuestra = (int) Math.floor(n);

                    List<Empleador> lem = empleadorFacade.generarMuestra(programa, tamanioMuestra);

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
                }

                //********************************Agencia
                aux = agenciagubernamentalFacade.count();

                N = aux;

                if (N != 0.0) {
                    n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));

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
                }

            } else if (action.equals("selectorListMuestra")) {
                String fuente = "";

                if (request.getParameter("fuente") == null) {
                    fuente = (String) sesion.getAttribute("selectorFuente");
                } else {
                    fuente = request.getParameter("fuente");
                    sesion.setAttribute("selectorFuente", fuente);
                }

                Muestra m = (Muestra) sesion.getAttribute("Muestra");
                if (fuente.equals("Estudiante")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestraestudianteFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(1));
                    sesion.setAttribute("Semestre", "--");
                } else if (fuente.equals("Docente")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestradocenteFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(2));
                    List e = docenteFacade.findByPrograma((Programa) programa);
                    sesion.setAttribute("listPoblacion", e);
                    List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                    sesion.setAttribute("listEncabezado", le);
                } else if (fuente.equals("Egresado")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestraegresadoFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(4));
                    List e = egresadoFacade.findByPrograma((Programa) programa);
                    sesion.setAttribute("listPoblacion", e);
                    List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                    sesion.setAttribute("listEncabezado", le);

                } else if (fuente.equals("Administrativo")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestraadministrativoFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(3));
                    List e = administrativoFacade.findByPrograma((Programa) programa);
                    sesion.setAttribute("listPoblacion", e);
                    List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                    sesion.setAttribute("listEncabezado", le);
                } else if (fuente.equals("Directivo")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestradirectorFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(5));
                    List e = directorprogramaFacade.findByPrograma((Programa) programa);
                    sesion.setAttribute("listPoblacion", e);
                    List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                    sesion.setAttribute("listEncabezado", le);
                } else if (fuente.equals("Empleador")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestraempleadorFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(6));
                    List e = empleadorFacade.findByPrograma((Programa) programa);
                    sesion.setAttribute("listPoblacion", e);
                    List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                    sesion.setAttribute("listEncabezado", le);
                } else if (fuente.equals("Agencia")) {
                    sesion.setAttribute("listMuestraSeleccionada", muestraagenciaFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(7));
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

                Proceso p = (Proceso) proceso;

                if (!ponderacionfactorFacade.findByList("procesoId", p).isEmpty() && !PonderacioncaracteristicaFacade.findByList("procesoId", p).isEmpty() && !muestraFacade.findByList("procesoId", p).isEmpty()) {
                    java.util.Date date = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
                    String fecha = sdf.format(date);
                    p.setFechainicio(fecha);
                    p.setFechacierre("--");
                    procesoFacade.edit(p);
                    sesion.setAttribute("Proceso", p);
                    sesion.setAttribute("EstadoProceso", "2");
                    out.println(1);
                } else {
                    out.println(0);
                }
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
                            passwordGenerator.NUMEROS
                            + passwordGenerator.NUMEROS, 6);

                    String nombre = "Usuario";
                    String apellido = "Aleatorio";
                    String cedula = programa.getId() + proceso.getId() + " - ";
                    String mail = "correo@correo.com";

                    Muestrapersona mp1 = new Muestrapersona();
                    Persona per = new Persona();
                    String idx = "00" + programa.getId() + proceso.getId() + muestra.getId() + "-" + id;
                    mp1.setCedula(idx);
                    mp1.setNombre(nombre);
                    mp1.setApellido(apellido);
                    mp1.setPassword(pass);
                    mp1.setMail(mail);
                    mp1.setMuestraId((Muestra) sesion.getAttribute("Muestra"));

                    per.setId(idx);
                    per.setNombre(nombre);
                    per.setApellido(apellido);
                    per.setPassword(pass);
                    per.setMail(mail);
                    personaFacade.create(per);

                    muestrapersonaFacade.create(mp1);

                    String fuente = (String) sesion.getAttribute("selectorFuente");

                    if (fuente.equals("Estudiante")) {
                        Estudiante est = new Estudiante();
                        Fuente fuenteEst = fuenteFacade.find(1);
                        est.setFuenteId(fuenteEst);
                        est.setSemestre("03");
                        est.setPeriodo("2");
                        est.setAnio("2013");
                        est.setPersonaId(per);
                        est.setId(idx);
                        est.setProgramaId(programa);
                        estudianteFacade.create(est);

                        Muestra m = (Muestra) sesion.getAttribute("Muestra");

                        Muestraestudiante me1 = new Muestraestudiante();
                        me1.setCodigo(idx);
                        me1.setPeriodo("2");
                        me1.setProgramaId(programa);
                        me1.setSemestre("03");
                        me1.setAnio("2013");
                        me1.setMuestrapersonaId(mp1);
                        muestraestudianteFacade.create(me1);
                    } else if (fuente.equals("Docente")) {
                        Docente doc = new Docente();
                        Fuente fuenteDoc = fuenteFacade.find(2);
                        doc.setFuenteId(fuenteDoc);
                        doc.setTipo("--");
                        doc.setPersonaId(per);
                        doc.setProgramaId(programa);
                        docenteFacade.create(doc);

                        Muestra m = (Muestra) sesion.getAttribute("Muestra");

                        Muestradocente md1 = new Muestradocente();
                        md1.setTipo("--");
                        md1.setMuestrapersonaId(mp1);
                        muestradocenteFacade.create(md1);
                    } else if (fuente.equals("Egresado")) {
                        Egresado egre = new Egresado();
                        Fuente fuenteEgr = fuenteFacade.find(4);
                        egre.setFuenteId(fuenteEgr);
                        egre.setPersonaId(per);
                        egre.setProgramaId(programa);
                        egresadoFacade.create(egre);

                        Muestra m = (Muestra) sesion.getAttribute("Muestra");

                        Muestraegresado meg1 = new Muestraegresado();
                        meg1.setMuestrapersonaId(mp1);
                        muestraegresadoFacade.create(meg1);
                    } else if (fuente.equals("Administrativo")) {
                        Administrativo admin = new Administrativo();
                        Fuente fuenteAdmin = fuenteFacade.find(3);
                        admin.setFuenteId(fuenteAdmin);
                        admin.setPersonaId(per);
                        admin.setProgramaId(programa);
                        admin.setCargo("--");
                        administrativoFacade.create(admin);

                        Muestra m = (Muestra) sesion.getAttribute("Muestra");

                        Muestraadministrativo mad1 = new Muestraadministrativo();
                        mad1.setCargo("--");
                        mad1.setMuestrapersonaId(mp1);
                        muestraadministrativoFacade.create(mad1);
                    } else if (fuente.equals("Directivo")) {
                        Directorprograma dir = new Directorprograma();
                        Fuente fuenteDir = fuenteFacade.find(5);
                        dir.setFuenteId(fuenteDir);
                        dir.setPersonaId(per);
                        dir.setProgramaId(programa);
                        directorprogramaFacade.create(dir);

                        Muestra m = (Muestra) sesion.getAttribute("Muestra");

                        Muestradirector mdir1 = new Muestradirector();
                        mdir1.setMuestrapersonaId(mp1);
                        muestradirectorFacade.create(mdir1);
                    } else if (fuente.equals("Empleador")) {
                        Empleador emp = new Empleador();
                        Fuente fuenteEmp = fuenteFacade.find(6);
                        emp.setFuenteId(fuenteEmp);
                        emp.setPersonaId(per);
                        emp.setProgramaId(programa);
                        emp.setCargo("Representante");
                        emp.setEmpresa("Empresa Aleatoria");
                        empleadorFacade.create(emp);

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
                String fuente = (String) sesion.getAttribute("selectorFuente");
                if (fuente.equals("Estudiante")) {
                    List e = estudianteFacade.findByList2("programaId", programa, "semestre", sesion.getAttribute("Semestre"));
                    sesion.setAttribute("listPoblacion", e);
                    List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                    sesion.setAttribute("listEncabezado", le);
                } else {
                    if (fuente.equals("Docente")) {
                        Muestra m = (Muestra) sesion.getAttribute("Muestra");
                        sesion.setAttribute("listMuestraSeleccionada", muestradocenteFacade.findByList("muestrapersonaId.muestraId", m));
                        sesion.setAttribute("Fuente", fuenteFacade.find(2));
                        List d = docenteFacade.findByList("programaId", programa);
                        sesion.setAttribute("listPoblacion", d);
                        List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                        sesion.setAttribute("listEncabezado", le);
                    } else {
                        if (fuente.equals("Egresado")) {
                            Muestra m = (Muestra) sesion.getAttribute("Muestra");
                            sesion.setAttribute("listMuestraSeleccionada", muestraegresadoFacade.findByList("muestrapersonaId.muestraId", m));
                            sesion.setAttribute("Fuente", fuenteFacade.find(4));
                            List eg = egresadoFacade.findByList("programaId", programa);
                            sesion.setAttribute("listPoblacion", eg);
                            List leg = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                            sesion.setAttribute("listEncabezado", leg);
                        } else {
                            if (fuente.equals("Administrativo")) {
                                Muestra m = (Muestra) sesion.getAttribute("Muestra");
                                sesion.setAttribute("listMuestraSeleccionada", muestraadministrativoFacade.findByList("muestrapersonaId.muestraId", m));
                                sesion.setAttribute("Fuente", fuenteFacade.find(3));
                                List eg = administrativoFacade.findByList("programaId", programa);
                                sesion.setAttribute("listPoblacion", eg);
                                List leg = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                                sesion.setAttribute("listEncabezado", leg);
                            } else {
                                if (fuente.equals("Empleador")) {
                                    Muestra m = (Muestra) sesion.getAttribute("Muestra");
                                    sesion.setAttribute("listMuestraSeleccionada", muestraempleadorFacade.findByList("muestrapersonaId.muestraId", m));
                                    sesion.setAttribute("Fuente", fuenteFacade.find(6));
                                    List emp = empleadorFacade.findByList("programaId", programa);
                                    sesion.setAttribute("listPoblacion", emp);
                                    List lemp = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                                    sesion.setAttribute("listEncabezado", lemp);
                                } else {
                                    Muestra m = (Muestra) sesion.getAttribute("Muestra");
                                    sesion.setAttribute("listMuestraSeleccionada", muestradirectorFacade.findByList("muestrapersonaId.muestraId", m));
                                    sesion.setAttribute("Fuente", fuenteFacade.find(5));
                                    List dir = directorprogramaFacade.findByList("programaId", programa);
                                    sesion.setAttribute("listPoblacion", dir);
                                    List ldir = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                                    sesion.setAttribute("listEncabezado", ldir);
                                }
                            }
                        }
                    }

                }
                String url = "/WEB-INF/vista/comitePrograma/muestra/editarMuestra.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editarMuestra")) {
                String fuente = (String) sesion.getAttribute("selectorFuente");
                if (fuente.equals("Estudiante")) {
                    Collection nuevos = new ArrayList();
                    Collection viejos = new ArrayList();
                    List<Muestraestudiante> muestraEstudiantes = (List<Muestraestudiante>) sesion.getAttribute("listMuestraSeleccionada");
                    for (Muestraestudiante muestraestudiante : muestraEstudiantes) {
                        viejos.add(muestraestudiante.getMuestrapersonaId().getCedula());
                    }
                    Muestra m = (Muestra) sesion.getAttribute("Muestra");
                    List<Estudiante> le = estudianteFacade.findByList2("programaId", programa, "semestre", sesion.getAttribute("Semestre"));
                    for (Estudiante estudiante : le) {
                        if ("1".equals(request.getParameter(String.valueOf(estudiante.getPersonaId().getId())))) {
                            nuevos.add(estudiante.getPersonaId().getId());
                        }
                    }
                    Collection viejos2 = new ArrayList(viejos);
                    viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
                    nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

                    for (Object object : viejos) {
                        Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                        Muestraestudiante me = muestraestudianteFacade.findBySingle("muestrapersonaId", mp);
                        muestraestudianteFacade.remove(me);
                        muestrapersonaFacade.remove(mp);
                    }
                    for (Object object : nuevos) {
                        Estudiante est = estudianteFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                        Persona per = est.getPersonaId();

                        Muestrapersona mp = new Muestrapersona();
                        mp.setCedula(per.getId());
                        mp.setNombre(per.getNombre());
                        mp.setApellido(per.getApellido());
                        mp.setPassword(per.getPassword());
                        mp.setMail(per.getMail());
                        mp.setMuestraId(m);
                        muestrapersonaFacade.create(mp);
                        Muestraestudiante mest = new Muestraestudiante();
                        mest.setCodigo(est.getId());
                        mest.setSemestre(est.getSemestre());
                        mest.setPeriodo(est.getPeriodo());
                        mest.setAnio(est.getAnio());
                        mest.setMuestrapersonaId(mp);
                        mest.setProgramaId(est.getProgramaId());
                        muestraestudianteFacade.create(mest);
                    }

                } else {
                    if (fuente.equals("Docente")) {
                        Collection nuevos = new ArrayList();
                        Collection viejos = new ArrayList();
                        List<Muestradocente> muestraDocentes = (List<Muestradocente>) sesion.getAttribute("listMuestraSeleccionada");
                        for (Muestradocente muestradocente : muestraDocentes) {
                            viejos.add(muestradocente.getMuestrapersonaId().getCedula());
                        }
                        Muestra m = (Muestra) sesion.getAttribute("Muestra");
                        List<Docente> ld = docenteFacade.findByList("programaId", programa);
                        for (Docente docente : ld) {
                            if ("1".equals(request.getParameter(String.valueOf(docente.getPersonaId().getId())))) {
                                nuevos.add(docente.getPersonaId().getId());
                            }
                        }
                        Collection viejos2 = new ArrayList(viejos);
                        viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
                        nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

                        for (Object object : viejos) {
                            Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                            Muestradocente md = muestradocenteFacade.findBySingle("muestrapersonaId", mp);
                            muestradocenteFacade.remove(md);
                            muestrapersonaFacade.remove(mp);
                        }
                        for (Object object : nuevos) {
                            Docente doc = docenteFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                            Persona per = doc.getPersonaId();

                            Muestrapersona mp = new Muestrapersona();
                            mp.setCedula(per.getId());
                            mp.setNombre(per.getNombre());
                            mp.setApellido(per.getApellido());
                            mp.setPassword(per.getPassword());
                            mp.setMail(per.getMail());
                            mp.setMuestraId(m);
                            muestrapersonaFacade.create(mp);
                            Muestradocente mdoce = new Muestradocente();
                            mdoce.setTipo(doc.getTipo());
                            mdoce.setMuestrapersonaId(mp);
                            muestradocenteFacade.create(mdoce);
                        }
                    } else {
                        if (fuente.equals("Egresado")) {
                            Collection nuevos = new ArrayList();
                            Collection viejos = new ArrayList();
                            List<Muestraegresado> muestraAux = (List<Muestraegresado>) sesion.getAttribute("listMuestraSeleccionada");
                            for (Muestraegresado muestraegresado : muestraAux) {
                                viejos.add(muestraegresado.getMuestrapersonaId().getCedula());
                            }
                            Muestra m = (Muestra) sesion.getAttribute("Muestra");
                            List<Egresado> lax = egresadoFacade.findByList("programaId", programa);
                            for (Egresado egresado : lax) {
                                if ("1".equals(request.getParameter(String.valueOf(egresado.getPersonaId().getId())))) {
                                    nuevos.add(egresado.getPersonaId().getId());
                                }
                            }
                            Collection viejos2 = new ArrayList(viejos);
                            viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
                            nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

                            for (Object object : viejos) {
                                Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                                Muestraegresado maux = muestraegresadoFacade.findBySingle("muestrapersonaId", mp);
                                muestraegresadoFacade.remove(maux);
                                muestrapersonaFacade.remove(mp);
                            }
                            for (Object object : nuevos) {
                                Egresado egre = egresadoFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                                Persona per = egre.getPersonaId();

                                Muestrapersona mp = new Muestrapersona();
                                mp.setCedula(per.getId());
                                mp.setNombre(per.getNombre());
                                mp.setApellido(per.getApellido());
                                mp.setPassword(per.getPassword());
                                mp.setMail(per.getMail());
                                mp.setMuestraId(m);
                                muestrapersonaFacade.create(mp);
                                Muestraegresado megre = new Muestraegresado();
                                megre.setMuestrapersonaId(mp);
                                muestraegresadoFacade.create(megre);
                            }
                        } else {
                            if (fuente.equals("Administrativo")) {
                                Collection nuevos = new ArrayList();
                                Collection viejos = new ArrayList();
                                List<Muestraadministrativo> muestraAdministrativos = (List<Muestraadministrativo>) sesion.getAttribute("listMuestraSeleccionada");
                                for (Muestraadministrativo muestraadministrativo : muestraAdministrativos) {
                                    viejos.add(muestraadministrativo.getMuestrapersonaId().getCedula());
                                }
                                Muestra m = (Muestra) sesion.getAttribute("Muestra");
                                List<Administrativo> lad = administrativoFacade.findByList("programaId", programa);
                                for (Administrativo administrativo : lad) {
                                    if ("1".equals(request.getParameter(String.valueOf(administrativo.getPersonaId().getId())))) {
                                        nuevos.add(administrativo.getPersonaId().getId());
                                    }
                                }
                                Collection viejos2 = new ArrayList(viejos);
                                viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
                                nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

                                for (Object object : viejos) {
                                    Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                                    Muestraadministrativo mad = muestraadministrativoFacade.findBySingle("muestrapersonaId", mp);
                                    muestraadministrativoFacade.remove(mad);
                                    muestrapersonaFacade.remove(mp);
                                }
                                for (Object object : nuevos) {
                                    Administrativo admi = administrativoFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                                    Persona per = admi.getPersonaId();

                                    Muestrapersona mp = new Muestrapersona();
                                    mp.setCedula(per.getId());
                                    mp.setNombre(per.getNombre());
                                    mp.setApellido(per.getApellido());
                                    mp.setPassword(per.getPassword());
                                    mp.setMail(per.getMail());
                                    mp.setMuestraId(m);
                                    muestrapersonaFacade.create(mp);
                                    Muestraadministrativo madmi = new Muestraadministrativo();
                                    madmi.setCargo(admi.getCargo());
                                    madmi.setMuestrapersonaId(mp);
                                    muestraadministrativoFacade.create(madmi);
                                }
                            } else {
                                if (fuente.equals("Directivo")) {
                                    Collection nuevos = new ArrayList();
                                    Collection viejos = new ArrayList();
                                    List<Muestradirector> muestraDirec = (List<Muestradirector>) sesion.getAttribute("listMuestraSeleccionada");
                                    for (Muestradirector muestradirectivo : muestraDirec) {
                                        viejos.add(muestradirectivo.getMuestrapersonaId().getCedula());
                                    }
                                    Muestra m = (Muestra) sesion.getAttribute("Muestra");
                                    List<Directorprograma> ldire = directorprogramaFacade.findByList("programaId", programa);
                                    for (Directorprograma director : ldire) {
                                        if ("1".equals(request.getParameter(String.valueOf(director.getPersonaId().getId())))) {
                                            nuevos.add(director.getPersonaId().getId());
                                        }
                                    }
                                    Collection viejos2 = new ArrayList(viejos);
                                    viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
                                    nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

                                    for (Object object : viejos) {
                                        Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                                        Muestradirector mdire = muestradirectorFacade.findBySingle("muestrapersonaId", mp);
                                        muestradirectorFacade.remove(mdire);
                                        muestrapersonaFacade.remove(mp);
                                    }
                                    for (Object object : nuevos) {
                                        Directorprograma dir = directorprogramaFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                                        Persona per = dir.getPersonaId();

                                        Muestrapersona mp = new Muestrapersona();
                                        mp.setCedula(per.getId());
                                        mp.setNombre(per.getNombre());
                                        mp.setApellido(per.getApellido());
                                        mp.setPassword(per.getPassword());
                                        mp.setMail(per.getMail());
                                        mp.setMuestraId(m);
                                        muestrapersonaFacade.create(mp);
                                        Muestradirector mdir = new Muestradirector();
                                        mdir.setMuestrapersonaId(mp);
                                        muestradirectorFacade.create(mdir);
                                    }
                                } else {
                                    if (fuente.equals("Empleador")) {
                                        Collection nuevos = new ArrayList();
                                        Collection viejos = new ArrayList();
                                        List<Muestraempleador> muestraAux = (List<Muestraempleador>) sesion.getAttribute("listMuestraSeleccionada");
                                        for (Muestraempleador muestraempleador : muestraAux) {
                                            viejos.add(muestraempleador.getMuestrapersonaId().getCedula());
                                        }
                                        Muestra m = (Muestra) sesion.getAttribute("Muestra");
                                        List<Empleador> lax = empleadorFacade.findByList("programaId", programa);
                                        for (Empleador empleado : lax) {
                                            if ("1".equals(request.getParameter(String.valueOf(empleado.getPersonaId().getId())))) {
                                                nuevos.add(empleado.getPersonaId().getId());
                                            }
                                        }
                                        Collection viejos2 = new ArrayList(viejos);
                                        viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
                                        nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

                                        for (Object object : viejos) {
                                            Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                                            Muestraempleador maux = muestraempleadorFacade.findBySingle("muestrapersonaId", mp);
                                            muestraempleadorFacade.remove(maux);
                                            muestrapersonaFacade.remove(mp);
                                        }
                                        for (Object object : nuevos) {
                                            Empleador empl = empleadorFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                                            Persona per = empl.getPersonaId();

                                            Muestrapersona mp = new Muestrapersona();
                                            mp.setCedula(per.getId());
                                            mp.setNombre(per.getNombre());
                                            mp.setApellido(per.getApellido());
                                            mp.setPassword(per.getPassword());
                                            mp.setMail(per.getMail());
                                            mp.setMuestraId(m);
                                            muestrapersonaFacade.create(mp);
                                            Muestraempleador mempl = new Muestraempleador();
                                            mempl.setMuestrapersonaId(mp);
                                            mempl.setCargo(empl.getCargo());
                                            mempl.setEmpresa(empl.getEmpresa());
                                            muestraempleadorFacade.create(mempl);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                String url = "/WEB-INF/vista/comitePrograma/muestra/editarMuestra.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("selectorListSemestre")) {

                String semestre = request.getParameter("semestre"); //parametro que viene x post
                sesion.setAttribute("Semestre", semestre);

                Muestra m = (Muestra) sesion.getAttribute("Muestra");
                String fuente;

                if (request.getParameter("fuente") == null) {
                    fuente = (String) sesion.getAttribute("selectorFuente");
                } else {
                    fuente = request.getParameter("fuente");
                    sesion.setAttribute("selectorFuente", fuente);
                }
                if ("Estudiante".equals(fuente)) {
                    sesion.setAttribute("listMuestraSeleccionada", muestraestudianteFacade.findByList2("muestrapersonaId.muestraId", m, "semestre", semestre));
                    sesion.setAttribute("Fuente", fuenteFacade.find(1));
                    List e = estudianteFacade.findByList2("programaId", programa, "semestre", semestre);
                    sesion.setAttribute("listPoblacion", e);
                    List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                    sesion.setAttribute("listEncabezado", le);
                } else {
                    if ("Docente".equals(fuente)) {
                        sesion.setAttribute("listMuestraSeleccionada", muestradocenteFacade.findByList("muestrapersonaId.muestraId", m));
                    } else {
                        if ("Egresado".equals(fuente)) {
                            sesion.setAttribute("listMuestraSeleccionada", muestraegresadoFacade.findByList("muestrapersonaId.muestraId", m));
                        } else {
                            if ("Empleador".equals(fuente)) {
                                sesion.setAttribute("listMuestraSeleccionada", muestraempleadorFacade.findByList("muestrapersonaId.muestraId", m));
                            } else {
                                if ("Administrativo".equals(fuente)) {
                                    sesion.setAttribute("listMuestraSeleccionada", muestraadministrativoFacade.findByList("muestrapersonaId.muestraId", m));
                                }
                            }
                        }
                    }

                }

                String url = "/WEB-INF/vista/comitePrograma/muestra/selectorListMuestra.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("preparedInfoNumerica")) {
                Proceso p = (Proceso) proceso;
                Instrumento ins = instrumentoFacade.find(2);
                List<Numericadocumental> listaNum = numericadocumentalFacade.findByList2("procesoId", p, "instrumentoId", ins);
                Modelo m2 = (Modelo) modelo;
                List<Indicador> listInXmodelo = indicadorFacade.findByList("modeloId", m2);
                List<Indicador> indicadoresNum = new ArrayList<Indicador>();

                for (Indicador indicador : listInXmodelo) {
                    if (indicador.getInstrumentoList().contains(ins)) {
                        indicadoresNum.add(indicador);
                    }
                }
                sesion.setAttribute("lisrInidicadorsNum", indicadoresNum); // son todos los que son numericos
                sesion.setAttribute("listaNum", listaNum);//son la numerica documental que ya estan en la tabla calificados
                String url = "/WEB-INF/vista/comitePrograma/numericaDocumental/asignarInfoNumerica2.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("preparedInfoDocumental")) {
                Proceso p = (Proceso) proceso;
                Instrumento ins = instrumentoFacade.find(3);
                List<Numericadocumental> listaDoc = numericadocumentalFacade.findByList2("procesoId", p, "instrumentoId", ins);
                Modelo m2 = (Modelo) modelo;
                List<Indicador> listInXmodelo = indicadorFacade.findByList("modeloId", m2);
                List<Indicador> indicadoresDoc = new ArrayList<Indicador>();

                for (Indicador indicador : listInXmodelo) {
                    if (indicador.getInstrumentoList().contains(ins)) {
                        indicadoresDoc.add(indicador);
                    }
                }
                sesion.setAttribute("lisrInidicadorsDoc", indicadoresDoc); // son todos los que son documentales
                sesion.setAttribute("listaDoc", listaDoc);//son los que ya estan en la tabla calificados
                String url = "/WEB-INF/vista/comitePrograma/numericaDocumental/asignarInfoDocumental2.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("registrarInfoNumerica")) {
                String indicador = request.getParameter("indicador");
                String columna = request.getParameter("columna");
                String valor = request.getParameter("valor");

                Proceso p = (Proceso) proceso;
                Indicador aux = indicadorFacade.find(Integer.parseInt(indicador));
                Instrumento ins = instrumentoFacade.find(2);

                Numericadocumental infonumerica = numericadocumentalFacade.findBySingle3("procesoId", p, "indicadorId", aux, "instrumentoId", ins);

                if (infonumerica == null) {
                    Numericadocumental infonumerica3 = new Numericadocumental();
                    infonumerica3.setProcesoId(p);
                    infonumerica3.setIndicadorId(aux);
                    infonumerica3.setInstrumentoId(ins);

                    if (columna.equals("1")) {
                        infonumerica3.setDocumento(valor);
                    } else if (columna.equals("2")) {
                        infonumerica3.setResponsable(valor);
                    } else if (columna.equals("3")) {
                        infonumerica3.setMedio(valor);
                    } else if (columna.equals("4")) {
                        infonumerica3.setLugar(valor);
                    } else if (columna.equals("5")) {
                        infonumerica3.setEvaluacion(Integer.parseInt(valor));
                    } else if (columna.equals("6")) {
                        infonumerica3.setAccion(valor);
                    }
                    numericadocumentalFacade.create(infonumerica3);
                } else {
                    if (columna.equals("1")) {
                        infonumerica.setDocumento(valor);
                    } else if (columna.equals("2")) {
                        infonumerica.setResponsable(valor);
                    } else if (columna.equals("3")) {
                        infonumerica.setMedio(valor);
                    } else if (columna.equals("4")) {
                        infonumerica.setLugar(valor);
                    } else if (columna.equals("5")) {
                        infonumerica.setEvaluacion(Integer.parseInt(valor));
                    } else if (columna.equals("6")) {
                        infonumerica.setAccion(valor);
                    }
                    numericadocumentalFacade.edit(infonumerica);
                }
           } else if (action.equals("registrarInfoDocumental")) {
                String indicador = request.getParameter("indicador");
                String columna = request.getParameter("columna");
                String valor = request.getParameter("valor");

                Proceso p = (Proceso) proceso;
                Indicador aux = indicadorFacade.find(Integer.parseInt(indicador));
                Instrumento ins = instrumentoFacade.find(3);

                Numericadocumental infonumerica = numericadocumentalFacade.findBySingle3("procesoId", p, "indicadorId", aux, "instrumentoId", ins);

                if (infonumerica == null) {
                    Numericadocumental infonumerica3 = new Numericadocumental();
                    infonumerica3.setProcesoId(p);
                    infonumerica3.setIndicadorId(aux);
                    infonumerica3.setInstrumentoId(ins);

                    if (columna.equals("1")) {
                        infonumerica3.setDocumento(valor);
                    } else if (columna.equals("2")) {
                        infonumerica3.setResponsable(valor);
                    } else if (columna.equals("3")) {
                        infonumerica3.setMedio(valor);
                    } else if (columna.equals("4")) {
                        infonumerica3.setLugar(valor);
                    } else if (columna.equals("5")) {
                        infonumerica3.setEvaluacion(Integer.parseInt(valor));
                    } else if (columna.equals("6")) {
                        infonumerica3.setAccion(valor);
                    }
                    numericadocumentalFacade.create(infonumerica3);
                } else {
                    if (columna.equals("1")) {
                        infonumerica.setDocumento(valor);
                    } else if (columna.equals("2")) {
                        infonumerica.setResponsable(valor);
                    } else if (columna.equals("3")) {
                        infonumerica.setMedio(valor);
                    } else if (columna.equals("4")) {
                        infonumerica.setLugar(valor);
                    } else if (columna.equals("5")) {
                        infonumerica.setEvaluacion(Integer.parseInt(valor));
                    } else if (columna.equals("6")) {
                        infonumerica.setAccion(valor);
                    }
                    numericadocumentalFacade.edit(infonumerica);
                }
            } else if (action.equals("estadoProceso")) {
                Proceso p = (Proceso) proceso;
                Muestra m = p.getMuestraList().get(0);
                int totalMuestra = muestrapersonaFacade.countByProperty("muestraId", m);
                int totalEst = muestraestudianteFacade.countByProperty("muestrapersonaId.muestraId", m);
                int totalDoc = muestradocenteFacade.countByProperty("muestrapersonaId.muestraId", m);
                int totalEgr = muestraegresadoFacade.countByProperty("muestrapersonaId.muestraId", m);
                int totalAdm = muestraadministrativoFacade.countByProperty("muestrapersonaId.muestraId", m);
                int totalDir = muestradirectorFacade.countByProperty("muestrapersonaId.muestraId", m);
                int totalEmp = muestraempleadorFacade.countByProperty("muestrapersonaId.muestraId", m);

                List<Encabezado> encabezados = encabezadoFacade.findByList2("procesoId", m.getProcesoId(), "estado", "terminado");

                int terminados = encabezados.size();
                int terminadosEst = 0;
                int terminadosDoc = 0;
                int terminadosEgr = 0;
                int terminadosAdm = 0;
                int terminadosDir = 0;
                int terminadosEmp = 0;
                for (Encabezado encabezado : encabezados) {
                    if (encabezado.getFuenteId().getId() == 1) {
                        terminadosEst++;
                    } else if (encabezado.getFuenteId().getId() == 2) {
                        terminadosDoc++;
                    } else if (encabezado.getFuenteId().getId() == 3) {
                        terminadosAdm++;
                    } else if (encabezado.getFuenteId().getId() == 4) {
                        terminadosEgr++;
                    } else if (encabezado.getFuenteId().getId() == 5) {
                        terminadosDir++;
                    } else {
                        terminadosEmp++;
                    }
                }
                sesion.setAttribute("terminadosX", terminados);
                sesion.setAttribute("totalMuestraX", totalMuestra);
                sesion.setAttribute("totalEst", totalEst);
                sesion.setAttribute("terminadosEst", terminadosEst);
                sesion.setAttribute("totalDoc", totalDoc);
                sesion.setAttribute("terminadosDoc", terminadosDoc);
                sesion.setAttribute("totalEgr", totalEgr);
                sesion.setAttribute("terminadosEgr", terminadosEgr);
                sesion.setAttribute("totalEmp", totalEmp);
                sesion.setAttribute("terminadosEmp", terminadosEmp);
                sesion.setAttribute("totalAdm", totalAdm);
                sesion.setAttribute("terminadosAdm", terminadosAdm);
                sesion.setAttribute("totalDir", totalDir);
                sesion.setAttribute("terminadosDir", terminadosDir);
                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/estadoProceso.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("todosResultados")) {
                Proceso p = (Proceso) proceso;
                Modelo m = p.getModeloId();
                List<Indicador> indicadores = indicadorFacade.findByModeloYenOrden(m);

                double[] numerico = new double[indicadores.size()]; //numerica x indicador
                double[] documental = new double[indicadores.size()]; //documental x indicador
                double[] promedioE = new double[indicadores.size()]; //documental x indicador

                List<Factor> factores = factorFacade.findByModelo(m);
                List<Caracteristica> caracteristicas = caracteristicaFacade.findByModelo(m);

                List<Ponderacionfactor> ponderacionesF = new ArrayList<Ponderacionfactor>(); //ponderacion de los factores
                float cumplimientoF[] = new float[factores.size()];
                double ponderacionF[] = new double[factores.size()];

                float cumplimientoC[] = new float[caracteristicas.size()]; //cumplimiento x caracteristica
                double ponderacionC[] = new double[caracteristicas.size()]; //ponderacion x caracteristica
                float cumplimientoI[] = new float[indicadores.size()]; //cumplimiento indicadores

                float promedioPregunta = 0;
                float suma;
                float numP;

                List<List> PromedioPreguntasXindicador = new ArrayList<List>();
                List<List> PromedioPreguntasXindicadorEs = new ArrayList<List>();
                List<List> PromedioPreguntasXindicadorDo = new ArrayList<List>();
                List<List> PromedioPreguntasXindicadorAd = new ArrayList<List>();
                List<List> PromedioPreguntasXindicadorEg = new ArrayList<List>();
                List<List> PromedioPreguntasXindicadorDi = new ArrayList<List>();
                List<List> PromedioPreguntasXindicadorEm = new ArrayList<List>();

                int caracActual = indicadores.get(0).getCaracteristicaId().getId();
                int factorActual = indicadores.get(0).getCaracteristicaId().getFactorId().getId();
                double ponderacionCActual = ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(indicadores.get(0).getCaracteristicaId(), p).getPonderacion();
                float sumaPonC = 0;
                float sumaC = 0;
                float sumaI = 0;
                float numI = 0;

                float calificacionNum = 0;
                float calificacionDoc = 0;
                float promedioEstudiantes, promedioDocentes, promedioAdmin, promedioEgre, promedioDire, promedioEmpl;
                int numEst, numDoc, numAdmi, numEgr, numDire, numEmp;
                int indice = 0;
                int indiceCarac = 0;
                int indiceFactor = 0;
                float sumaPromediosXpregunta;
                for (Indicador in : indicadores) {
                    List promedioxPregunta = new ArrayList();
                    List promedioxPreguntaEs = new ArrayList();
                    List promedioxPreguntaDo = new ArrayList();
                    List promedioxPreguntaAd = new ArrayList();
                    List promedioxPreguntaEg = new ArrayList();
                    List promedioxPreguntaDi = new ArrayList();
                    List promedioxPreguntaEm = new ArrayList();
                    sumaPromediosXpregunta = 0;
                    suma = 0;
                    numP = 0;
                    calificacionNum = 0;
                    calificacionDoc = 0;
                    promedioPregunta = 0;
                    List<Instrumento> instr = in.getInstrumentoList();
                    for (int i = 0; i < instr.size(); i++) {
                        Instrumento instrumento = instr.get(i);
                        if (instrumento.getId() == 1) {
                            List<Pregunta> preguntas = in.getPreguntaList();
                            float promediorespuestas[] = new float[preguntas.size()];
                            int ceros[] = new int[preguntas.size()];
                            int unos[] = new int[preguntas.size()];
                            int dos[] = new int[preguntas.size()];
                            int tres[] = new int[preguntas.size()];
                            int cuatros[] = new int[preguntas.size()];
                            int cincos[] = new int[preguntas.size()];

                            for (int l = 0; l < preguntas.size(); l++) {
                                suma = 0;
                                int numR = 0;
                                Pregunta pregunta = preguntas.get(l);
                                promedioPregunta = 0;

                                List<Resultadoevaluacion> respuestas = pregunta.getResultadoevaluacionList();
                                List<Encuesta> encuestaPregunta = pregunta.getEncuestaList();
                                promedioEstudiantes = 0;
                                promedioDocentes = 0;
                                promedioAdmin = 0;
                                promedioEgre = 0;
                                promedioDire = 0;
                                promedioEmpl = 0;
                                numEst = 0;
                                numDoc = 0;
                                numAdmi = 0;
                                numEgr = 0;
                                numDire = 0;
                                numEmp = 0;
                                for (int n = 0; n < respuestas.size(); n++) {
                                    if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId()
                                            && respuestas.get(n).getRespuesta() != null && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2")
                                            || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))) {

                                        if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 1) {
                                            numEst++;
                                            promedioEstudiantes += Integer.parseInt(respuestas.get(n).getRespuesta());
                                        } else if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 2) {
                                            numDoc++;
                                            promedioDocentes += Integer.parseInt(respuestas.get(n).getRespuesta());
                                        } else if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 3) {
                                            numAdmi++;
                                            promedioAdmin += Integer.parseInt(respuestas.get(n).getRespuesta());
                                        } else if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 4) {
                                            numEgr++;
                                            promedioEgre += Integer.parseInt(respuestas.get(n).getRespuesta());
                                        } else if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 5) {
                                            numDire++;
                                            promedioDire += Integer.parseInt(respuestas.get(n).getRespuesta());
                                        } else if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 6) {
                                            numEmp++;
                                            promedioEmpl += Integer.parseInt(respuestas.get(n).getRespuesta());
                                        }

                                        suma += Integer.parseInt(respuestas.get(n).getRespuesta());
                                        numR++;
                                    }
                                }

                                float promedioXpregunta = suma / numR;
                                if (numEst != 0) {
                                    promedioEstudiantes /= numEst;
                                }
                                if (numDoc != 0) {
                                    promedioDocentes /= numDoc;
                                }
                                if (numAdmi != 0) {
                                    promedioAdmin /= numAdmi;
                                }
                                if (numEgr != 0) {
                                    promedioEgre /= numEgr;
                                }
                                if (numDire != 0) {
                                    promedioDire /= numDire;
                                }
                                if (numEmp != 0) {
                                    promedioEmpl /= numEmp;
                                }

                                sumaPromediosXpregunta += promedioXpregunta;
                                promedioxPregunta.add((Math.rint(promedioXpregunta * 10) / 10));
                                promedioxPreguntaEs.add((Math.rint(promedioEstudiantes * 10) / 10));
                                promedioxPreguntaDo.add((Math.rint(promedioDocentes * 10) / 10));
                                promedioxPreguntaAd.add((Math.rint(promedioAdmin * 10) / 10));
                                promedioxPreguntaEg.add((Math.rint(promedioEgre * 10) / 10));
                                promedioxPreguntaDi.add((Math.rint(promedioDire * 10) / 10));
                                promedioxPreguntaEm.add((Math.rint(promedioEmpl * 10) / 10));
                            }
                            if (suma > 0) {
                                promedioPregunta = (float) sumaPromediosXpregunta / preguntas.size();
                                //promediorespuestas[l] = (float) (Math.rint(promedioPregunta * 10) / 10);
                                promedioE[indice] = (double) (Math.rint(promedioPregunta * 10) / 10);
                            }
                        } else {
                            if (instrumento.getId() == 2) {
                                System.out.println("indicador: " + in.getId());
                                Numericadocumental numDoc1 = numericadocumentalFacade.findBySingle3("indicadorId", in, "procesoId", p, "instrumentoId", instrumento);
                                calificacionNum = numDoc1.getEvaluacion();
                                numerico[indice] = calificacionNum;

                            } else {
                                if (instrumento.getId() == 3) {
                                    System.out.println("indicador2: " + in.getId());
                                    Numericadocumental numDoc2 = numericadocumentalFacade.findBySingle3("indicadorId", in, "procesoId", p, "instrumentoId", instrumento);
                                    calificacionDoc = numDoc2.getEvaluacion();
                                    documental[indice] = calificacionDoc;

                                }
                            }
                        }
                    }
                    if (calificacionNum != 0 && calificacionDoc != 0 && promedioPregunta != 0) {
                        cumplimientoI[indice] = (promedioPregunta + calificacionNum + calificacionDoc) / 3;
                    } else {
                        if (calificacionNum != 0 && promedioPregunta != 0) {
                            cumplimientoI[indice] = (calificacionNum + promedioPregunta) / 2;
                        } else {
                            if (calificacionDoc != 0 && promedioPregunta != 0) {
                                cumplimientoI[indice] = (promedioPregunta + calificacionDoc) / 2;
                            } else {
                                if (calificacionDoc != 0 && calificacionNum != 0) {
                                    cumplimientoI[indice] = (calificacionNum + calificacionDoc) / 2;
                                } else {
                                    if (calificacionDoc != 0) {
                                        cumplimientoI[indice] = calificacionDoc;
                                    } else {
                                        if (calificacionNum != 0) {
                                            cumplimientoI[indice] = calificacionNum;
                                        } else {
                                            if (promedioPregunta != 0) {
                                                cumplimientoI[indice] = promedioPregunta;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    cumplimientoI[indice] = (float) (Math.rint(cumplimientoI[indice] * 10) / 10); //cumplimiento de cada indicador

                    if (in.getCaracteristicaId().getId() == caracActual) {
                        if (cumplimientoI[indice] != 0) {
                            numI++;//contamos los indicadores de una misma caracteristica
                            sumaI += cumplimientoI[indice];//sumamos los cumplimientos de los indicadores de una misma caracteristica
                        }

                    } else {
                        //cumplimiento de caracteristicas tomando en cuenta solo los indicadores antes del cambio

                        cumplimientoC[indiceCarac] = sumaI / numI;
                        cumplimientoC[indiceCarac] = (float) (Math.rint(cumplimientoC[indiceCarac] * 10) / 10);
                        sumaPonC += ponderacionCActual; //vamos sumando las ponderaciones de las caracteristicas hasta antes del cambio
                        sumaC += cumplimientoC[indiceCarac] * ponderacionCActual; //vamos sumando los cumplimientos de cada una de las caracteristicas

                        //cambiamos la ponderacion a la actual
                        ponderacionCActual = ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(indicadores.get(0).getCaracteristicaId(), p).getPonderacion();
                        ponderacionC[indiceCarac] = ponderacionCActual;
                        indiceCarac++; //acabamos de entrar a una nueva caracteristica
                        caracActual = in.getCaracteristicaId().getId();//sacamos el id de la caracteristica actual

                        sumaI = cumplimientoI[indice];//inicializamos la suma de cumplimientos xq acabamos de cambiar de caracteristica
                        numI = 1;//inicializamos en 1 el numero de indicadores
                    }

                    if (in.getCaracteristicaId().getFactorId().getId() != factorActual) {
                        if (sumaPonC != 0) {
                            cumplimientoF[indiceFactor] = sumaC / sumaPonC;//sacamos el cumplimiento del factor inmediatamente anterior
                            cumplimientoF[indiceFactor] = (float) (Math.rint(cumplimientoF[indiceFactor] * 10) / 10);
                        }
                        sumaPonC = 0;
                        sumaC = 0;
                        indiceFactor++;
                        factorActual = in.getCaracteristicaId().getFactorId().getId();//actualizamos el factor
                    }
                    indice++;
                    if (indice == indicadores.size()) {
                        cumplimientoC[indiceCarac] = sumaI / numI;  //cumplimiento de la ultima caracteristica
                        ponderacionCActual = ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(indicadores.get(0).getCaracteristicaId(), p).getPonderacion();
                        ponderacionC[indiceCarac] = ponderacionCActual;
                        sumaPonC += ponderacionCActual;
                        sumaC += cumplimientoC[indiceCarac] * ponderacionCActual;
                        if (sumaPonC != 0) {
                            cumplimientoF[indiceFactor] = sumaC / sumaPonC;//cumplimiento del ultimo factor
                            cumplimientoF[indiceFactor] = (float) (Math.rint(cumplimientoF[indiceFactor] * 10) / 10);
                        }
                    }
                    PromedioPreguntasXindicador.add(promedioxPregunta);
                    PromedioPreguntasXindicadorEs.add(promedioxPreguntaEs);
                    PromedioPreguntasXindicadorDo.add(promedioxPreguntaDo);
                    PromedioPreguntasXindicadorAd.add(promedioxPreguntaAd);
                    PromedioPreguntasXindicadorEg.add(promedioxPreguntaEg);
                    PromedioPreguntasXindicadorDi.add(promedioxPreguntaDi);
                    PromedioPreguntasXindicadorEm.add(promedioxPreguntaEm);
                }
                sesion.setAttribute("ponderacionesF", ponderacionesF);
                sesion.setAttribute("cumplimientoF", cumplimientoF);
                sesion.setAttribute("ponderacionesC", ponderacionC);
                sesion.setAttribute("cumplimientoC", cumplimientoC);
                sesion.setAttribute("cumplimientoI", cumplimientoI);
                sesion.setAttribute("listIndicadores", indicadores);
                sesion.setAttribute("promedioE", promedioE);
                sesion.setAttribute("PromedioPreguntasXindicadorEs", PromedioPreguntasXindicadorEs);
                sesion.setAttribute("PromedioPreguntasXindicadorDo", PromedioPreguntasXindicadorDo);
                sesion.setAttribute("PromedioPreguntasXindicadorAd", PromedioPreguntasXindicadorAd);
                sesion.setAttribute("PromedioPreguntasXindicadorEg", PromedioPreguntasXindicadorEg);
                sesion.setAttribute("PromedioPreguntasXindicadorDi", PromedioPreguntasXindicadorDi);
                sesion.setAttribute("PromedioPreguntasXindicadorEm", PromedioPreguntasXindicadorEm);
                sesion.setAttribute("PromedioPreguntasXindicador", PromedioPreguntasXindicador);

                sesion.setAttribute("numerico", numerico);
                sesion.setAttribute("documental", documental);

                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/resultados.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals(
                    "informeMatrizFactores")) {
                Proceso p = (Proceso) proceso;
                Modelo m = p.getModeloId();
                int suma;
                int numP;
                float sumaPon;
                float suma2;
                float promedioPregunta;
                float calificacionNum;
                float calificacionDoc;

                List<Ponderacionfactor> ponderacionesF = new ArrayList<Ponderacionfactor>();
                List<Factor> factores = m.getFactorList();
                float cumplimientoF[] = new float[factores.size()];
                for (int i2 = 0; i2 < factores.size(); i2++) {
                    suma2 = 0;
                    sumaPon = 0;
                    List<Ponderacioncaracteristica> ponderacionesC = new ArrayList<Ponderacioncaracteristica>();
                    List<Caracteristica> caracteristicas = factores.get(i2).getCaracteristicaList();
                    float cumplimientoC2[] = new float[caracteristicas.size()];
                    for (int j = 0; j < caracteristicas.size(); j++) {
                        List<Indicador> indicadores = caracteristicas.get(j).getIndicadorList();
                        float cumplimientoC[] = new float[indicadores.size()];
                        for (int k = 0; k < indicadores.size(); k++) {
                            promedioPregunta = 0;
                            suma = 0;
                            numP = 0;
                            calificacionNum = 0;
                            calificacionDoc = 0;
                            List<Instrumento> instr = indicadores.get(k).getInstrumentoList();
                            for (int i = 0; i < instr.size(); i++) {
                                Instrumento instrumento = instr.get(i);
                                if (instrumento.getId() == 1) {
                                    List<Pregunta> preguntas = indicadores.get(k).getPreguntaList();
                                    for (int l = 0; l < preguntas.size(); l++) {
                                        Pregunta pregunta = preguntas.get(l);
                                        List<Resultadoevaluacion> respuestas = pregunta.getResultadoevaluacionList();
                                        for (int n = 0; n < respuestas.size(); n++) {
                                            if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2") || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))) {
                                                numP++;
                                                suma += Integer.parseInt(respuestas.get(n).getRespuesta());
                                            }

                                        }
                                    }
                                    if (suma > 0) {
                                        promedioPregunta = (float) suma / numP;
                                    }

                                } else {
                                    if (instrumento.getId() == 2) {
                                        Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(k), "procesoId", p, "instrumentoId", instrumento);
                                        if (numDoc != null) {
                                            calificacionNum = (float) numDoc.getEvaluacion();
                                        }

                                    } else {
                                        if (instrumento.getId() == 3) {
                                            Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(k), "procesoId", p, "instrumentoId", instrumento);
                                            if (numDoc != null) {
                                                calificacionDoc = (float) numDoc.getEvaluacion();
                                            }

                                        }
                                    }
                                }
                            }
                            if (calificacionNum != 0 && calificacionDoc != 0 && promedioPregunta != 0) {
                                cumplimientoC[k] = (promedioPregunta + calificacionNum + calificacionDoc) / 3;
                            } else {
                                if (calificacionNum != 0 && promedioPregunta != 0) {
                                    cumplimientoC[k] = (calificacionNum + promedioPregunta) / 2;
                                } else {
                                    if (calificacionDoc != 0 && promedioPregunta != 0) {
                                        cumplimientoC[k] = (promedioPregunta + calificacionDoc) / 2;
                                    } else {
                                        if (calificacionDoc != 0 && calificacionNum != 0) {
                                            cumplimientoC[k] = (calificacionNum + calificacionDoc) / 2;
                                        } else {
                                            if (calificacionDoc != 0) {
                                                cumplimientoC[k] = calificacionDoc;
                                            } else {
                                                if (calificacionNum != 0) {
                                                    cumplimientoC[k] = calificacionNum;
                                                } else {
                                                    if (promedioPregunta != 0) {
                                                        cumplimientoC[k] = promedioPregunta;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        float sumaCumplimientoIndicadores = 0;
                        int califica2 = 0;
                        for (int i = 0; i < cumplimientoC.length; i++) {
                            if (cumplimientoC[i] > 0.0) {
                                sumaCumplimientoIndicadores += cumplimientoC[i];
                                califica2++;
                            }

                        }
                        if (sumaCumplimientoIndicadores > 0) {
                            cumplimientoC2[j] = (float) sumaCumplimientoIndicadores / califica2;
                        }

                        ponderacionesC.add(ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(caracteristicas.get(j), p));
                    }
                    for (int i = 0; i < factores.get(i2).getCaracteristicaList().size(); i++) {
                        if (cumplimientoC2[i] != 0) {
                            Ponderacioncaracteristica pc = ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(factores.get(i2).getCaracteristicaList().get(i), p);
                            sumaPon += pc.getPonderacion();
                            suma2 += cumplimientoC2[i] * pc.getPonderacion();
                        }
                    }
                    if (sumaPon != 0) {
                        ponderacionesF.add(ponderacionfactorFacade.findByFactorYProceso(factores.get(i2), p));
                        cumplimientoF[i2] = suma2 / sumaPon;
                        cumplimientoF[i2] = (float) (Math.rint(cumplimientoF[i2] * 10) / 10);
                    }

                }
                sesion.setAttribute("factores", factores);
                sesion.setAttribute("ponderacionesF", ponderacionesF);
                sesion.setAttribute("cumplimientoF", cumplimientoF);

                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/matrizFactores.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals(
                    "informeMatrizFactoresP")) {
                Proceso p = (Proceso) proceso;
                Modelo m = p.getModeloId();
                int suma;
                int numP;
                float sumaPon;
                float suma2;
                float promedioPregunta;
                float calificacionNum;
                float calificacionDoc;

                List<Ponderacionfactor> ponderacionesF = new ArrayList<Ponderacionfactor>();
                List<Factor> factores = m.getFactorList();
                float cumplimientoF[] = new float[factores.size()];
                for (int i2 = 0; i2 < factores.size(); i2++) {
                    suma2 = 0;
                    sumaPon = 0;
                    List<Ponderacioncaracteristica> ponderacionesC = new ArrayList<Ponderacioncaracteristica>();
                    List<Caracteristica> caracteristicas = factores.get(i2).getCaracteristicaList();
                    float cumplimientoC2[] = new float[caracteristicas.size()];
                    for (int j = 0; j < caracteristicas.size(); j++) {
                        List<Indicador> indicadores = caracteristicas.get(j).getIndicadorList();
                        float cumplimientoC[] = new float[indicadores.size()];
                        for (int k = 0; k < indicadores.size(); k++) {
                            promedioPregunta = 0;
                            suma = 0;
                            numP = 0;
                            calificacionNum = 0;
                            calificacionDoc = 0;
                            List<Instrumento> instr = indicadores.get(k).getInstrumentoList();
                            for (int i = 0; i < instr.size(); i++) {
                                Instrumento instrumento = instr.get(i);
                                if (instrumento.getId() == 1) {
                                    List<Pregunta> preguntas = indicadores.get(k).getPreguntaList();
                                    for (int l = 0; l < preguntas.size(); l++) {
                                        Pregunta pregunta = preguntas.get(l);
                                        List<Resultadoevaluacion> respuestas = pregunta.getResultadoevaluacionList();
                                        for (int n = 0; n < respuestas.size(); n++) {
                                            if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2") || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))) {
                                                numP++;
                                                suma += Integer.parseInt(respuestas.get(n).getRespuesta());
                                            }

                                        }
                                    }
                                    if (suma > 0) {
                                        promedioPregunta = (float) suma / numP;
                                    }

                                }
                            }
                            if (promedioPregunta != 0) {
                                cumplimientoC[k] = promedioPregunta;
                            }
                        }
                        float sumaCumplimientoIndicadores = 0;
                        int califica2 = 0;
                        for (int i = 0; i < cumplimientoC.length; i++) {
                            if (cumplimientoC[i] > 0.0) {
                                sumaCumplimientoIndicadores += cumplimientoC[i];
                                califica2++;
                            }

                        }
                        if (sumaCumplimientoIndicadores > 0) {
                            cumplimientoC2[j] = (float) sumaCumplimientoIndicadores / califica2;
                        }

                        ponderacionesC.add(ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(caracteristicas.get(j), p));
                    }
                    for (int i = 0; i < factores.get(i2).getCaracteristicaList().size(); i++) {
                        if (cumplimientoC2[i] != 0) {
                            Ponderacioncaracteristica pc = ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(factores.get(i2).getCaracteristicaList().get(i), p);
                            sumaPon += pc.getPonderacion();
                            suma2 += cumplimientoC2[i] * pc.getPonderacion();
                        }
                    }
                    if (sumaPon != 0) {
                        ponderacionesF.add(ponderacionfactorFacade.findByFactorYProceso(factores.get(i2), p));
                        cumplimientoF[i2] = suma2 / sumaPon;
                        cumplimientoF[i2] = (float) (Math.rint(cumplimientoF[i2] * 10) / 10);
                    }

                }
                sesion.setAttribute("factores", factores);
                sesion.setAttribute("ponderacionesF", ponderacionesF);
                sesion.setAttribute("cumplimientoF", cumplimientoF);

                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/matrizFactoresP.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals(
                    "informeMatrizCaracteristicas")) {
                Proceso p = (Proceso) proceso;
                Modelo m = p.getModeloId();
                int suma;
                int numP;
                float calificacionNum;
                float calificacionDoc;
                float promedioPregunta;
                List<Ponderacioncaracteristica> ponderacionesC = new ArrayList<Ponderacioncaracteristica>();
                List<Caracteristica> caracteristicas = m.getCaracteristicaList();
                float cumplimiento2[] = new float[caracteristicas.size()];
                for (int j = 0; j < caracteristicas.size(); j++) {
                    List<Indicador> indicadores = caracteristicas.get(j).getIndicadorList();
                    float cumplimiento[] = new float[indicadores.size()];
                    for (int k = 0; k < indicadores.size(); k++) {
                        promedioPregunta = 0;
                        suma = 0;
                        numP = 0;
                        calificacionNum = 0;
                        calificacionDoc = 0;
                        List<Instrumento> instr = indicadores.get(k).getInstrumentoList();
                        for (int i = 0; i < instr.size(); i++) {
                            Instrumento instrumento = instr.get(i);
                            if (instrumento.getId() == 1) {
                                List<Pregunta> preguntas = indicadores.get(k).getPreguntaList();
                                for (int l = 0; l < preguntas.size(); l++) {
                                    Pregunta pregunta = preguntas.get(l);
                                    List<Resultadoevaluacion> respuestas = pregunta.getResultadoevaluacionList();
                                    for (int n = 0; n < respuestas.size(); n++) {
                                        if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2") || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))) {
                                            numP++;
                                            suma += Integer.parseInt(respuestas.get(n).getRespuesta());
                                        }

                                    }
                                }
                                if (suma > 0) {
                                    promedioPregunta = (float) suma / numP;

                                }

                            } else {
                                if (instrumento.getId() == 2) {
                                    Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(k), "procesoId", p, "instrumentoId", instrumento);
                                    if (numDoc != null) {
                                        calificacionNum = (float) numDoc.getEvaluacion();
                                    }

                                } else {
                                    if (instrumento.getId() == 3) {
                                        Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(k), "procesoId", p, "instrumentoId", instrumento);
                                        if (numDoc != null) {
                                            calificacionDoc = (float) numDoc.getEvaluacion();
                                        }

                                    }
                                }
                            }
                        }
                        if (calificacionNum != 0 && calificacionDoc != 0 && promedioPregunta != 0) {
                            cumplimiento[k] = (promedioPregunta + calificacionNum + calificacionDoc) / 3;
                        } else {
                            if (calificacionNum != 0 && promedioPregunta != 0) {
                                cumplimiento[k] = (calificacionNum + promedioPregunta) / 2;
                            } else {
                                if (calificacionDoc != 0 && promedioPregunta != 0) {
                                    cumplimiento[k] = (promedioPregunta + calificacionDoc) / 2;
                                } else {
                                    if (calificacionDoc != 0 && calificacionNum != 0) {
                                        cumplimiento[k] = (calificacionNum + calificacionDoc) / 2;
                                    } else {
                                        if (calificacionDoc != 0) {
                                            cumplimiento[k] = calificacionDoc;
                                        } else {
                                            if (calificacionNum != 0) {
                                                cumplimiento[k] = calificacionNum;
                                            } else {
                                                if (promedioPregunta != 0) {
                                                    cumplimiento[k] = promedioPregunta;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    float sumaCumplimientoIndicadores = 0;
                    int califica2 = 0;
                    for (int i = 0; i < cumplimiento.length; i++) {
                        if (cumplimiento[i] > 0.0) {
                            sumaCumplimientoIndicadores += cumplimiento[i];
                            califica2++;
                        }
                    }
                    if (sumaCumplimientoIndicadores > 0) {
                        cumplimiento2[j] = sumaCumplimientoIndicadores / califica2;
                        cumplimiento2[j] = (float) (Math.rint(cumplimiento2[j] * 10) / 10);

                    }

                    ponderacionesC.add(ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(caracteristicas.get(j), p));

                }

                sesion.setAttribute("caracteristicas", caracteristicas);
                sesion.setAttribute("ponderacionesC", ponderacionesC);
                sesion.setAttribute("cumplimiento", cumplimiento2);

                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/matrizCaracteristicas.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals(
                    "informeMatrizCaracteristicasP")) {
                Proceso p = (Proceso) proceso;
                Modelo m = p.getModeloId();
                int suma;
                int numP;
                float calificacionNum;
                float calificacionDoc;
                float promedioPregunta;
                List<Ponderacioncaracteristica> ponderacionesC = new ArrayList<Ponderacioncaracteristica>();
                List<Caracteristica> caracteristicas = m.getCaracteristicaList();
                float cumplimiento2[] = new float[caracteristicas.size()];
                for (int j = 0; j < caracteristicas.size(); j++) {
                    List<Indicador> indicadores = caracteristicas.get(j).getIndicadorList();
                    float cumplimiento[] = new float[indicadores.size()];
                    for (int k = 0; k < indicadores.size(); k++) {
                        promedioPregunta = 0;
                        suma = 0;
                        numP = 0;
                        calificacionNum = 0;
                        calificacionDoc = 0;
                        List<Instrumento> instr = indicadores.get(k).getInstrumentoList();
                        for (int i = 0; i < instr.size(); i++) {
                            Instrumento instrumento = instr.get(i);
                            if (instrumento.getId() == 1) {
                                List<Pregunta> preguntas = indicadores.get(k).getPreguntaList();
                                for (int l = 0; l < preguntas.size(); l++) {
                                    Pregunta pregunta = preguntas.get(l);
                                    List<Resultadoevaluacion> respuestas = pregunta.getResultadoevaluacionList();
                                    for (int n = 0; n < respuestas.size(); n++) {
                                        if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2") || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))) {
                                            numP++;
                                            suma += Integer.parseInt(respuestas.get(n).getRespuesta());
                                        }

                                    }
                                }
                                if (suma > 0) {
                                    promedioPregunta = (float) suma / numP;

                                }

                            }
                        }
                        if (promedioPregunta != 0) {
                            cumplimiento[k] = promedioPregunta;
                        }
                    }
                    float sumaCumplimientoIndicadores = 0;
                    int califica2 = 0;
                    for (int i = 0; i < cumplimiento.length; i++) {
                        if (cumplimiento[i] > 0.0) {
                            sumaCumplimientoIndicadores += cumplimiento[i];
                            califica2++;
                        }
                    }
                    if (sumaCumplimientoIndicadores > 0) {
                        cumplimiento2[j] = sumaCumplimientoIndicadores / califica2;
                        cumplimiento2[j] = (float) (Math.rint(cumplimiento2[j] * 10) / 10);

                    }

                    ponderacionesC.add(ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(caracteristicas.get(j), p));

                }

                sesion.setAttribute("caracteristicas", caracteristicas);
                sesion.setAttribute("ponderacionesC", ponderacionesC);
                sesion.setAttribute("cumplimiento", cumplimiento2);

                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/matrizCaracteristicasP.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals(
                    "detalleFactor")) {
                Proceso p = (Proceso) proceso;
                String idFactor = request.getParameter("id");
                //Modelo m = p.getModeloId();
                int suma;
                int numP;
                float promedioPregunta;
                float calificacionNum;
                float calificacionDoc;
                Factor f = factorFacade.find(Integer.parseInt(idFactor));

                List<Ponderacioncaracteristica> ponderacionesC = new ArrayList<Ponderacioncaracteristica>();
                List<Caracteristica> caracteristicas = f.getCaracteristicaList();
                float cumplimiento2[] = new float[caracteristicas.size()];
                for (int j = 0; j < caracteristicas.size(); j++) {
                    List<Indicador> indicadores = caracteristicas.get(j).getIndicadorList();
                    float cumplimiento[] = new float[indicadores.size()];
                    for (int k = 0; k < indicadores.size(); k++) {
                        promedioPregunta = 0;
                        suma = 0;
                        numP = 0;
                        calificacionNum = 0;
                        calificacionDoc = 0;
                        List<Instrumento> instr = indicadores.get(k).getInstrumentoList();
                        for (int i = 0; i < instr.size(); i++) {
                            Instrumento instrumento = instr.get(i);
                            if (instrumento.getId() == 1) {
                                List<Pregunta> preguntas = indicadores.get(k).getPreguntaList();
                                for (int l = 0; l < preguntas.size(); l++) {
                                    Pregunta pregunta = preguntas.get(l);
                                    List<Resultadoevaluacion> respuestas = pregunta.getResultadoevaluacionList();
                                    for (int n = 0; n < respuestas.size(); n++) {
                                        if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2") || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))) {
                                            numP++;
                                            suma += Integer.parseInt(respuestas.get(n).getRespuesta());
                                        }

                                    }
                                }
                                if (suma > 0) {
                                    promedioPregunta = (float) suma / numP;
                                }

                            } else {
                                if (instrumento.getId() == 2) {
                                    Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(k), "procesoId", p, "instrumentoId", instrumento);
                                    if (numDoc != null) {
                                        calificacionNum = (float) numDoc.getEvaluacion();
                                    }

                                } else {
                                    if (instrumento.getId() == 3) {
                                        Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(k), "procesoId", p, "instrumentoId", instrumento);
                                        if (numDoc != null) {
                                            calificacionDoc = (float) numDoc.getEvaluacion();
                                        }
                                    }
                                }
                            }
                        }
                        if (calificacionNum != 0 && calificacionDoc != 0 && promedioPregunta != 0) {
                            cumplimiento[k] = (promedioPregunta + calificacionNum + calificacionDoc) / 3;
                        } else {
                            if (calificacionNum != 0 && promedioPregunta != 0) {
                                cumplimiento[k] = (calificacionNum + promedioPregunta) / 2;
                            } else {
                                if (calificacionDoc != 0 && promedioPregunta != 0) {
                                    cumplimiento[k] = (promedioPregunta + calificacionDoc) / 2;
                                } else {
                                    if (calificacionDoc != 0 && calificacionNum != 0) {
                                        cumplimiento[k] = (calificacionNum + calificacionDoc) / 2;
                                    } else {
                                        if (calificacionDoc != 0) {
                                            cumplimiento[k] = calificacionDoc;
                                        } else {
                                            if (calificacionNum != 0) {
                                                cumplimiento[k] = calificacionNum;
                                            } else {
                                                if (promedioPregunta != 0) {
                                                    cumplimiento[k] = promedioPregunta;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    float sumaCumplimientoIndicadores = 0;
                    int calificados = 0;
                    for (int i = 0; i < cumplimiento.length; i++) {
                        if (cumplimiento[i] > 0.0) {
                            sumaCumplimientoIndicadores += cumplimiento[i];
                            calificados++;
                        }
                    }
                    if (sumaCumplimientoIndicadores > 0) {
                        cumplimiento2[j] = (float) sumaCumplimientoIndicadores / calificados;
                        cumplimiento2[j] = (float) (Math.rint(cumplimiento2[j] * 10) / 10);
                    }

                    ponderacionesC.add(ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(caracteristicas.get(j), p));
                }

                sesion.setAttribute("factor", f);
                sesion.setAttribute("caracteristicasDF", caracteristicas);
                sesion.setAttribute("ponderacionesCDF", ponderacionesC);
                sesion.setAttribute("cumplimientoDF", cumplimiento2);

                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/detalleFactor.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals(
                    "detallePFactor")) {
                Proceso p = (Proceso) proceso;
                String idFactor = request.getParameter("id");
                //Modelo m = p.getModeloId();
                int suma;
                int numP;
                float promedioPregunta;
                float calificacionNum;
                float calificacionDoc;
                Factor f = factorFacade.find(Integer.parseInt(idFactor));

                List<Ponderacioncaracteristica> ponderacionesC = new ArrayList<Ponderacioncaracteristica>();
                List<Caracteristica> caracteristicas = f.getCaracteristicaList();
                float cumplimiento2[] = new float[caracteristicas.size()];
                for (int j = 0; j < caracteristicas.size(); j++) {
                    List<Indicador> indicadores = caracteristicas.get(j).getIndicadorList();
                    float cumplimiento[] = new float[indicadores.size()];
                    for (int k = 0; k < indicadores.size(); k++) {
                        promedioPregunta = 0;
                        suma = 0;
                        numP = 0;
                        calificacionNum = 0;
                        calificacionDoc = 0;
                        List<Instrumento> instr = indicadores.get(k).getInstrumentoList();
                        for (int i = 0; i < instr.size(); i++) {
                            Instrumento instrumento = instr.get(i);
                            if (instrumento.getId() == 1) {
                                List<Pregunta> preguntas = indicadores.get(k).getPreguntaList();
                                for (int l = 0; l < preguntas.size(); l++) {
                                    Pregunta pregunta = preguntas.get(l);
                                    List<Resultadoevaluacion> respuestas = pregunta.getResultadoevaluacionList();
                                    for (int n = 0; n < respuestas.size(); n++) {
                                        if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2") || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))) {
                                            numP++;
                                            suma += Integer.parseInt(respuestas.get(n).getRespuesta());
                                        }

                                    }
                                }
                                if (suma > 0) {
                                    promedioPregunta = (float) suma / numP;
                                }

                            }
                        }
                        if (promedioPregunta != 0) {
                            cumplimiento[k] = promedioPregunta;
                        }
                    }
                    float sumaCumplimientoIndicadores = 0;
                    int calificados = 0;
                    for (int i = 0; i < cumplimiento.length; i++) {
                        if (cumplimiento[i] > 0.0) {
                            sumaCumplimientoIndicadores += cumplimiento[i];
                            calificados++;
                        }
                    }
                    if (sumaCumplimientoIndicadores > 0) {
                        cumplimiento2[j] = (float) sumaCumplimientoIndicadores / calificados;
                        cumplimiento2[j] = (float) (Math.rint(cumplimiento2[j] * 10) / 10);
                    }

                    ponderacionesC.add(ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(caracteristicas.get(j), p));
                }

                sesion.setAttribute("factor", f);
                sesion.setAttribute("caracteristicasDF", caracteristicas);
                sesion.setAttribute("ponderacionesCDF", ponderacionesC);
                sesion.setAttribute("cumplimientoDF", cumplimiento2);

                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/detalleFactorP.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals(
                    "detalleCaracteristica")) {
                Proceso p = (Proceso) proceso;
                String idCaracteristica = request.getParameter("id");
                //Modelo m = p.getModeloId();
                int suma;
                int numP;
                float promedioPregunta;
                float calificacionNum;
                float calificacionDoc;
                Caracteristica c = caracteristicaFacade.find(Integer.parseInt(idCaracteristica));
                List<Indicador> indicadores = c.getIndicadorList();
                float cumplimiento[] = new float[indicadores.size()];
                for (int j = 0; j < indicadores.size(); j++) {
                    promedioPregunta = 0;
                    suma = 0;
                    numP = 0;
                    calificacionNum = 0;
                    calificacionDoc = 0;
                    List<Instrumento> instr = indicadores.get(j).getInstrumentoList();
                    for (int i = 0; i < instr.size(); i++) {
                        Instrumento instrumento = instr.get(i);
                        if (instrumento.getId() == 1) {
                            List<Pregunta> preguntas = indicadores.get(j).getPreguntaList();
                            for (int l = 0; l < preguntas.size(); l++) {
                                Pregunta pregunta = preguntas.get(l);
                                List<Resultadoevaluacion> respuestas = pregunta.getResultadoevaluacionList();
                                for (int n = 0; n < respuestas.size(); n++) {
                                    if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2") || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))) {
                                        numP++;
                                        suma += Integer.parseInt(respuestas.get(n).getRespuesta());
                                    }

                                }
                            }
                            if (suma > 0) {
                                promedioPregunta = (float) suma / numP;
                            }

                        } else {
                            if (instrumento.getId() == 2) {
                                Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(j), "procesoId", p, "instrumentoId", instrumento);
                                if (numDoc != null) {
                                    calificacionNum = (float) numDoc.getEvaluacion();
                                }
                            } else {
                                if (instrumento.getId() == 3) {
                                    Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(j), "procesoId", p, "instrumentoId", instrumento);
                                    if (numDoc != null) {
                                        calificacionDoc = (float) numDoc.getEvaluacion();
                                    }
                                }
                            }
                        }
                        if (calificacionNum != 0 && calificacionDoc != 0 && promedioPregunta != 0) {
                            cumplimiento[j] = (promedioPregunta + calificacionNum + calificacionDoc) / 3;
                        } else {
                            if (calificacionNum != 0 && promedioPregunta != 0) {
                                cumplimiento[j] = (calificacionNum + promedioPregunta) / 2;
                            } else {
                                if (calificacionDoc != 0 && promedioPregunta != 0) {
                                    cumplimiento[j] = (promedioPregunta + calificacionDoc) / 2;
                                } else {
                                    if (calificacionDoc != 0 && calificacionNum != 0) {
                                        cumplimiento[j] = (calificacionNum + calificacionDoc) / 2;
                                    } else {
                                        if (calificacionDoc != 0) {
                                            cumplimiento[j] = calificacionDoc;
                                        } else {
                                            if (calificacionNum != 0) {
                                                cumplimiento[j] = calificacionNum;
                                            } else {
                                                if (promedioPregunta != 0) {
                                                    cumplimiento[j] = promedioPregunta;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                    }

                    cumplimiento[j] = (float) (Math.rint(cumplimiento[j] * 10) / 10);

                }

                sesion.setAttribute("indicadores", indicadores);
                sesion.setAttribute("cumplimientoIN", cumplimiento);
                sesion.setAttribute("caracteristica", c);
                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/detalleCaracteristica.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals(
                    "detallePCaracteristica")) {
                Proceso p = (Proceso) proceso;
                String idCaracteristica = request.getParameter("id");
                //Modelo m = p.getModeloId();
                int suma;
                int numP;
                float promedioPregunta;
                float calificacionNum;
                float calificacionDoc;
                Caracteristica c = caracteristicaFacade.find(Integer.parseInt(idCaracteristica));
                List<Indicador> indicadores = c.getIndicadorList();
                float cumplimiento[] = new float[indicadores.size()];
                for (int j = 0; j < indicadores.size(); j++) {
                    promedioPregunta = 0;
                    suma = 0;
                    numP = 0;
                    calificacionNum = 0;
                    calificacionDoc = 0;
                    List<Instrumento> instr = indicadores.get(j).getInstrumentoList();
                    for (int i = 0; i < instr.size(); i++) {
                        Instrumento instrumento = instr.get(i);
                        if (instrumento.getId() == 1) {
                            List<Pregunta> preguntas = indicadores.get(j).getPreguntaList();
                            for (int l = 0; l < preguntas.size(); l++) {
                                Pregunta pregunta = preguntas.get(l);
                                List<Resultadoevaluacion> respuestas = pregunta.getResultadoevaluacionList();
                                for (int n = 0; n < respuestas.size(); n++) {
                                    if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2") || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))) {
                                        numP++;
                                        suma += Integer.parseInt(respuestas.get(n).getRespuesta());
                                    }

                                }
                            }
                            if (suma > 0) {
                                promedioPregunta = (float) suma / numP;
                            }

                        }
                        if (promedioPregunta != 0) {
                            cumplimiento[j] = promedioPregunta;
                        }

                    }

                    cumplimiento[j] = (float) (Math.rint(cumplimiento[j] * 10) / 10);

                }

                sesion.setAttribute("indicadores", indicadores);
                sesion.setAttribute("cumplimientoIN", cumplimiento);
                sesion.setAttribute("caracteristica", c);
                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/detalleCaracteristicaP.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("detalleIndicador")) {
                sesion.setAttribute("numerico", null);
                sesion.setAttribute("documental", null);
                float promedioPregunta;
                float suma;
                float numP;
                Proceso p = (Proceso) proceso;
                String idIndicador = request.getParameter("id");
                Indicador in = indicadorFacade.find(Integer.parseInt(idIndicador));
                List<Instrumento> instr = in.getInstrumentoList();
                for (int i = 0; i < instr.size(); i++) {
                    Instrumento instrumento = instr.get(i);
                    if (instrumento.getId() == 1) {
                        List<Pregunta> preguntas = in.getPreguntaList();
                        float promediorespuestas[] = new float[preguntas.size()];
                        int ceros[] = new int[preguntas.size()];
                        int unos[] = new int[preguntas.size()];
                        int dos[] = new int[preguntas.size()];
                        int tres[] = new int[preguntas.size()];
                        int cuatros[] = new int[preguntas.size()];
                        int cincos[] = new int[preguntas.size()];

                        for (int l = 0; l < preguntas.size(); l++) {
                            Pregunta pregunta = preguntas.get(l);
                            promedioPregunta = 0;
                            suma = 0;
                            numP = 0;
                            List<Resultadoevaluacion> respuestas = pregunta.getResultadoevaluacionList();
                            for (int n = 0; n < respuestas.size(); n++) {
                                if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2") || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))) {
                                    if (respuestas.get(n).getRespuesta().equals("1")) {
                                        unos[l]++;
                                    }
                                    if (respuestas.get(n).getRespuesta().equals("2")) {
                                        dos[l]++;
                                    }
                                    if (respuestas.get(n).getRespuesta().equals("3")) {
                                        tres[l]++;
                                    }
                                    if (respuestas.get(n).getRespuesta().equals("4")) {
                                        cuatros[l]++;
                                    }
                                    if (respuestas.get(n).getRespuesta().equals("5")) {
                                        cincos[l]++;
                                    }
                                    suma += Integer.parseInt(respuestas.get(n).getRespuesta());
                                    numP++;
                                } else {
                                    if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && respuestas.get(n).getRespuesta().equals("0")) {
                                        ceros[l]++;
                                    }

                                }
                                if (suma > 0) {
                                    promedioPregunta = (float) suma / numP;
                                    promediorespuestas[l] = (float) (Math.rint(promedioPregunta * 10) / 10);

                                }
                            }
                        }

                        sesion.setAttribute("promediorepuestas", promediorespuestas);
                        sesion.setAttribute("ceros", ceros);
                        sesion.setAttribute("unos", unos);
                        sesion.setAttribute("dos", dos);
                        sesion.setAttribute("tres", tres);
                        sesion.setAttribute("cuatros", cuatros);
                        sesion.setAttribute("cincos", cincos);
                    } else {
                        if (instrumento.getId() == 2) {
                            Numericadocumental numDoc1 = numericadocumentalFacade.findBySingle3("indicadorId", in, "procesoId", p, "instrumentoId", instrumento);
                            sesion.setAttribute("numerico", numDoc1);

                        } else {
                            if (instrumento.getId() == 3) {
                                Numericadocumental numDoc2 = numericadocumentalFacade.findBySingle3("indicadorId", in, "procesoId", p, "instrumentoId", instrumento);
                                sesion.setAttribute("documental", numDoc2);

                            }
                        }
                    }
                }
                sesion.setAttribute("indicador", in);

                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/detalleIndicador.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("detallePIndicador")) {
                sesion.setAttribute("numerico", null);
                sesion.setAttribute("documental", null);
                float promedioPregunta;
                float suma;
                float numP;
                Proceso p = (Proceso) proceso;
                String idIndicador = request.getParameter("id");
                Indicador in = indicadorFacade.find(Integer.parseInt(idIndicador));
                List<Instrumento> instr = in.getInstrumentoList();
                for (int i = 0; i < instr.size(); i++) {
                    Instrumento instrumento = instr.get(i);
                    if (instrumento.getId() == 1) {
                        List<Pregunta> preguntas = in.getPreguntaList();
                        float promediorespuestas[] = new float[preguntas.size()];
                        int ceros[] = new int[preguntas.size()];
                        int unos[] = new int[preguntas.size()];
                        int dos[] = new int[preguntas.size()];
                        int tres[] = new int[preguntas.size()];
                        int cuatros[] = new int[preguntas.size()];
                        int cincos[] = new int[preguntas.size()];

                        for (int l = 0; l < preguntas.size(); l++) {
                            Pregunta pregunta = preguntas.get(l);
                            promedioPregunta = 0;
                            suma = 0;
                            numP = 0;
                            List<Resultadoevaluacion> respuestas = pregunta.getResultadoevaluacionList();
                            for (int n = 0; n < respuestas.size(); n++) {
                                if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2") || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))) {
                                    if (respuestas.get(n).getRespuesta().equals("1")) {
                                        unos[l]++;
                                    }
                                    if (respuestas.get(n).getRespuesta().equals("2")) {
                                        dos[l]++;
                                    }
                                    if (respuestas.get(n).getRespuesta().equals("3")) {
                                        tres[l]++;
                                    }
                                    if (respuestas.get(n).getRespuesta().equals("4")) {
                                        cuatros[l]++;
                                    }
                                    if (respuestas.get(n).getRespuesta().equals("5")) {
                                        cincos[l]++;
                                    }
                                    suma += Integer.parseInt(respuestas.get(n).getRespuesta());
                                    numP++;
                                } else {
                                    if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && respuestas.get(n).getRespuesta().equals("0")) {
                                        ceros[l]++;
                                    }

                                }
                                if (suma > 0) {
                                    promedioPregunta = (float) suma / numP;
                                    promediorespuestas[l] = (float) (Math.rint(promedioPregunta * 10) / 10);

                                }
                            }
                        }

                        sesion.setAttribute("promediorepuestas", promediorespuestas);
                        sesion.setAttribute("ceros", ceros);
                        sesion.setAttribute("unos", unos);
                        sesion.setAttribute("dos", dos);
                        sesion.setAttribute("tres", tres);
                        sesion.setAttribute("cuatros", cuatros);
                        sesion.setAttribute("cincos", cincos);
                    }
                }
                sesion.setAttribute("indicador", in);

                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/detalleIndicadorP.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals(
                    "detallePregunta")) {
                sesion.setAttribute("numerico", null);
                sesion.setAttribute("documental", null);
                float promedioPregunta;
                float suma;
                float numP;
                Proceso p = (Proceso) proceso;
                String idPregunta = request.getParameter("id");
                Pregunta pre = preguntaFacade.find(Integer.parseInt(idPregunta));

                List<Encuesta> encuestas = pre.getEncuestaList();
                float promediorespuestas[] = new float[encuestas.size()];

                int ceros[] = new int[encuestas.size()];
                int unos[] = new int[encuestas.size()];
                int dos[] = new int[encuestas.size()];
                int tres[] = new int[encuestas.size()];
                int cuatros[] = new int[encuestas.size()];
                int cincos[] = new int[encuestas.size()];

                for (int l = 0; l < encuestas.size(); l++) {
                    promedioPregunta = 0;
                    suma = 0;
                    numP = 0;
                    List<Resultadoevaluacion> respuestas = pre.getResultadoevaluacionList();
                    for (int n = 0; n < respuestas.size(); n++) {
                        if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado")
                                && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId()
                                && respuestas.get(n).getRespuesta() != null
                                && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2") || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))
                                && respuestas.get(n).getEncabezadoId().getEncuestaId().getId() == encuestas.get(l).getId()) {
                            if (respuestas.get(n).getRespuesta().equals("1")) {
                                unos[l]++;
                            }
                            if (respuestas.get(n).getRespuesta().equals("2")) {
                                dos[l]++;
                            }
                            if (respuestas.get(n).getRespuesta().equals("3")) {
                                tres[l]++;
                            }
                            if (respuestas.get(n).getRespuesta().equals("4")) {
                                cuatros[l]++;
                            }
                            if (respuestas.get(n).getRespuesta().equals("5")) {
                                cincos[l]++;
                            }
                            suma += Integer.parseInt(respuestas.get(n).getRespuesta());
                            numP++;
                        } else {
                            if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == p.getId() && respuestas.get(n).getRespuesta() != null && respuestas.get(n).getRespuesta().equals("0")) {
                                ceros[l]++;
                            }

                        }
                        if (suma > 0) {
                            promedioPregunta = (float) suma / numP;
                            promediorespuestas[l] = (float) (Math.rint(promedioPregunta * 10) / 10);

                        }
                    }
                }
                sesion.setAttribute("promediorepuestasE", promediorespuestas);
                sesion.setAttribute("cerosE", ceros);
                sesion.setAttribute("unosE", unos);
                sesion.setAttribute("dosE", dos);
                sesion.setAttribute("tresE", tres);
                sesion.setAttribute("cuatrosE", cuatros);
                sesion.setAttribute("cincosE", cincos);
                sesion.setAttribute("pregunta", pre);
                sesion.setAttribute("encuestas", encuestas);

                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/detallePregunta.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("listarEvaluarDoc")) {
                Proceso pro = (Proceso) proceso;
                List<Numericadocumental> listaDoc = numericadocumentalFacade.findByList2("procesoId", pro, "instrumentoId", instrumentoFacade.find(3));
                sesion.setAttribute("listaDoc", listaDoc);
                String url = "/WEB-INF/vista/comitePrograma/numericaDocumental/listarInfoDocumental.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("listarEvaluarNum")) {
                Proceso pro = (Proceso) proceso;
                List<Numericadocumental> listaNum = numericadocumentalFacade.findByList2("procesoId", pro, "instrumentoId", instrumentoFacade.find(2));
                sesion.setAttribute("listaNum", listaNum);
                String url = "/WEB-INF/vista/comitePrograma/numericaDocumental/listarInfoNumerica.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals(
                    "cerrarPreguntas")) {
                sesion.setAttribute("acerrar", null);
                List<Resultadoevaluacion> acerrar = new ArrayList<Resultadoevaluacion>();
                Proceso pro = (Proceso) proceso;
                acerrar = resultadoevaluacionFacade.findPreguntasCerrarDesdeResultado(pro);
                /*List<Encabezado> encabezados = encabezadoFacade.findByList2("estado", "terminado", "procesoId", pro);
                 for (Encabezado encabezado : encabezados) {
                 List<Resultadoevaluacion> resultados = resultadoevaluacionFacade.findByList("encabezadoId", encabezado);
                 for (Resultadoevaluacion resultadoevaluacion : resultados) {
                 if (resultadoevaluacion.getPreguntaId().getTipo().equals("2")) {
                 acerrar.add(resultadoevaluacion);
                 }
                 }
                 }*/

                sesion.setAttribute("acerrar", acerrar);
                String url = "/WEB-INF/vista/comitePrograma/proceso/cerrarPregunta.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals(
                    "cerrarP")) {
                List<Resultadoevaluacion> acerrar = (List<Resultadoevaluacion>) sesion.getAttribute("acerrar");
                for (Resultadoevaluacion resultadoevaluacion : acerrar) {
                    String cambio = request.getParameter("InfoCambio" + resultadoevaluacion.getId());
                    if (cambio.equals("1")) {
                        String calificacion = request.getParameter("resultado" + resultadoevaluacion.getId());
                        resultadoevaluacion.setRespuesta(calificacion);
                        resultadoevaluacionFacade.edit(resultadoevaluacion);
                    }
                }
            } else if (action.contains("encuestaAleatoria") || action.contains("encuestaXaleatoria")) {
                String idFuente = request.getParameter("id");
                int idf = Integer.parseInt(idFuente);
                Proceso pro = (Proceso) proceso;
                Modelo m = pro.getModeloId();
                int indiceEncuesta;
                int indiceEncabezado;
                Encuesta en = null;
                if (idFuente != null && !idFuente.equals("")) {
                    List<Asignacionencuesta> asignacionEncuesta = m.getAsignacionencuestaList();
                    for (int i = 0; i < asignacionEncuesta.size(); i++) {
                        if (asignacionEncuesta.get(i).getFuenteId().getId() == idf) {
                            en = asignacionEncuesta.get(i).getEncuestaId();
                            break;
                        }
                    }
                    sesion.setAttribute("encuesta", en);
                    List<Encabezado> encabezados = encabezadoFacade.findByList3("procesoId", pro, "encuestaId", en, "estado", "terminado");
                    Random generador2 = new Random();
                    if (encabezados.size() > 0) {
                        indiceEncabezado = generador2.nextInt(encabezados.size());
                        List<Resultadoevaluacion> resultados = resultadoevaluacionFacade.findByList("encabezadoId", encabezados.get(indiceEncabezado));
                        sesion.setAttribute("resultados", resultados);
                    }
                } else {
                    List<Encuesta> encuestas = m.getEncuestaList();

                    boolean busca = true;
                    int limite = 0;
                    while (busca && limite < 20) {
                        Random generador = new Random();
                        indiceEncuesta = generador.nextInt(encuestas.size());
                        en = encuestas.get(indiceEncuesta);
                        sesion.setAttribute("encuesta", en);
                        List<Encabezado> encabezados = encabezadoFacade.findByList3("procesoId", pro, "encuestaId", en, "estado", "terminado");
                        Random generador2 = new Random();
                        if (encabezados.size() > 0) {
                            indiceEncabezado = generador2.nextInt(encabezados.size());
                            List<Resultadoevaluacion> resultados = resultadoevaluacionFacade.findByList("encabezadoId", encabezados.get(indiceEncabezado));
                            sesion.setAttribute("resultados", resultados);
                            busca = false;
                        }
                        limite++;
                    }
                }
                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/encuestaAleatoria.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);

            } else if (action.equals("crearProyectoEstrategico")) {
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/estrategico/crear.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("comentarios")) {
                String url = "/WEB-INF/vista/comitePrograma/proceso/informe/comentarios.jsp";
                Proceso pro = (Proceso) proceso;
                Fuente est = fuenteFacade.find(1);
                Fuente doc = fuenteFacade.find(2);
                Fuente admi = fuenteFacade.find(3);
                Fuente egr = fuenteFacade.find(4);
                Fuente dir = fuenteFacade.find(5);
                Fuente emp = fuenteFacade.find(6);

                List<Encabezado> estudiantes = encabezadoFacade.findByComentarios(est, pro);
                List<Encabezado> docentes = encabezadoFacade.findByComentarios(doc, pro);
                List<Encabezado> administrativos = encabezadoFacade.findByComentarios(admi, pro);
                List<Encabezado> egresados = encabezadoFacade.findByComentarios(egr, pro);
                List<Encabezado> directores = encabezadoFacade.findByComentarios(dir, pro);
                List<Encabezado> empleadores = encabezadoFacade.findByComentarios(emp, pro);

                sesion.setAttribute("estudiantes", estudiantes);
                sesion.setAttribute("docentes", docentes);
                sesion.setAttribute("administrativos", administrativos);
                sesion.setAttribute("egresados", egresados);
                sesion.setAttribute("directores", directores);
                sesion.setAttribute("empleadores", empleadores);

                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editarHallazgo")) {
                String id = request.getParameter("id");
                Hallazgo h = hallazgoFacade.find(Integer.parseInt(id));
                sesion.setAttribute("hallazgo", h);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/hallazgos/editar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editarFortaleza")) {
                String id = request.getParameter("id");
                Hallazgo h = hallazgoFacade.find(Integer.parseInt(id));
                sesion.setAttribute("hallazgo", h);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/fortalezas/editar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editarObjetivo")) {
                String id = request.getParameter("id");
                Objetivos o = objetivosFacade.find(Integer.parseInt(id));
                sesion.setAttribute("objetivo", o);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/objetivos/editar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editar2Objetivo")) {
                String id = request.getParameter("id");
                Objetivos o = objetivosFacade.find(Integer.parseInt(id));
                sesion.setAttribute("objetivo", o);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/objetivos2/editar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editarMeta")) {
                String id = request.getParameter("id");
                Metas m = metasFacade.find(Integer.parseInt(id));
                sesion.setAttribute("meta", m);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/metas/editar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editar2Meta")) {
                String id = request.getParameter("id");
                Metas m = metasFacade.find(Integer.parseInt(id));
                sesion.setAttribute("meta", m);
                String url = "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/metas2/editar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("editarHallazgo2")) {
                Hallazgo h = (Hallazgo) sesion.getAttribute("hallazgo");
                String hallazgo = (String) request.getParameter("hallazgo");
                String caracteristica = (String) request.getParameter("caracteristica");
                int idCar = Integer.parseInt(caracteristica);
                Caracteristica c = caracteristicaFacade.find(idCar);

                h.setHallazgo(hallazgo);
                if (idCar != h.getCaracteristicaId().getId()) {
                    h.setCaracteristicaId(c);
                }
                hallazgoFacade.edit(h);
            } else if (action.equals("editarFortaleza2")) {
                Hallazgo h = (Hallazgo) sesion.getAttribute("hallazgo");
                String hallazgo = (String) request.getParameter("hallazgo");
                String caracteristica = (String) request.getParameter("caracteristica");
                int idCar = Integer.parseInt(caracteristica);
                Caracteristica c = caracteristicaFacade.find(idCar);

                h.setHallazgo(hallazgo);
                if (idCar != h.getCaracteristicaId().getId()) {
                    h.setCaracteristicaId(c);
                }
                hallazgoFacade.edit(h);
            } else if (action.equals("editarObjetivo2")) {
                Objetivos o = (Objetivos) sesion.getAttribute("objetivo");
                String objetivo = (String) request.getParameter("objetivo");
                o.setObjetivo(objetivo);
                objetivosFacade.edit(o);
            } else if (action.equals("editar2Objetivo2")) {
                Objetivos o = (Objetivos) sesion.getAttribute("objetivo");
                String objetivo = (String) request.getParameter("objetivo");
                o.setObjetivo(objetivo);
                objetivosFacade.edit(o);

            } else {
                if (action.equals("contrasena")) {
                    String url = "/WEB-INF/vista/comitePrograma/contrasena.jsp";
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                } else {
                    if (action.equals("cambiarClave")) {
                        Representante r = (Representante) sesion.getAttribute("representante");
                        String actual = request.getParameter("actual");
                        String nueva1 = request.getParameter("nueva1");
                        String nueva2 = request.getParameter("nueva2");

                        if (r.getPassword().equals(actual)) {
                            if (nueva1.equals(nueva2)) {
                                r.setPassword(nueva1);
                                representanteFacade.edit(r);
                                out.print(0);
                            }
                        } else {
                            out.print(1);
                        }
                    }
                }
            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
