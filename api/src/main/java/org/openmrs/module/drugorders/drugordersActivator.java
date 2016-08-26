/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.drugorders;


import java.util.Locale;
import org.apache.commons.logging.Log; 
import org.apache.commons.logging.LogFactory;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.ConceptDatatype;
import org.openmrs.ConceptName;
import org.openmrs.ConceptSet;
import org.openmrs.GlobalProperty;
import org.openmrs.api.AdministrationService;
import org.openmrs.api.ConceptService;
import org.openmrs.api.context.Context;
import org.openmrs.module.ModuleActivator;

/**
 * This class contains the logic that is run every time this module is either started or stopped.
 */
public class drugordersActivator implements ModuleActivator {
	
	protected Log log = LogFactory.getLog(getClass());
		
	/**
	 * @see ModuleActivator${symbol_pound}willRefreshContext()
	 */
	public void willRefreshContext() {
		log.info("Refreshing drugorders Module");
	}
	
	/**
	 * @see ModuleActivator${symbol_pound}contextRefreshed()
	 */
	public void contextRefreshed() {
		log.info("drugorders Module refreshed");
	}
	
	/**
	 * @see ModuleActivator${symbol_pound}willStart()
	 */
	public void willStart() {
		log.info("Starting drugorders Module");
	}
	
	/**
	 * @see ModuleActivator${symbol_pound}started()
	 */
	public void started() {
		log.info("drugorders Module started");
                AdministrationService administrationService = Context.getAdministrationService();
                setGlobalProperties(administrationService, "order.drugDispensingUnitsConceptUuid", "162384AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
                setGlobalProperties(administrationService, "order.drugDosingUnitsConceptUuid", "162384AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
                setGlobalProperties(administrationService, "order.drugRoutesConceptUuid", "162394AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
                setGlobalProperties(administrationService, "order.durationUnitsConceptUuid", "1732AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
        
                ConceptService cs = Context.getConceptService();
                ConceptClass conceptClass = new ConceptClass();
                conceptClass.setName("Discontinue Order Reasons");
                conceptClass.setDescription("Reasons to discontinue a drug order");
                cs.saveConceptClass(conceptClass);
                
                Concept setConcept = new Concept();
                setConcept.setConceptClass(conceptClass);
                ConceptName setConceptName = new ConceptName("Discontinue Order Reasons",Locale.US);
                setConcept.setFullySpecifiedName(setConceptName);
                ConceptDatatype setConceptDatatype = cs.getConceptDatatype(3);
                setConcept.setDatatype(setConceptDatatype);
                cs.saveConcept(setConcept);
                    
                String orderDiscontinueReasons[] = {"Allergic","Alternative","Ineffective","Not for Sale","Recuperated","Unavailable","Wrong Diagnosis"};
                for(int i=0;i<orderDiscontinueReasons.length;i++){
                    Concept concept = new Concept();
                    concept.setConceptClass(conceptClass);
                    ConceptName conceptName = new ConceptName(orderDiscontinueReasons[i],Locale.US);
                    concept.setFullySpecifiedName(conceptName);
                    concept.addName(conceptName);
                    ConceptDatatype conceptDatatype = cs.getConceptDatatype(3);
                    concept.setDatatype(conceptDatatype);
                    cs.saveConcept(concept);
                    setConcept.addSetMember(concept);
                }
        }
	
	/**
	 * @see ModuleActivator${symbol_pound}willStop()
	 */
	public void willStop() {
		log.info("Stopping drugorders Module");
	}
	
	/**
	 * @see ModuleActivator${symbol_pound}stopped()
	 */
	public void stopped() {
		log.info("drugorders Module stopped");
	}
        
        public void setGlobalProperties(AdministrationService administrationService, String propertyName, String propertyValue){
            
            GlobalProperty glbProp = administrationService.getGlobalPropertyObject(propertyName);
            glbProp.setPropertyValue(propertyValue);
            administrationService.saveGlobalProperty(glbProp);
        }

}
