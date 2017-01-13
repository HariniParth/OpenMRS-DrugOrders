/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api.impl;

import java.util.List;
import org.openmrs.Concept;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Patient;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.drugorders.drugordersdiseases;
import org.springframework.transaction.annotation.Transactional;
import org.openmrs.module.drugorders.api.db.drugordersdiseasesDAO;
import org.openmrs.module.drugorders.api.drugordersdiseasesService;

/**
 *
 * @author harini-geek
 */
public class drugordersdiseasesServiceImpl extends BaseOpenmrsService implements drugordersdiseasesService{
    
    private drugordersdiseasesDAO dao;
    protected final Log log = LogFactory.getLog(this.getClass());

    public Log getLog() {
        return log;
    }

    public drugordersdiseasesDAO getDao() {
	    return dao;
    }
    
    public void setDao(drugordersdiseasesDAO dao) {
	    this.dao = dao;
    }
    
    @Transactional(readOnly = true)
    @Override
    public int getLastPlanID(){
        return dao.getLastPlanID();
    }
    
    @Transactional(readOnly = true)
    @Override
    public drugordersdiseases getDrugOrderByOrderID(Integer id){
        return dao.getDrugOrderByOrderID(id);
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByPlanID(Integer plan){
        return dao.getDrugOrdersByPlanID(plan);
    }
    
    @Transactional
    @Override
    public drugordersdiseases saveDrugOrder(drugordersdiseases order){
        return dao.saveDrugOrder(order);
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByPatient(Patient patient){
        return dao.getDrugOrdersByPatient(patient);
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersdiseases> getDrugOrdersByDiseaseAndPatient(Concept concept,Patient patient){
        return dao.getDrugOrdersByDiseaseAndPatient(concept, patient);
    }
    
}
