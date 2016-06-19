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
import org.openmrs.Patient;
import org.openmrs.api.ConceptService;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.drugorders;
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
     * @param drugname
     * @param patient
     */
    public void controller(PageModel model, @RequestParam(value = "drugname", required = false) String drugname,
            @RequestParam("patientId") Patient patient){
        
        model.addAttribute("drugname", drugname);
        model.addAttribute("patientid", patient.getPatientId());
        drugorders drugorders = new drugorders();
        drugorders.setDrugname(drugname);
        drugorders.setPatientid(Integer.toString(patient.getPatientId()));
        Context.getService(drugordersService.class).saveNewTable(drugorders);
        
        List<Concept> allConcepts = new ArrayList<Concept>();
        List<Concept> durations = new ArrayList<Concept>();
        Concept con = Context.getConceptService().getConcept(1732);
        for(ConceptSet durationConcepts : con.getConceptSets()){
            Concept durationMember = durationConcepts.getConcept();
            durations.add(durationMember);
            System.out.print(durationMember);
        }
        allConcepts.add(con);
        model.addAttribute("durationOptions", allConcepts);
        model.addAttribute("durations", durations);
    }
}
