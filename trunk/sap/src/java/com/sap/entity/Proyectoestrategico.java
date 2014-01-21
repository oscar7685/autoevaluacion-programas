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
@Table(name = "proyectoestrategico", catalog = "sapbd", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Proyectoestrategico.findAll", query = "SELECT p FROM Proyectoestrategico p"),
    @NamedQuery(name = "Proyectoestrategico.findByIdproyectoestrategico", query = "SELECT p FROM Proyectoestrategico p WHERE p.idproyectoestrategico = :idproyectoestrategico"),
    @NamedQuery(name = "Proyectoestrategico.findByProyecto", query = "SELECT p FROM Proyectoestrategico p WHERE p.proyecto = :proyecto"),
    @NamedQuery(name = "Proyectoestrategico.findByObjetivo", query = "SELECT p FROM Proyectoestrategico p WHERE p.objetivo = :objetivo")})
public class Proyectoestrategico implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idproyectoestrategico")
    private Integer idproyectoestrategico;
    @Size(max = 2000)
    @Column(name = "proyecto")
    private String proyecto;
    @Size(max = 2000)
    @Column(name = "objetivo")
    private String objetivo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "proyectoestrategicoIdproyectoestrategico")
    private List<Hallazgo> hallazgoList;
    @JoinColumn(name = "proceso_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Proceso procesoId;

    public Proyectoestrategico() {
    }

    public Proyectoestrategico(Integer idproyectoestrategico) {
        this.idproyectoestrategico = idproyectoestrategico;
    }

    public Integer getIdproyectoestrategico() {
        return idproyectoestrategico;
    }

    public void setIdproyectoestrategico(Integer idproyectoestrategico) {
        this.idproyectoestrategico = idproyectoestrategico;
    }

    public String getProyecto() {
        return proyecto;
    }

    public void setProyecto(String proyecto) {
        this.proyecto = proyecto;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    @XmlTransient
    public List<Hallazgo> getHallazgoList() {
        return hallazgoList;
    }

    public void setHallazgoList(List<Hallazgo> hallazgoList) {
        this.hallazgoList = hallazgoList;
    }

    public Proceso getProcesoId() {
        return procesoId;
    }

    public void setProcesoId(Proceso procesoId) {
        this.procesoId = procesoId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idproyectoestrategico != null ? idproyectoestrategico.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Proyectoestrategico)) {
            return false;
        }
        Proyectoestrategico other = (Proyectoestrategico) object;
        if ((this.idproyectoestrategico == null && other.idproyectoestrategico != null) || (this.idproyectoestrategico != null && !this.idproyectoestrategico.equals(other.idproyectoestrategico))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sap.entity.Proyectoestrategico[ idproyectoestrategico=" + idproyectoestrategico + " ]";
    }
    
}
