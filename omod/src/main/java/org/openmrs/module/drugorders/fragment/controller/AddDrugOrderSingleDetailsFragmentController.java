/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.codehaus.jackson.map.ObjectMapper;
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
public class AddDrugOrderSingleDetailsFragmentController {
    
    /**
     *
     * @param model
     * @param drugname
     * @param patient
     */

    List<Concept> diagnosis = new ArrayList<Concept>();
    List<Concept> durations = new ArrayList<Concept>();
    List<Concept> routes = new ArrayList<Concept>();
    List<Concept> doses = new ArrayList<Concept>();
    List<Concept> quantities = new ArrayList<Concept>();
    List<Concept> frequencies = new ArrayList<Concept>();
        
    public void controller(PageModel model, @RequestParam(value = "drugname", required = false) String drugname,
                            @RequestParam(value = "startDate", required = false) Date startDate,
                            @RequestParam(value = "drugNameEntered", required = false) String drugNameEntered,
                            @RequestParam(value = "startDateEntered", required = false) Date startDateEntered,
                            @RequestParam(value = "allergicOrderReasonEntered", required = false) String allergicOrderReasonEntered,
                            @RequestParam(value = "drugRoute", required = false) String drugRoute,
                            @RequestParam(value = "drugDose", required = false) String drugDose,
                            @RequestParam(value = "drugDoseUnits", required = false) String drugDoseUnits,
                            @RequestParam(value = "drugQuantity", required = false) String drugQuantity,
                            @RequestParam(value = "quantityUnits", required = false) String quantityUnits,
                            @RequestParam(value = "drugDuration", required = false) Integer drugDuration,
                            @RequestParam(value = "durationUnits", required = false) String durationUnits,
                            @RequestParam(value = "drugFrequency", required = false) String drugFrequency,
                            @RequestParam(value = "associatedDiagnosis", required = false) String associatedDiagnosis,
                            @RequestParam(value = "patientInstructions", required = false) String patientInstructions,
                            @RequestParam(value = "pharmacistInstructions", required = false) String pharmacistInstructions,
                            @RequestParam("patientId") Patient patient){
        
        model.addAttribute("drugname", drugname);
        model.addAttribute("startDate", startDate);
        model.addAttribute("patientid", patient.getPatientId());
        model.addAttribute("drugNameEntered", drugNameEntered);
        model.addAttribute("startDateEntered", startDateEntered);
        model.addAttribute("allergicOrderReasonEntered", allergicOrderReasonEntered);
        model.addAttribute("drugRoute", drugRoute);
        model.addAttribute("drugDose", drugDose);
        model.addAttribute("drugDoseUnits", drugDoseUnits);
        model.addAttribute("drugQuantity", drugQuantity);
        model.addAttribute("quantityUnits", quantityUnits);
        model.addAttribute("drugDuration", drugDuration);
        model.addAttribute("durationUnits", durationUnits);
        model.addAttribute("drugFrequency", drugFrequency);
        model.addAttribute("associatedDiagnosis", associatedDiagnosis);
        model.addAttribute("patientInstructions", patientInstructions);
        model.addAttribute("pharmacistInstructions", pharmacistInstructions);

        ObjectMapper mapper = new ObjectMapper();
        
        Concept durationConcept = Context.getConceptService().getConcept(1732);
        Concept routeConcept = Context.getConceptService().getConcept(162394);
        Concept diagnosisConcept = Context.getConceptService().getConcept(160168);
        
        for(ConceptSet durationConcepts : durationConcept.getConceptSets()){
            Concept durationMember = durationConcepts.getConcept();
            durations.add(durationMember);
        }
                                                                        
        for(ConceptSet routeConcepts : routeConcept.getConceptSets()){
            Concept routeMember = routeConcepts.getConcept();
            routes.add(routeMember);
        }
        
        for(ConceptSet diagnosisConcepts : diagnosisConcept.getConceptSets()){
            Concept diagnosisMember = diagnosisConcepts.getConcept();
            diagnosis.add(diagnosisMember);
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
   
        model.addAttribute("diagnosis", diagnosis);
        model.addAttribute("durations", durations);
        model.addAttribute("routes", routes);
        model.addAttribute("doses", doses);
        model.addAttribute("quantities", quantities);
        model.addAttribute("frequencies", frequencies);
        
        List<String> diagnosisNames = new ArrayList<String>();
        for(Concept diagnosisName : diagnosis){
            diagnosisNames.add(diagnosisName.getDisplayString());
        }
        model.addAttribute("diagnosisNames", diagnosisNames);

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