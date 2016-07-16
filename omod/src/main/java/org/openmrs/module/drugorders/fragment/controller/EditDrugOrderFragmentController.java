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
import org.openmrs.ui.framework.page.PageModel;

/**
 *
 * @author harini-geek
 */
public class EditDrugOrderFragmentController {
    
    List<Concept> durations = new ArrayList<Concept>();
    List<Concept> routes = new ArrayList<Concept>();
    List<Concept> doses = new ArrayList<Concept>();
    List<Concept> quantities = new ArrayList<Concept>();
    List<Concept> frequencies = new ArrayList<Concept>();
    
    public void controller(PageModel model){
        
        Concept con1 = Context.getConceptService().getConcept(1732);
        Concept con2 = Context.getConceptService().getConcept(162394);
        
        for(ConceptSet durationConcepts : con1.getConceptSets()){
            Concept durationMember = durationConcepts.getConcept();
            durations.add(durationMember);
        }
                                                                        
        for(ConceptSet routeConcepts : con2.getConceptSets()){
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