/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sap.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ususario
 */
@Entity
@Table(name = "hallazgo", catalog = "sapbd", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Hallazgo.findAll", query = "SELECT h FROM Hallazgo h"),
    @NamedQuery(name = "Hallazgo.findByIdhallazgo", query = "SELECT h FROM Hallazgo h WHERE h.idhallazgo = :idhallazgo"),
    @NamedQuery(name = "Hallazgo.findByHallazgo", query = "SELECT h FROM Hallazgo h WHERE h.hallazgo = :hallazgo"),
    @NamedQuery(name = "Hallazgo.findByEstrategia", query = "SELECT h FROM Hallazgo h WHERE h.estrategia = :estrategia"),
    @NamedQuery(name = "Hallazgo.findByMeta", query = "SELECT h FROM Hallazgo h WHERE h.meta = :meta"),
    @NamedQuery(name = "Hallazgo.findByIndicadorCumplimiento", query = "SELECT h FROM Hallazgo h WHERE h.indicadorCumplimiento = :indicadorCumplimiento"),
    @NamedQuery(name = "Hallazgo.findByResponsable", query = "SELECT h FROM Hallazgo h WHERE h.responsable = :responsable"),
    @NamedQuery(name = "Hallazgo.findByFinanciacion", query = "SELECT h FROM Hallazgo h WHERE h.financiacion = :financiacion"),
    @NamedQuery(name = "Hallazgo.findByEstado", query = "SELECT h FROM Hallazgo h WHERE h.estado = :estado"),
    @NamedQuery(name = "Hallazgo.findByPorcentajeCumplimiento", query = "SELECT h FROM Hallazgo h WHERE h.porcentajeCumplimiento = :porcentajeCumplimiento"),
    @NamedQuery(name = "Hallazgo.findByObservaciones", query = "SELECT h FROM Hallazgo h WHERE h.observaciones = :observaciones"),
    @NamedQuery(name = "Hallazgo.findByEstadoInterno", query = "SELECT h FROM Hallazgo h WHERE h.estadoInterno = :estadoInterno"),
    @NamedQuery(name = "Hallazgo.findByFechaInicio", query = "SELECT h FROM Hallazgo h WHERE h.fechaInicio = :fechaInicio"),
    @NamedQuery(name = "Hallazgo.findByFechaFinal", query = "SELECT h FROM Hallazgo h WHERE h.fechaFinal = :fechaFinal"),
    @NamedQuery(name = "Hallazgo.findByFechaSeguimiento", query = "SELECT h FROM Hallazgo h WHERE h.fechaSeguimiento = :fechaSeguimiento"),
    @NamedQuery(name = "Hallazgo.findByCorreos", query = "SELECT h FROM Hallazgo h WHERE h.correos = :correos"),
    @NamedQuery(name = "Hallazgo.findByContinuarEnvio", query = "SELECT h FROM Hallazgo h WHERE h.continuarEnvio = :continuarEnvio"),
    @NamedQuery(name = "Hallazgo.findByEnviarCorreoCada", query = "SELECT h FROM Hallazgo h WHERE h.enviarCorreoCada = :enviarCorreoCada")})
public class Hallazgo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idhallazgo")
    private Integer idhallazgo;
    @Size(max = 2000)
    @Column(name = "hallazgo")
    private String hallazgo;
    @Size(max = 2000)
    @Column(name = "estrategia")
    private String estrategia;
    @Size(max = 2000)
    @Column(name = "meta")
    private String meta;
    @Size(max = 2000)
    @Column(name = "indicador_cumplimiento")
    private String indicadorCumplimiento;
    @Size(max = 2000)
    @Column(name = "responsable")
    private String responsable;
    @Size(max = 2000)
    @Column(name = "financiacion")
    private String financiacion;
    @Size(max = 45)
    @Column(name = "estado")
    private String estado;
    @Column(name = "porcentaje_cumplimiento")
    private Integer porcentajeCumplimiento;
    @Size(max = 45)
    @Column(name = "observaciones")
    private String observaciones;
    @Size(max = 45)
    @Column(name = "estado_interno")
    private String estadoInterno;
    @Column(name = "fecha_inicio")
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;
    @Column(name = "fecha_final")
    @Temporal(TemporalType.DATE)
    private Date fechaFinal;
    @Column(name = "fecha_seguimiento")
    @Temporal(TemporalType.DATE)
    private Date fechaSeguimiento;
    @Size(max = 1000)
    @Column(name = "correos")
    private String correos;
    @Size(max = 45)
    @Column(name = "continuar_envio")
    private String continuarEnvio;
    @Size(max = 45)
    @Column(name = "enviar_correo_cada")
    private String enviarCorreoCada;
    @OneToMany(mappedBy = "hallazgoPadre")
    private List<Hallazgo> hallazgoList;
    @JoinColumn(name = "hallazgo_padre", referencedColumnName = "idhallazgo")
    @ManyToOne
    private Hallazgo hallazgoPadre;
    @JoinColumn(name = "proyectoestrategico_idproyectoestrategico", referencedColumnName = "idproyectoestrategico")
    @ManyToOne(optional = false)
    private Proyectoestrategico proyectoestrategicoIdproyectoestrategico;

    public Hallazgo() {
    }

    public Hallazgo(Integer idhallazgo) {
        this.idhallazgo = idhallazgo;
    }

    public Integer getIdhallazgo() {
        return idhallazgo;
    }

    public void setIdhallazgo(Integer idhallazgo) {
        this.idhallazgo = idhallazgo;
    }

    public String getHallazgo() {
        return hallazgo;
    }

    public void setHallazgo(String hallazgo) {
        this.hallazgo = hallazgo;
    }

    public String getEstrategia() {
        return estrategia;
    }

    public void setEstrategia(String estrategia) {
        this.estrategia = estrategia;
    }

    public String getMeta() {
        return meta;
    }

    public void setMeta(String meta) {
        this.meta = meta;
    }

    public String getIndicadorCumplimiento() {
        return indicadorCumplimiento;
    }

    public void setIndicadorCumplimiento(String indicadorCumplimiento) {
        this.indicadorCumplimiento = indicadorCumplimiento;
    }

    public String getResponsable() {
        return responsable;
    }

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    public String getFinanciacion() {
        return financiacion;
    }

    public void setFinanciacion(String financiacion) {
        this.financiacion = financiacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Integer getPorcentajeCumplimiento() {
        return porcentajeCumplimiento;
    }

    public void setPorcentajeCumplimiento(Integer porcentajeCumplimiento) {
        this.porcentajeCumplimiento = porcentajeCumplimiento;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getEstadoInterno() {
        return estadoInterno;
    }

    public void setEstadoInterno(String estadoInterno) {
        this.estadoInterno = estadoInterno;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFinal() {
        return fechaFinal;
    }

    public void setFechaFinal(Date fechaFinal) {
        this.fechaFinal = fechaFinal;
    }

    public Date getFechaSeguimiento() {
        return fechaSeguimiento;
    }

    public void setFechaSeguimiento(Date fechaSeguimiento) {
        this.fechaSeguimiento = fechaSeguimiento;
    }

    public String getCorreos() {
        return correos;
    }

    public void setCorreos(String correos) {
        this.correos = correos;
    }

    public String getContinuarEnvio() {
        return continuarEnvio;
    }

    public void setContinuarEnvio(String continuarEnvio) {
        this.continuarEnvio = continuarEnvio;
    }

    public String getEnviarCorreoCada() {
        return enviarCorreoCada;
    }

    public void setEnviarCorreoCada(String enviarCorreoCada) {
        this.enviarCorreoCada = enviarCorreoCada;
    }

    @XmlTransient
    public List<Hallazgo> getHallazgoList() {
        return hallazgoList;
    }

    public void setHallazgoList(List<Hallazgo> hallazgoList) {
        this.hallazgoList = hallazgoList;
    }

    public Hallazgo getHallazgoPadre() {
        return hallazgoPadre;
    }

    public void setHallazgoPadre(Hallazgo hallazgoPadre) {
        this.hallazgoPadre = hallazgoPadre;
    }

    public Proyectoestrategico getProyectoestrategicoIdproyectoestrategico() {
        return proyectoestrategicoIdproyectoestrategico;
    }

    public void setProyectoestrategicoIdproyectoestrategico(Proyectoestrategico proyectoestrategicoIdproyectoestrategico) {
        this.proyectoestrategicoIdproyectoestrategico = proyectoestrategicoIdproyectoestrategico;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idhallazgo != null ? idhallazgo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Hallazgo)) {
            return false;
        }
        Hallazgo other = (Hallazgo) object;
        if ((this.idhallazgo == null && other.idhallazgo != null) || (this.idhallazgo != null && !this.idhallazgo.equals(other.idhallazgo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sap.entity.Hallazgo[ idhallazgo=" + idhallazgo + " ]";
    }
    
}
