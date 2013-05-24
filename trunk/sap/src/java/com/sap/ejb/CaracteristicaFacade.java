/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Caracteristica;
import com.sap.entity.Modelo;
import com.sap.entity.Proceso;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author Ususario
 */
@Stateless
public class CaracteristicaFacade extends AbstractFacade<Caracteristica> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CaracteristicaFacade() {
        super(Caracteristica.class);
    }
    
     public List findByModelo(Object m) {
        TypedQuery<Proceso> query = em.createQuery(
                "SELECT c FROM Caracteristica c WHERE c.modeloId = :name", Proceso.class);
        return query.setParameter("name", m).getResultList();
     
}
    
}
