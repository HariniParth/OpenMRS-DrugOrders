/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.drugorders.api.db.medicationplansDAO;
import org.openmrs.module.drugorders.api.medicationplansService;
import org.openmrs.module.drugorders.medicationplans;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author harini-geek
 */
public class medicationplansServiceImpl extends BaseOpenmrsService implements medicationplansService{
    
    protected final Log log = LogFactory.getLog(this.getClass());

    private medicationplansDAO dao;
	
    public void setDao(medicationplansDAO dao) {
	    this.dao = dao;
    }
    
    public Log getLog() {
        return log;
    }

    public medicationplansDAO getDao() {
	    return dao;
    }
    
    /**
     *
     * @param doe
     * @return
     */
    @Transactional
    @Override
    public medicationplans saveNewTable(medicationplans doe) {
        return dao.saveNewTable(doe);
    }
}
