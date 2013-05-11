/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Ponderacioncaracteristica;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ususario
 */
@Stateless
public class PonderacioncaracteristicaFacade extends AbstractFacade<Ponderacioncaracteristica> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PonderacioncaracteristicaFacade() {
        super(Ponderacioncaracteristica.class);
    }
    
}
