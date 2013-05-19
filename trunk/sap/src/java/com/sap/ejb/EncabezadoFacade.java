/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Encabezado;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ususario
 */
@Stateless
public class EncabezadoFacade extends AbstractFacade<Encabezado> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EncabezadoFacade() {
        super(Encabezado.class);
    }
    
}