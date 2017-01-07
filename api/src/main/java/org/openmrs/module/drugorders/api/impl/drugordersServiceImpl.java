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
import org.openmrs.Concept;
import org.openmrs.Patient;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.api.db.drugordersDAO;
import org.springframework.transaction.annotation.Transactional;

/**
 * It is a default implementation of {@link drugordersService}.
 */
public class drugordersServiceImpl extends BaseOpenmrsService implements drugordersService {
	
    private drugordersDAO dao;
    protected final Log log = LogFactory.getLog(this.getClass());

    /**
     * @return 
    */
    
    public Log getLog() {
        return log;
    }
        
    public drugordersDAO getDao() {
	    return dao;
    }
    
    public void setDao(drugordersDAO dao) {
	    this.dao = dao;
    }
    
    @Transactional(readOnly = true)
    @Override
    public int getLastGroupID(){
        return dao.getLastGroupID();
    }

    @Transactional(readOnly = true)
    @Override
    public List<drugorders> getAllDrugOrders() {
        return dao.getAllDrugOrders();
    }
    
    @Transactional(readOnly = true)
    @Override
    public drugorders getDrugOrderByID(Integer id) {
        return dao.getDrugOrderByID(id);
    }

    @Transactional
    @Override
    public drugorders saveDrugOrder(drugorders drugOrder) {
        return dao.saveDrugOrder(drugOrder);
    }
    
    @Transactional
    @Override
    public void deleteDrugOrder(drugorders drugOrder) {
        dao.deleteDrugOrder(drugOrder);
    }
    
    @Transactional(readOnly = true)
    @Override
    public drugorders getDrugOrderByOrderID(Integer id){
        return dao.getDrugOrderByOrderID(id);
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<drugorders> getDrugOrdersByGroupID(Integer id){
        return dao.getDrugOrdersByGroupID(id);
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<drugorders> getDrugOrdersByStatus(String status){
        return dao.getDrugOrdersByStatus(status);
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<drugorders> getDrugOrdersByPatient(Patient patient) {
        return dao.getDrugOrdersByPatient(patient);
    }
    
    @Transactional(readOnly = true)
    @Override
    public drugorders getDrugOrderByDrugAndPatient(Concept drugname,String patientID){
        return dao.getDrugOrderByDrugAndPatient(drugname, patientID);
    }

    @Transactional(readOnly = true)
    @Override
    public List<drugorders> getDrugOrdersByPatientAndStatus(String patientID, String status){
        return dao.getDrugOrdersByPatientAndStatus(patientID, status);
    }
}