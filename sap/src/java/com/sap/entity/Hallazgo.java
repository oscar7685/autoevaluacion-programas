/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
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
    @NamedQuery(name = "Hallazgo.findByEstrategia", query = "SELECT h FROM Hallazgo h WHERE h.estrategia = :estrategia"),
    @NamedQuery(name = "Hallazgo.findByMeta", query = "SELECT h FROM Hallazgo h WHERE h.meta = :meta"),
    @NamedQuery(name = "Hallazgo.findByIndicadorDeCumplimiento", query = "SELECT h FROM Hallazgo h WHERE h.indicadorDeCumplimiento = :indicadorDeCumplimiento"),
    @NamedQuery(name = "Hallazgo.findByResponsable", query = "SELECT h FROM Hallazgo h WHERE h.responsable = :responsable"),
    @NamedQuery(name = "Hallazgo.findByFinanciacion", query = "SELECT h FROM Hallazgo h WHERE h.financiacion = :financiacion")})
public class Hallazgo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idhallazgo")
    private Integer idhallazgo;
    @Size(max = 2000)
    @Column(name = "estrategia")
    private String estrategia;
    @Size(max = 2000)
    @Column(name = "meta")
    private String meta;
    @Size(max = 2000)
    @Column(name = "indicador de cumplimiento")
    private String indicadorDeCumplimiento;
    @Size(max = 2000)
    @Column(name = "responsable")
    private String responsable;
    @Size(max = 2000)
    @Column(name = "financiacion")
    private String financiacion;
    @JoinColumn(name = "proyectoestrategico_idproyectoestrategico", referencedColumnName = "idproyectoestrategico")
    @ManyToOne(optional = false)
    private Proyectoestrategico proyectoestrategicoIdproyectoestrategico;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "hallazgoIdhallazgo")
    private List<Fechacumplimiento> fechacumplimientoList;

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

    public String getIndicadorDeCumplimiento() {
        return indicadorDeCumplimiento;
    }

    public void setIndicadorDeCumplimiento(String indicadorDeCumplimiento) {
        this.indicadorDeCumplimiento = indicadorDeCumplimiento;
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

    public Proyectoestrategico getProyectoestrategicoIdproyectoestrategico() {
        return proyectoestrategicoIdproyectoestrategico;
    }

    public void setProyectoestrategicoIdproyectoestrategico(Proyectoestrategico proyectoestrategicoIdproyectoestrategico) {
        this.proyectoestrategicoIdproyectoestrategico = proyectoestrategicoIdproyectoestrategico;
    }

    @XmlTransient
    public List<Fechacumplimiento> getFechacumplimientoList() {
        return fechacumplimientoList;
    }

    public void setFechacumplimientoList(List<Fechacumplimiento> fechacumplimientoList) {
        this.fechacumplimientoList = fechacumplimientoList;
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
