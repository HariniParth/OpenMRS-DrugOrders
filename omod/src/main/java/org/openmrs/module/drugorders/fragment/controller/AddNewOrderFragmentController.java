/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.ArrayList;
import java.util.List;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.allergyapi.api.PatientService;
import org.openmrs.module.drugorders.api.medicationplansService;
import org.openmrs.module.drugorders.medicationplans;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */

public class AddNewOrderFragmentController {
    
    /**
     *
     * @param model
     * @param diseaseForPlan
     * @param diseaseNameSelected
     * @param patient
     * @param patientService
     */
    
    public void controller(PageModel model, 
            @RequestParam(value = "diseaseForPlan", required = false) String diseaseForPlan,
            @RequestParam(value = "diseaseName", required = false) String diseaseNameSelected,
            @RequestParam("patientId") Patient patient, @SpringBean("allergyService") PatientService patientService){

        model.addAttribute("diseaseForPlan", diseaseForPlan);
        model.addAttribute("patientid", patient.getPatientId());
                
        String diseaseNameEntered = diseaseNameSelected.trim();
        model.addAttribute("diseaseName", diseaseNameEntered);
        
        List<medicationplans> medplans = Context.getService(medicationplansService.class).getMedicationPlansByDisease(Context.getConceptService().getConceptByName(diseaseNameEntered));
        model.addAttribute("medplans", medplans);
        
        List<String> drugsNames = new ArrayList<String>();
        for(medicationplans medplan : medplans){
            drugsNames.add(medplan.getDrugId().getDisplayString().trim());
        }
        model.addAttribute("drugsNames", drugsNames);
        
        int number_of_allergic_drugs = patientService.getAllergies(patient).size();
        if(number_of_allergic_drugs >=1){
            ArrayList<String> allergen = new ArrayList<String>();
            for(int i=0;i<number_of_allergic_drugs;i++){
                allergen.add(patientService.getAllergies(patient).get(i).getAllergen().toString().trim());
            }
            model.addAttribute("allergicDrugs", allergen);
        } else {
            model.addAttribute("allergicDrugs", "null");
        } 
        
        
        ConceptClass diseaseConcept = Context.getConceptService().getConceptClassByName("Diagnosis");
        List<Concept> diagnosis = Context.getConceptService().getConceptsByClass(diseaseConcept);
        model.addAttribute("diagnosis", diagnosis);
        
        List<String> diseaseNames = new ArrayList<String>();
        for(Concept diagnosisName : diagnosis){
            if(Context.getService(medicationplansService.class).getMedicationPlansByDisease(diagnosisName).size() > 0){
                diseaseNames.add(diagnosisName.getDisplayString());
            }
        }
        model.addAttribute("diseaseNames", diseaseNames);
    }
}
