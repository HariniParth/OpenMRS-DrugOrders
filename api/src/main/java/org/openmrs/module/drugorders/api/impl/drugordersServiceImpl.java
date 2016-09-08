/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.drugorders.api.impl;

import java.util.List;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Patient;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.api.db.drugordersDAO;
import org.openmrs.module.drugorders.drugorders;
import org.springframework.transaction.annotation.Transactional;

/**
 * It is a default implementation of {@link drugordersService}.
 */
public class drugordersServiceImpl extends BaseOpenmrsService implements drugordersService {
	
    protected final Log log = LogFactory.getLog(this.getClass());

    private drugordersDAO dao;
	
    /**
     * @param dao the dao to set
    */
    
    public void setDao(drugordersDAO dao) {
	    this.dao = dao;
    }
    
    public Log getLog() {
        return log;
    }
    
    /**
     * @return the dao
     */
    public drugordersDAO getDao() {
	    return dao;
    }
    
    @Transactional(readOnly = true)
    @Override
    public int getLastGroupID(){
        return dao.getLastGroupID();
    }

    @Transactional(readOnly = true)
    @Override
    public drugorders getDrugOrderByID(Integer id) {
        return dao.getDrugOrderByID(id);
    }

    @Transactional(readOnly = true)
    @Override
    public drugorders getDrugOrderByOrderID(Integer id){
        return dao.getDrugOrderByOrderID(id);
    }
    
    @Transactional
    @Override
    public drugorders saveDrugOrder(drugorders doe) {
        return dao.saveDrugOrder(doe);
    }
    
    @Transactional
    @Override
    public void deleteDrugOrder(drugorders newTable) {
        dao.deleteDrugOrder(newTable);
    }

    @Transactional(readOnly = true)
    @Override
    public List<drugorders> getNewTablesByPatient(Patient patient) {
        return dao.getNewTablesByPatient(patient);
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<drugorders> getDrugOrdersByStatus(String status){
        return dao.getDrugOrdersByStatus(status);
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<drugorders> getDrugOrdersByGroupID(Integer id){
        return dao.getDrugOrdersByGroupID(id);
    }

}