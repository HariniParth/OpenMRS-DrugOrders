/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.ArrayList;
import java.util.List;
import org.openmrs.Concept;
import org.openmrs.ConceptSet;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.medicationplansService;
import org.openmrs.module.drugorders.medicationplans;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class AdministrationFragmentController {
    
    List<Concept> drugs = new ArrayList<Concept>();
    List<Concept> diseases = new ArrayList<Concept>();
    List<Concept> durations = new ArrayList<Concept>();
    List<Concept> routes = new ArrayList<Concept>();
    List<Concept> doses = new ArrayList<Concept>();
    List<Concept> quantities = new ArrayList<Concept>();
    List<Concept> frequencies = new ArrayList<Concept>();
    
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
        System.out.println(medPlans);
        
        Concept diseaseConcept = Context.getConceptService().getConcept(160168);
        
        for(ConceptSet diseaseConcepts : diseaseConcept.getConceptSets()){
            Concept diseaseMember = diseaseConcepts.getConcept();
            diseases.add(diseaseMember);
        }
        model.addAttribute("diseases", diseases);
                
        List<String> diseaseNames = new ArrayList<String>();
        for(Concept diagnosisName : diseases){
            diseaseNames.add(diagnosisName.getDisplayString());
        }
        model.addAttribute("diseaseNames", diseaseNames);
        
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
        
        Concept durationConcept = Context.getConceptService().getConcept(1732);
        Concept routeConcept = Context.getConceptService().getConcept(162394);
        
        for(ConceptSet durationConcepts : durationConcept.getConceptSets()){
            Concept durationMember = durationConcepts.getConcept();
            durations.add(durationMember);
        }
                                                                        
        for(ConceptSet routeConcepts : routeConcept.getConceptSets()){
            Concept routeMember = routeConcepts.getConcept();
            routes.add(routeMember);
        }
                
        addDoseMember(162358);
        addDoseMember(161554);
        addDoseMember(162262);
        addDoseMember(162263);
        addDoseMember(161553);
        addDoseMember(162366);
        
        addQuantityMember(1608);
        addQuantityMember(162356);
        addQuantityMember(162377);
        addQuantityMember(1513);
        addQuantityMember(162378);
        addQuantityMember(162379);
        addQuantityMember(162380);
        addQuantityMember(162382);
        
        addFrequencyMember(160862);
        addFrequencyMember(160858);
        addFrequencyMember(160866);
        addFrequencyMember(160870);
        addFrequencyMember(1098);
        addFrequencyMember(1099);
        addFrequencyMember(162245);
        addFrequencyMember(162247);
   
        model.addAttribute("durations", durations);
        model.addAttribute("routes", routes);
        model.addAttribute("doses", doses);
        model.addAttribute("quantities", quantities);
        model.addAttribute("frequencies", frequencies);

    }
    
    void addDoseMember(int conceptNumber) {
        Concept doseMember = Context.getConceptService().getConcept(conceptNumber);
        doses.add(doseMember);
    }
    
    void addQuantityMember(int conceptNumber) {
        Concept quantityMember = Context.getConceptService().getConcept(conceptNumber);
        quantities.add(quantityMember);
    }
    
    void addFrequencyMember(int conceptNumber) {
        Concept frequencyMember = Context.getConceptService().getConcept(conceptNumber);
        frequencies.add(frequencyMember);
    }
}
