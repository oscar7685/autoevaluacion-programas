/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.entity;

import java.io.Serializable;
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
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ususario
 */
@Entity
@Table(name = "resultadoevaluacion", catalog = "sapbd", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Resultadoevaluacion.findAll", query = "SELECT r FROM Resultadoevaluacion r"),
    @NamedQuery(name = "Resultadoevaluacion.findById", query = "SELECT r FROM Resultadoevaluacion r WHERE r.id = :id"),
    @NamedQuery(name = "Resultadoevaluacion.findByEncabezado", query = "SELECT r FROM Resultadoevaluacion r WHERE r.encabezadoId = :encabezado order by r.preguntaId.id asc"),
    @NamedQuery(name = "Resultadoevaluacion.findByRespuesta", query = "SELECT r FROM Resultadoevaluacion r WHERE r.respuesta = :respuesta")})
public class Resultadoevaluacion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 45)
    @Column(name = "respuesta")
    private String respuesta;
    @Size(max = 1000)
    @Column(name = "respuestaAbierta")
    private String respuestaAbierta;
    @JoinColumn(name = "pregunta_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Pregunta preguntaId;
    @JoinColumn(name = "encabezado_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Encabezado encabezadoId;

    public Resultadoevaluacion() {
    }

    public Resultadoevaluacion(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public Pregunta getPreguntaId() {
        return preguntaId;
    }

    public void setPreguntaId(Pregunta preguntaId) {
        this.preguntaId = preguntaId;
    }

    public String getRespuestaAbierta() {
        return respuestaAbierta;
    }

    public void setRespuestaAbierta(String respuestaAbierta) {
        this.respuestaAbierta = respuestaAbierta;
    }
    
    public Encabezado getEncabezadoId() {
        return encabezadoId;
    }

    public void setEncabezadoId(Encabezado encabezadoId) {
        this.encabezadoId = encabezadoId;
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
        if (!(object instanceof Resultadoevaluacion)) {
            return false;
        }
        Resultadoevaluacion other = (Resultadoevaluacion) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sap.entity.Resultadoevaluacion[ id=" + id + " ]";
    }
    
}
