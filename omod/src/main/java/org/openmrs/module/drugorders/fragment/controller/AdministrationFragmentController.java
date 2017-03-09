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
import org.openmrs.ConceptSearchResult;
import org.openmrs.OrderFrequency;
import org.openmrs.api.ConceptService;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.medicationplansService;
import org.openmrs.module.drugorders.medicationplans;
import org.openmrs.ui.framework.SimpleObject;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class AdministrationFragmentController {
    
    public void controller(PageModel model, @RequestParam(value = "disease_name", required = false) String disease_name,
                            @RequestParam(value = "drug_name", required = false) String drug_name,
                            @RequestParam(value = "drugRoute", required = false) String drugRoute,
                            @RequestParam(value = "drugDose", required = false) String drugDose,
                            @RequestParam(value = "drugDoseUnits", required = false) String drugDoseUnits,
                            @RequestParam(value = "drugQuantity", required = false) String drugQuantity,
                            @RequestParam(value = "quantityUnits", required = false) String quantityUnits,
                            @RequestParam(value = "drugDuration", required = false) String drugDuration,
                            @RequestParam(value = "durationUnits", required = false) String durationUnits,
                            @RequestParam(value = "drugFrequency", required = false) String drugFrequency){

        model.addAttribute("disease_name", disease_name);
        List<medicationplans> medPlans = Context.getService(medicationplansService.class).getMedicationPlansByDisease(Context.getConceptService().getConceptByName(disease_name));
        model.addAttribute("medPlans", medPlans);
        
        
        ConceptClass diseaseConcept = Context.getConceptService().getConceptClassByName("Diagnosis");
        List<Concept> diseases = Context.getConceptService().getConceptsByClass(diseaseConcept);
        model.addAttribute("diseases", diseases);
                
        List<String> diseaseNames = new ArrayList<>();
        for(Concept disease : diseases){
            diseaseNames.add(disease.getDisplayString());
        }
        model.addAttribute("diseaseNames", diseaseNames);
        
        
        ConceptClass drugConcept = Context.getConceptService().getConceptClassByName("Drug");
        List<Concept> drugs = Context.getConceptService().getConceptsByClass(drugConcept);
        model.addAttribute("drugs", drugs);
        
        List<String> drugsNames = new ArrayList<>();
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
                                 
        
        ConceptClass doseConcept = Context.getConceptService().getConceptClassByName("Units of Dose");
        List<Concept> doses = Context.getConceptService().getConceptsByClass(doseConcept);
        model.addAttribute("doses", doses);
        
        
        ConceptClass quantityConcept = Context.getConceptService().getConceptClassByName("Units of Quantity");
        List<Concept> quantities = Context.getConceptService().getConceptsByClass(quantityConcept);
        model.addAttribute("quantities", quantities);
 
        List<OrderFrequency> frequencies = Context.getOrderService().getOrderFrequencies(true);
        model.addAttribute("frequencies", frequencies);

    }
    
    
    public List<SimpleObject> getDrugNameSuggestions(
            @RequestParam(value = "query", required = false) String query,
               @SpringBean("conceptService") ConceptService service,
            UiUtils ui) {
        
        ConceptClass drugConcept = Context.getConceptService().getConceptClassByName("Drug");
        List<ConceptClass> requireClasses = new ArrayList<>();
        requireClasses.add(drugConcept);
        
        List<ConceptSearchResult> results = Context.getConceptService().getConcepts(query, null, false, requireClasses, null, null, null, null, 0, 100);
        
        List<Concept> names = new ArrayList<>();
        for (ConceptSearchResult con : results) {
            names.add(con.getConcept());
            System.out.println("Concept: " + con.getConceptName());
        }
        String[] properties = new String[] { "name"};
        return SimpleObject.fromCollection(names, ui, properties);
    }
    
    
    public List<SimpleObject> getPlanNameSuggestions(
            @RequestParam(value = "query", required = false) String query,
               @SpringBean("conceptService") ConceptService service,
            UiUtils ui) {
        
        ConceptClass diseaseConcept = Context.getConceptService().getConceptClassByName("Diagnosis");
        List<ConceptClass> requireClasses = new ArrayList<>();
        requireClasses.add(diseaseConcept);
        
        List<ConceptSearchResult> results = Context.getConceptService().getConcepts(query, null, false, requireClasses, null, null, null, null, 0, 100);
        
        List<Concept> names = new ArrayList<>();
        for (ConceptSearchResult con : results) {
            names.add(con.getConcept());
            System.out.println("Concept: " + con.getConceptName());
        }
        String[] properties = new String[] { "name"};
        return SimpleObject.fromCollection(names, ui, properties);
    }
    
}
