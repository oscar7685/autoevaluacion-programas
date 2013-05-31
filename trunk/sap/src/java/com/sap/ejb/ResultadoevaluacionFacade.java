/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Encabezado;
import com.sap.entity.Resultadoevaluacion;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Ususario
 */
@Stateless
public class ResultadoevaluacionFacade extends AbstractFacade<Resultadoevaluacion> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ResultadoevaluacionFacade() {
        super(Resultadoevaluacion.class);
    }
     public List findByEncabezado(Encabezado e) {
        Query q = em.createNamedQuery("Resultadoevaluacion.findByEncabezado");
        q.setParameter("encabezado", e);
        return q.getResultList();
    }
    
}
