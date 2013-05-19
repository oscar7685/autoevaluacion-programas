/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Indicador;
import com.sap.entity.Modelo;
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
public class IndicadorFacade extends AbstractFacade<Indicador> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public IndicadorFacade() {
        super(Indicador.class);
    }
    public List findByModelo(Modelo m) {
        Query q = em.createNamedQuery("Indicador.findByModelo");
        q.setParameter("modelo", m);
        return q.getResultList();
    }
    
}