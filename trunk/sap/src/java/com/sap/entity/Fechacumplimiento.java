/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ususario
 */
@Entity
@Table(name = "fechacumplimiento", catalog = "sapbd", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Fechacumplimiento.findAll", query = "SELECT f FROM Fechacumplimiento f"),
    @NamedQuery(name = "Fechacumplimiento.findByIdfechacumplimiento", query = "SELECT f FROM Fechacumplimiento f WHERE f.idfechacumplimiento = :idfechacumplimiento"),
    @NamedQuery(name = "Fechacumplimiento.findByFechaseguimiento", query = "SELECT f FROM Fechacumplimiento f WHERE f.fechaseguimiento = :fechaseguimiento"),
    @NamedQuery(name = "Fechacumplimiento.findByFechacalificacion", query = "SELECT f FROM Fechacumplimiento f WHERE f.fechacalificacion = :fechacalificacion"),
    @NamedQuery(name = "Fechacumplimiento.findByCalificacion", query = "SELECT f FROM Fechacumplimiento f WHERE f.calificacion = :calificacion"),
    @NamedQuery(name = "Fechacumplimiento.findByComentarios", query = "SELECT f FROM Fechacumplimiento f WHERE f.comentarios = :comentarios")})
public class Fechacumplimiento implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idfechacumplimiento")
    private Integer idfechacumplimiento;
    @Column(name = "fechaseguimiento")
    @Temporal(TemporalType.DATE)
    private Date fechaseguimiento;
    @Column(name = "fechacalificacion")
    @Temporal(TemporalType.DATE)
    private Date fechacalificacion;
    @Size(max = 45)
    @Column(name = "calificacion")
    private String calificacion;
    @Size(max = 2000)
    @Column(name = "comentarios")
    private String comentarios;
    @JoinColumn(name = "hallazgo_idhallazgo", referencedColumnName = "idhallazgo")
    @ManyToOne(optional = false)
    private Hallazgo hallazgoIdhallazgo;

    public Fechacumplimiento() {
    }

    public Fechacumplimiento(Integer idfechacumplimiento) {
        this.idfechacumplimiento = idfechacumplimiento;
    }

    public Integer getIdfechacumplimiento() {
        return idfechacumplimiento;
    }

    public void setIdfechacumplimiento(Integer idfechacumplimiento) {
        this.idfechacumplimiento = idfechacumplimiento;
    }

    public Date getFechaseguimiento() {
        return fechaseguimiento;
    }

    public void setFechaseguimiento(Date fechaseguimiento) {
        this.fechaseguimiento = fechaseguimiento;
    }

    public Date getFechacalificacion() {
        return fechacalificacion;
    }

    public void setFechacalificacion(Date fechacalificacion) {
        this.fechacalificacion = fechacalificacion;
    }

    public String getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(String calificacion) {
        this.calificacion = calificacion;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    public Hallazgo getHallazgoIdhallazgo() {
        return hallazgoIdhallazgo;
    }

    public void setHallazgoIdhallazgo(Hallazgo hallazgoIdhallazgo) {
        this.hallazgoIdhallazgo = hallazgoIdhallazgo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idfechacumplimiento != null ? idfechacumplimiento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Fechacumplimiento)) {
            return false;
        }
        Fechacumplimiento other = (Fechacumplimiento) object;
        if ((this.idfechacumplimiento == null && other.idfechacumplimiento != null) || (this.idfechacumplimiento != null && !this.idfechacumplimiento.equals(other.idfechacumplimiento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sap.entity.Fechacumplimiento[ idfechacumplimiento=" + idfechacumplimiento + " ]";
    }
    
}
