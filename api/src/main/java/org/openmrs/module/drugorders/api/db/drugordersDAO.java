/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.drugorders.api.db;

import java.util.List;
import org.openmrs.Patient;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.drugorders;

/**
 *  Database methods for {@link drugordersService}.
 */
public interface drugordersDAO {
	
	/*
	 * Add DAO methods here
	 */
    	public drugorders getNewTable(Integer id);

	public drugorders getNewTableByUuid(String uuid);

	public drugorders saveNewTable(drugorders newTable);
        
        public void deleteNewTable(drugorders newTable);

        public List<drugorders> getNewTablesByPatient(Patient patient);
}