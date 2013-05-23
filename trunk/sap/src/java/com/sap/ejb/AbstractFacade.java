/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import java.sql.SQLException;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author Ususario
 */
public abstract class AbstractFacade<T> {

    private Class<T> entityClass;

    public AbstractFacade(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    protected abstract EntityManager getEntityManager();

    public void create(T entity) {
        getEntityManager().persist(entity);
    }

    public void edit(T entity) {
        getEntityManager().merge(entity);
    }

    public void remove(T entity) {
        getEntityManager().remove(getEntityManager().merge(entity));
    }

    public T find(Object id) {
        return getEntityManager().find(entityClass, id);
    }

    public List<T> findAll() {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        return getEntityManager().createQuery(cq).getResultList();
    }

    public List<T> findRange(int[] range) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        q.setMaxResults(range[1] - range[0]);
        q.setFirstResult(range[0]);
        return q.getResultList();
    }

    public int count() {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        javax.persistence.criteria.Root<T> rt = cq.from(entityClass);
        cq.select(getEntityManager().getCriteriaBuilder().count(rt));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        return ((Long) q.getSingleResult()).intValue();
    }

    public T findBySingle(String property, Object m) {
        System.out.println("SELECT c FROM " + entityClass.getSimpleName() + " c WHERE c." + property + " = :name");
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        return getEntityManager().createQuery("SELECT c FROM " + entityClass.getSimpleName() + " c WHERE c." + property + " = :name", entityClass).setParameter("name", m).getSingleResult();
    }

    public List<T> findByList(String property, Object m) {
        System.out.println("SELECT c FROM " + entityClass.getSimpleName() + " c WHERE c." + property + " = :name");
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        return getEntityManager().createQuery("SELECT c FROM " + entityClass.getSimpleName() + " c WHERE c." + property + " = :name", entityClass).setParameter("name", m).getResultList();
    }

    public List<T> generarMuestra(Object m, int tamanio) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT c FROM " + entityClass.getSimpleName() + " c WHERE c.programaId = :name", entityClass);
        q.setMaxResults(tamanio);
        return q.setParameter("name", m).getResultList();
    }

    public <T> T randomEntity(EntityManager em, Class<T> clazz) {
        Query countQuery = em.createQuery("select count(id) from " + clazz.getName());
        long count = (Long) countQuery.getSingleResult();

        Random random = new Random();
        int number = random.nextInt((int) count);

        Query selectQuery = em.createQuery("from " + clazz.getName());
        selectQuery.setFirstResult(number);
        selectQuery.setMaxResults(1);
        return (T) selectQuery.getSingleResult();
    }
    
      public List<T> findLast(Object muestra) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        Query q = getEntityManager().createQuery("SELECT c FROM " + entityClass.getSimpleName() + " c WHERE c.muestraId = :name ORDER BY c.id DESC", entityClass);
        q.setMaxResults(1);
        return q.setParameter("name", muestra).getResultList();
    }

}
