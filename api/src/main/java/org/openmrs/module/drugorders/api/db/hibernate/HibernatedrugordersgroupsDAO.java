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
import org.openmrs.module.drugorders.api.db.drugordersgroupsDAO;
import org.openmrs.module.drugorders.drugordersgroups;

/**
 *
 * @author harini-geek
 */
public class HibernatedrugordersgroupsDAO implements drugordersgroupsDAO {
    
    protected final Log log = LogFactory.getLog(this.getClass());

    private SessionFactory sessionFactory;
	
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    @Override
    public List<drugordersgroups> getDrugOrdersByGroupID(Integer id){
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugordersgroups.class);
        crit.add(Restrictions.eq("groupid", id));
        return crit.list();
    }
    
    @Override
    public drugordersgroups saveDrugOrderGroup(drugordersgroups groupItem){
        sessionFactory.getCurrentSession().saveOrUpdate(groupItem);
        return groupItem;
    }
    
}
