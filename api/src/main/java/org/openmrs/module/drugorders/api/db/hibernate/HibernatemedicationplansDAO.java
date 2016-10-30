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
import org.openmrs.module.drugorders.medicationplans;
import org.openmrs.module.drugorders.api.db.medicationplansDAO;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author harini-geek
 */
public class HibernatemedicationplansDAO implements medicationplansDAO {
    
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
    public void deleteMedicationPlan(medicationplans plan){
        sessionFactory.getCurrentSession().delete(plan);
    };
    
    @Override
    public medicationplans saveMedicationPlan(medicationplans plan) {
        sessionFactory.getCurrentSession().saveOrUpdate(plan);
        return plan;
    };
    
    @Transactional(readOnly = true)
    @Override
    public List<medicationplans> getAllMedicationPlans(){
        
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                medicationplans.class);
        return crit.list();
    };
    
    @Transactional(readOnly = true)
    @Override
    public List<medicationplans> getMedicationPlansByDisease(Concept concept){
        
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                medicationplans.class);
        crit.add(Restrictions.eq("diseaseid", concept));
        return crit.list();
    };
    
    @Override
    public medicationplans getMedicationPlan(Integer id){
        return (medicationplans) sessionFactory.getCurrentSession().get(medicationplans.class, id);
    };
}
