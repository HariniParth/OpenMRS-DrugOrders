/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api.db.hibernate;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.openmrs.Concept;
import org.openmrs.Patient;
import org.openmrs.module.drugorders.api.db.drugordersdiseasesDAO;
import org.openmrs.module.drugorders.drugordersdiseases;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author harini-geek
 */
public class HibernatedrugordersdiseasesDAO implements drugordersdiseasesDAO {
    
    protected final Log log = LogFactory.getLog(this.getClass());
	
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
	    this.sessionFactory = sessionFactory;
    }
    
    public SessionFactory getSessionFactory() {
	    return sessionFactory;
    }
    
    @Override
    public drugordersdiseases saveDrugOrder(drugordersdiseases order){
        sessionFactory.getCurrentSession().saveOrUpdate(order);
        return order;
    }
    ;
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByDisease(Concept concept){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugordersdiseases.class);
        crit.add(Restrictions.eq("diseaseid", concept));
        return crit.list();
    }
    ;
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByPatient(Patient patient){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugordersdiseases.class);
        crit.add(Restrictions.eq("patientid", patient));
        return crit.list();
    }
    ;
    
    @Transactional
    @Override
    public void deleteDrugOrder(drugordersdiseases order){
        sessionFactory.getCurrentSession().delete(order);
    }
    ;
}
