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
import org.openmrs.Concept;
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
 	                    @RequestParam(value = "associatedDiagnosis", required = false) String associatedDiagnosis,
                            @RequestParam(value = "drugRoute", required = false) String drugRoute,
                            @RequestParam(value = "drugDose", required = false) Integer drugDose,
                            @RequestParam(value = "drugDoseUnits", required = false) String drugDoseUnits,
                            @RequestParam(value = "drugQuantity", required = false) Integer drugQuantity,
                            @RequestParam(value = "quantityUnits", required = false) String quantityUnits,
                            @RequestParam(value = "drugFrequency", required = false) String drugFrequency,
                            @RequestParam(value = "drugDuration", required = false) Integer drugDuration,
                            @RequestParam(value = "durationUnits", required = false) String durationUnits,
                            @RequestParam(value = "patientInstructions", required = false) String patientInstructions,
                            @RequestParam(value = "pharmacistInstructions", required = false) String pharmacistInstructions,
                            @SpringBean("allergyService") PatientService patientService) {
 		
 		model.addAttribute("patient", patient);
 		model.addAttribute("allergies", patientService.getAllergies(patient));
                
                
                if(!(drugNameEntered.equals(""))) {
                    drugorders drugorders = new drugorders();
                    drugorders.setDrugname(drugNameEntered);
                    drugorders.setStartdate(startDateConfirmed);
                    
                    int routeConcept = Context.getConceptService().getConceptByName(drugRoute).getConceptId();
                    drugorders.setRoute(routeConcept);
                    
                    drugorders.setDose(drugDose);
                    int doseConcept = Context.getConceptService().getConceptByName(drugDoseUnits).getConceptId();
                    drugorders.setDoseunits(doseConcept);
                    
                    drugorders.setQuantity(drugQuantity);
                    int quantityConcept = Context.getConceptService().getConceptByName(quantityUnits).getConceptId();
                    drugorders.setQuantityunits(quantityConcept);
                    
                    drugorders.setDuration(drugDuration);
                    int durationConcept = Context.getConceptService().getConceptByName(durationUnits).getConceptId();
                    drugorders.setDurationunits(durationConcept);
                    
                    int frequencyConcept = Context.getConceptService().getConceptByName(drugFrequency).getConceptId();
                    drugorders.setFrequency(frequencyConcept);
                    
                    drugorders.setAssociateddiagnosis(associatedDiagnosis);
                    drugorders.setPatientinstructions(patientInstructions);
                    drugorders.setPharmacistinstructions(pharmacistInstructions);
                    drugorders.setPatientid(Integer.toString(patient.getPatientId()));
                    Context.getService(drugordersService.class).saveNewTable(drugorders);
                }   
                                
 	}
}
