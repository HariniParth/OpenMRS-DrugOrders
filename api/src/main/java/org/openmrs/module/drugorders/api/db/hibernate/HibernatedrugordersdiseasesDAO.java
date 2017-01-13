/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api.db.hibernate;

import java.util.Iterator;
import java.util.List;
import org.openmrs.Concept;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.apache.commons.logging.Log;
import org.hibernate.criterion.Restrictions;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.Projections;
import org.openmrs.Patient;
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
    
    /**
     *
     * @param plan
     * @return
     */
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByPlanID(Integer plan){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugordersdiseases.class);
        crit.add(Restrictions.eq("planid", plan));
        return crit.list();
    };
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByPatient(Patient patient){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugordersdiseases.class);
        crit.add(Restrictions.eq("patientid", Integer.toString(patient.getPatientId())));
        return crit.list();
    };
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByDiseaseAndPatient(Concept concept,Patient patient){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugordersdiseases.class);
        crit.add(Restrictions.eq("diseaseid", concept)).add(Restrictions.eq("patientid", Integer.toString(patient.getPatientId())));
        return crit.list();
    };
    
    @Override
    public int getLastPlanID(){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugordersdiseases.class);
        crit.setProjection(Projections.property("id"));
        List l=crit.list();
        Iterator it=l.iterator();
        int planID = 0;
        if(it.hasNext()){
            Criteria critMax = sessionFactory.getCurrentSession().createCriteria(drugordersdiseases.class).setProjection(Projections.max("planid"));
            if(critMax.uniqueResult() == null)
                planID = 0;
            else
                planID = (Integer)critMax.uniqueResult();
        }
            
        return planID;
    };
}
