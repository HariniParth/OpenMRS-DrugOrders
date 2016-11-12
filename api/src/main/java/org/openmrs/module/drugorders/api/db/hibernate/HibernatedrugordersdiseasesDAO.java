/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api.db.hibernate;

import java.util.List;
import org.openmrs.Concept;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.apache.commons.logging.Log;
import org.hibernate.criterion.Restrictions;
import org.apache.commons.logging.LogFactory;
import org.openmrs.module.drugorders.drugordersdiseases;
import org.springframework.transaction.annotation.Transactional;
import org.openmrs.module.drugorders.api.db.drugordersdiseasesDAO;


/**
 *
 * @author harini-geek
 */
public class HibernatedrugordersdiseasesDAO implements drugordersdiseasesDAO {
    
    private SessionFactory sessionFactory;
    protected final Log log = LogFactory.getLog(this.getClass());
	
    public SessionFactory getSessionFactory() {
	    return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
	    this.sessionFactory = sessionFactory;
    }
    
    @Transactional
    @Override
    public void deleteDrugOrder(drugordersdiseases order){
        sessionFactory.getCurrentSession().delete(order);
    };
    
    @Override
    public drugordersdiseases saveDrugOrder(drugordersdiseases order){
        sessionFactory.getCurrentSession().saveOrUpdate(order);
        return order;
    };
    
    @Override
    public drugordersdiseases getDrugOrderByOrderID(Integer id){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugordersdiseases.class);
        crit.add(Restrictions.eq("orderid", id));
        return (drugordersdiseases) crit.uniqueResult();
    };
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByPlan(Integer plan){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugordersdiseases.class);
        crit.add(Restrictions.eq("planid", plan));
        return crit.list();
    };
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByDisease(Concept concept){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugordersdiseases.class);
        crit.add(Restrictions.eq("diseaseid", concept));
        return crit.list();
    };
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByPatient(String patientID){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugordersdiseases.class);
        crit.add(Restrictions.eq("patientid", patientID));
        return crit.list();
    };
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByDiseaseAndPatient(Concept concept,String patientID){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugordersdiseases.class);
        crit.add(Restrictions.eq("diseaseid", concept)).add(Restrictions.eq("patientid", patientID));
        return crit.list();
    };
    
}
