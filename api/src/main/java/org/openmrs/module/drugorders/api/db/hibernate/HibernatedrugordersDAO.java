/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.drugorders.api.db.hibernate;

import java.util.Iterator;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.openmrs.Patient;
import org.openmrs.module.drugorders.api.db.drugordersDAO;
import org.openmrs.module.drugorders.drugorders;

/**
 * It is a default implementation of  {@link drugordersDAO}.
 */
public class HibernatedrugordersDAO implements drugordersDAO {
    
    protected final Log log = LogFactory.getLog(this.getClass());

    private SessionFactory sessionFactory;
	
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    @Override
    public drugorders getDrugOrderByID(Integer id) {
        return (drugorders) sessionFactory.getCurrentSession().get(drugorders.class, id);
    };

    @Override
    public drugorders getDrugOrderByOrderID(Integer id){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugorders.class);
        crit.add(Restrictions.eq("orderId", id));
        return (drugorders) crit.uniqueResult();
    };

    @Override
    public drugorders saveDrugOrder(drugorders drugOrder) {
        sessionFactory.getCurrentSession().saveOrUpdate(drugOrder);
        return drugOrder;
    };
        
    @Override
    public void deleteDrugOrder(drugorders drugOrder) {
        sessionFactory.getCurrentSession().delete(drugOrder);
    };

    @Override
    public List<drugorders> getNewTablesByPatient(Patient patient) {
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugorders.class);
        crit.add(Restrictions.eq("patientid", patient));
        return crit.list();
    };
    
    @Override
    public List<drugorders> getDrugOrdersByStatus(String status){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugorders.class);
        crit.add(Restrictions.eq("orderstatus", status));
        return crit.list();
    };
    
    @Override
    public List<drugorders> getDrugOrdersByGroupID(Integer id){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugorders.class);
        crit.add(Restrictions.eq("groupid", id));
        return crit.list();
    }
    
     @Override
    public int getLastGroupID(){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugorders.class);
        crit.setProjection(Projections.property("id"));
        List l=crit.list();
        Iterator it=l.iterator();
        int groupID = 0;
        if(it.hasNext()){
            Criteria critMax = sessionFactory.getCurrentSession().createCriteria(drugorders.class).setProjection(Projections.max("groupid"));
            if(critMax.uniqueResult() == null)
                groupID = 0;
            else
                groupID = (Integer)critMax.uniqueResult();
        }
            
        return groupID;
    }
}