/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.page.controller;

/**
 *
 * @author harini-geek
 */

import java.util.Date;
import java.util.List;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.allergyapi.api.PatientService;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

public class DrugordersPageController {
    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient, 
                            @RequestParam(value = "drugNameEntered", required = false) String drugNameEntered,
                            @RequestParam(value = "startDateConfirmed", required = false) Date startDateConfirmed,
                            UiUtils ui, @RequestParam(value = "allergicOrderReason", required = false) String allergicOrderReason,
 	                       @SpringBean("allergyService") PatientService patientService) {
 		
 		model.addAttribute("patient", patient);
 		model.addAttribute("allergies", patientService.getAllergies(patient));
                
                if(!(drugNameEntered.equals(""))) {
                    drugorders drugorders = new drugorders();
                    drugorders.setDrugname(drugNameEntered);
                    drugorders.setPatientid(Integer.toString(patient.getPatientId()));
                    Context.getService(drugordersService.class).saveNewTable(drugorders);
                }
                                
 	}
}
