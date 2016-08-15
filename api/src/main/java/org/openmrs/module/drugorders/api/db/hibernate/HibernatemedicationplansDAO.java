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
import org.openmrs.module.drugorders.api.db.medicationplansDAO;
import org.openmrs.module.drugorders.medicationplans;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author harini-geek
 */
public class HibernatemedicationplansDAO implements medicationplansDAO {
    
    protected final Log log = LogFactory.getLog(this.getClass());
	
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
	    this.sessionFactory = sessionFactory;
    }
    
    public SessionFactory getSessionFactory() {
	    return sessionFactory;
    }
    
    @Override
    public medicationplans saveNewTable(medicationplans newTable) {
        sessionFactory.getCurrentSession().saveOrUpdate(newTable);
        return newTable;
    }

    ;
    
    @Transactional(readOnly = true)
    @Override
    public List<medicationplans> getMedicationPlansByDisease(Concept concept){
        
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                medicationplans.class);
        crit.add(Restrictions.eq("diseaseid", concept));
        return crit.list();
    }
    
    ;
    
    @Transactional(readOnly = true)
    @Override
    public List<medicationplans> getAllMedicationPlans(){
        
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                medicationplans.class);
        return crit.list();
    }
    
    ;

    @Transactional
    @Override
    public void deleteMedicationPlan(medicationplans plan){
        sessionFactory.getCurrentSession().delete(plan);
    }
    
    ;
    
    @Override
    public medicationplans getMedicationPlan(Integer id){
        return (medicationplans) sessionFactory.getCurrentSession().get(medicationplans.class, id);
    }
    
    ;
}
