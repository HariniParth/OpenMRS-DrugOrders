/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.ConceptSearchResult;
import org.openmrs.OrderFrequency;
import org.openmrs.Patient;
import org.openmrs.api.ConceptService;
import org.openmrs.api.context.Context;
import org.openmrs.module.allergyapi.api.PatientService;
import org.openmrs.ui.framework.SimpleObject;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class AddDrugOrderSingleDetailsFragmentController {
    
    /**
     *
     * @param model
     * @param patient
     * @param patientService
     */
    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient,
                            @SpringBean("allergyService") PatientService patientService){
                
        Date startDate = Calendar.getInstance().getTime();
        model.addAttribute("startDate", startDate);
        
        int number_of_allergic_drugs = patientService.getAllergies(patient).size();
        if(number_of_allergic_drugs >=1){
            ArrayList<String> allergen = new ArrayList<String>();
            for(int i=0;i<number_of_allergic_drugs;i++){
                allergen.add(patientService.getAllergies(patient).get(i).getAllergen().toString());
                model.addAttribute("allergicDrugs", allergen);
            }
        } else {
            model.addAttribute("allergicDrugs", "null");
        }        
        
        ConceptClass drugConcept = Context.getConceptService().getConceptClassByName("Drug");
        List<Concept> drugs = Context.getConceptService().getConceptsByClass(drugConcept);
        model.addAttribute("drugs", drugs);
        
        List<String> drugsNames = new ArrayList<String>();
        for(Concept drug : drugs){
            drugsNames.add(drug.getDisplayString());
        }
        model.addAttribute("drugsNames", drugsNames);
        
        
        ConceptClass durationConcept = Context.getConceptService().getConceptClassByName("Units of Duration");
        List<Concept> durations = Context.getConceptService().getConceptsByClass(durationConcept);
        model.addAttribute("durations", durations);
                                                                        
        
        ConceptClass routeConcept = Context.getConceptService().getConceptClassByName("Routes of drug administration");
        List<Concept> routes = Context.getConceptService().getConceptsByClass(routeConcept);
        model.addAttribute("routes", routes);
        
        
        ConceptClass diseaseConcept = Context.getConceptService().getConceptClassByName("Diagnosis");
        List<Concept> diagnosis = Context.getConceptService().getConceptsByClass(diseaseConcept);
        model.addAttribute("diagnosis", diagnosis);
        
        List<String> diagnosisNames = new ArrayList<String>();
        for(Concept diag : diagnosis){
            diagnosisNames.add(diag.getDisplayString());
        }
        model.addAttribute("diagnosisNames", diagnosisNames);
        
        
        ConceptClass doseConcept = Context.getConceptService().getConceptClassByName("Units of Dose");
        List<Concept> doses = Context.getConceptService().getConceptsByClass(doseConcept);
        model.addAttribute("doses", doses);
        
        
        ConceptClass quantityConcept = Context.getConceptService().getConceptClassByName("Units of Quantity");
        List<Concept> quantities = Context.getConceptService().getConceptsByClass(quantityConcept);
        model.addAttribute("quantities", quantities);
 
        
        List<OrderFrequency> frequencies = Context.getOrderService().getOrderFrequencies(true);
        model.addAttribute("frequencies", frequencies);
        
        
        ConceptClass priorityConcept = Context.getConceptService().getConceptClassByName("Order Priority");
        List<Concept> priorities = Context.getConceptService().getConceptsByClass(priorityConcept);
        model.addAttribute("priorities", priorities);

    }
    
    
    public List<SimpleObject> getDrugNameSuggestions(
            @RequestParam(value = "query", required = false) String query,
               @SpringBean("conceptService") ConceptService service,
            UiUtils ui) {
        
        ConceptClass drugConcept = Context.getConceptService().getConceptClassByName("Drug");
        List<ConceptClass> requireClasses = new ArrayList<ConceptClass>();
        requireClasses.add(drugConcept);
        
        List<ConceptSearchResult> results = Context.getConceptService().getConcepts(query, null, false, requireClasses, null, null, null, null, 0, 100);
        
        List<Concept> names = new ArrayList<Concept>();
        for (ConceptSearchResult con : results) {
            names.add(con.getConcept()); //con.getConcept().getName().getName()
            System.out.println("Concept: " + con.getConceptName());
        }
        String[] properties = new String[] { "name"};
        return SimpleObject.fromCollection(names, ui, properties);
    }
    
    
    public List<SimpleObject> getDiseaseNameSuggestions(
            @RequestParam(value = "query", required = false) String query,
               @SpringBean("conceptService") ConceptService service,
            UiUtils ui) {
        
        ConceptClass diseaseConcept = Context.getConceptService().getConceptClassByName("Diagnosis");
        List<ConceptClass> requireClasses = new ArrayList<ConceptClass>();
        requireClasses.add(diseaseConcept);
        
        List<ConceptSearchResult> results = Context.getConceptService().getConcepts(query, null, false, requireClasses, null, null, null, null, 0, 100);
        
        List<Concept> names = new ArrayList<Concept>();
        for (ConceptSearchResult con : results) {
            names.add(con.getConcept()); //con.getConcept().getName().getName()
            System.out.println("Concept: " + con.getConceptName());
        }
        String[] properties = new String[] { "name"};
        return SimpleObject.fromCollection(names, ui, properties);
    }

}