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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "caracteristica", catalog = "sapbd", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Caracteristica.findAll", query = "SELECT c FROM Caracteristica c"),
    @NamedQuery(name = "Caracteristica.findById", query = "SELECT c FROM Caracteristica c WHERE c.id = :id"),
    @NamedQuery(name = "Caracteristica.findByCodigo", query = "SELECT c FROM Caracteristica c WHERE c.codigo = :codigo"),
    @NamedQuery(name = "Caracteristica.findByNombre", query = "SELECT c FROM Caracteristica c WHERE c.nombre = :nombre")})
public class Caracteristica implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "codigo")
    private String codigo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "nombre")
    private String nombre;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "caracteristicaId")
    private List<Ponderacioncaracteristica> ponderacioncaracteristicaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "caracteristicaId")
    private List<Indicador> indicadorList;
    @JoinColumn(name = "factor_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Factor factorId;

    public Caracteristica() {
    }

    public Caracteristica(Integer id) {
        this.id = id;
    }

    public Caracteristica(Integer id, String codigo, String nombre) {
        this.id = id;
        this.codigo = codigo;
        this.nombre = nombre;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @XmlTransient
    public List<Ponderacioncaracteristica> getPonderacioncaracteristicaList() {
        return ponderacioncaracteristicaList;
    }

    public void setPonderacioncaracteristicaList(List<Ponderacioncaracteristica> ponderacioncaracteristicaList) {
        this.ponderacioncaracteristicaList = ponderacioncaracteristicaList;
    }

    @XmlTransient
    public List<Indicador> getIndicadorList() {
        return indicadorList;
    }

    public void setIndicadorList(List<Indicador> indicadorList) {
        this.indicadorList = indicadorList;
    }

    public Factor getFactorId() {
        return factorId;
    }

    public void setFactorId(Factor factorId) {
        this.factorId = factorId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Caracteristica)) {
            return false;
        }
        Caracteristica other = (Caracteristica) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sap.entity.Caracteristica[ id=" + id + " ]";
    }
    
}