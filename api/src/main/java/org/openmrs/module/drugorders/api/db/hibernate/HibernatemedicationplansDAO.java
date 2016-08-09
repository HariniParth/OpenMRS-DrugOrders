/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api.db.hibernate;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.openmrs.module.drugorders.api.db.medicationplansDAO;
import org.openmrs.module.drugorders.medicationplans;

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
    
}
