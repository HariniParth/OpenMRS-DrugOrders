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

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
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
	
	/**
     * @param sessionFactory the sessionFactory to set
     */
    public void setSessionFactory(SessionFactory sessionFactory) {
	    this.sessionFactory = sessionFactory;
    }
    
	/**
     * @return the sessionFactory
     */
    public SessionFactory getSessionFactory() {
	    return sessionFactory;
    }
    
        @Override
    public drugorders getNewTable(Integer id) {
        return (drugorders) sessionFactory.getCurrentSession().get(drugorders.class, id);
    }

    ;

        @Override
	public drugorders getNewTableByUuid(String uuid) {
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugorders.class);
        crit.add(Restrictions.eq("uuid", uuid));
        return (drugorders) crit.uniqueResult();
    }

    ;

        @Override
	public drugorders saveNewTable(drugorders newTable) {
        sessionFactory.getCurrentSession().saveOrUpdate(newTable);
        return newTable;
    }

    ;
        @Override
	public void deleteNewTable(drugorders newTable) {
        sessionFactory.getCurrentSession().delete(newTable);
    }

    ;

        @Override
    public List<drugorders> getNewTablesByPatient(Patient patient) {
        Criteria crit = sessionFactory.getCurrentSession().createCriteria(
                drugorders.class);
        crit.add(Restrictions.eq("patientid", patient));
        return crit.list();
    }
;
}