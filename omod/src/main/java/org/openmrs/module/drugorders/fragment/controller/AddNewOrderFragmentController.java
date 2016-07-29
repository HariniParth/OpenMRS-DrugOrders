/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.openmrs.Concept;
import org.openmrs.ConceptSet;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
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
     * @param drugname
     * @param allergicOrderReason
     * @param startDate
     * @param patient
     */
    
    List<Concept> drugs = new ArrayList<Concept>();
    List<Concept> diseases = new ArrayList<Concept>();
    
    public void controller(PageModel model, @RequestParam(value = "drugname", required = false) String drugname,
            @RequestParam(value = "disease_name", required = false) String disease_name,
            @RequestParam(value = "startDate", required = false) Date startDate,
            @RequestParam(value = "medPlanStartDate", required = false) Date medPlanStartDate,
            @RequestParam(value = "allergicOrderReason", required = false) String allergicOrderReason,
            @RequestParam("patientId") Patient patient){

        model.addAttribute("drugname", drugname);
        model.addAttribute("disease_name", disease_name);
        model.addAttribute("medPlanStartDate", medPlanStartDate);
        model.addAttribute("startDate", startDate);
        model.addAttribute("patientid", patient.getPatientId());
        model.addAttribute("allergicOrderReason", allergicOrderReason);
        
        Concept drugConcept = Context.getConceptService().getConcept(162552);
        
        for(ConceptSet drugConcepts : drugConcept.getConceptSets()){
            Concept drugMember = drugConcepts.getConcept();
            drugs.add(drugMember);
        }

        model.addAttribute("drugs", drugs);
        
        List<String> drugsNames = new ArrayList<String>();
        for(Concept drug : drugs){
            drugsNames.add(drug.getDisplayString());
        }
        model.addAttribute("drugsNames", drugsNames);
        
        
        Concept diseaseConcept = Context.getConceptService().getConcept(160168);
        
        for(ConceptSet diseaseConcepts : diseaseConcept.getConceptSets()){
            Concept diseaseMember = diseaseConcepts.getConcept();
            diseases.add(diseaseMember);
        }
        
        model.addAttribute("diagnosis", diseases);
        
        List<String> diseaseNames = new ArrayList<String>();
        for(Concept diagnosisName : diseases){
            diseaseNames.add(diagnosisName.getDisplayString());
        }
        model.addAttribute("diseaseNames", diseaseNames);
    }
}
