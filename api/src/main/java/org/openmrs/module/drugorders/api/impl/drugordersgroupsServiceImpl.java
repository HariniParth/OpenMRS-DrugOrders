/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api.impl;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.drugorders.api.db.drugordersgroupsDAO;
import org.openmrs.module.drugorders.api.drugordersgroupsService;
import org.openmrs.module.drugorders.drugordersgroups;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author harini-geek
 */
public class drugordersgroupsServiceImpl extends BaseOpenmrsService implements drugordersgroupsService{
    
    protected final Log log = LogFactory.getLog(this.getClass());
    
    private drugordersgroupsDAO dao;
    
    /**
     * @param dao the dao to set
    */
    
    public void setDao(drugordersgroupsDAO dao) {
	    this.dao = dao;
    }
    
    public Log getLog() {
        return log;
    }
    
    /**
     * @return the dao
     */
    public drugordersgroupsDAO getDao() {
	    return dao;
    }
    
    @Transactional(readOnly = true)
    @Override
    public List<drugordersgroups> getDrugOrdersByGroupID(Integer id){
        return dao.getDrugOrdersByGroupID(id);
    }
}
