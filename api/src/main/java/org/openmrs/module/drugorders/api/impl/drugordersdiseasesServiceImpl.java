/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api.impl;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Concept;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.drugorders.api.db.drugordersdiseasesDAO;
import org.openmrs.module.drugorders.api.drugordersdiseasesService;
import org.openmrs.module.drugorders.drugordersdiseases;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author harini-geek
 */
public class drugordersdiseasesServiceImpl extends BaseOpenmrsService implements drugordersdiseasesService{
    
    protected final Log log = LogFactory.getLog(this.getClass());

    private drugordersdiseasesDAO dao;
	
    public void setDao(drugordersdiseasesDAO dao) {
	    this.dao = dao;
    }
    
    public Log getLog() {
        return log;
    }

    public drugordersdiseasesDAO getDao() {
	    return dao;
    }
    
    @Transactional
    @Override
    public drugordersdiseases saveDrugOrder(drugordersdiseases order){
        return dao.saveDrugOrder(order);
    }
    
    @Transactional(readOnly = true)
    @Override
    public drugordersdiseases getDrugOrderByOrderID(Integer id){
        return dao.getDrugOrderByOrderID(id);
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByDisease(Concept concept){
        return dao.getDrugOrdersByDisease(concept);
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByPatient(String patientID){
        return dao.getDrugOrdersByPatient(patientID);
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByDiseaseAndPatient(Concept concept,String patientID){
        return dao.getDrugOrdersByDiseaseAndPatient(concept, patientID);
    }
    
    @Override
    public void deleteDrugOrder(drugordersdiseases order){
        dao.deleteDrugOrder(order);
    }
    
}
