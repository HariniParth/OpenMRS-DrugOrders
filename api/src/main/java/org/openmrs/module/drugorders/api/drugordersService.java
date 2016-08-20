/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.drugorders.api;

import java.util.List;
import org.openmrs.Patient;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.drugorders.drugorders;
import org.springframework.transaction.annotation.Transactional;

/**
 * This service exposes module's core functionality. It is a Spring managed bean which is configured in moduleApplicationContext.xml.
 * <p>
 * It can be accessed only via Context:<br>
 * <code>
 * Context.getService(${module-name-no-spaces}Service.class).someMethod();
 * </code>
 * 
 * @see org.openmrs.api.context.Context
 */
@Transactional
public interface drugordersService extends OpenmrsService {
     
	/*
	 * Add service methods here
	 * 
	 */
    
    public drugorders saveNewTable(drugorders newTable);
    public void deleteNewTable(drugorders newTable);
    public drugorders getNewTable(Integer id);
    public drugorders getNewTableByUuid(String uuid);
    public List<drugorders> getNewTablesByPatient(Patient patient);
    public List<drugorders> getDrugOrdersByStatus(String status);
    
}