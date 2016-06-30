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
    public drugorders getNewTableByUuid(String uuid) {
        return dao.getNewTableByUuid(uuid);
    }

    @Transactional(readOnly = true)
    @Override
    public drugorders getNewTable(Integer id) {
        return dao.getNewTable(id);
    }

    @Transactional
    @Override
    public drugorders saveNewTable(drugorders doe) {
        return dao.saveNewTable(doe);
    }

    @Transactional(readOnly = true)
    @Override
    public List<drugorders> getNewTablesByPatient(Patient patient) {
        return dao.getNewTablesByPatient(patient);
    }
}