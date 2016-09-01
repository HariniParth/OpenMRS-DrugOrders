/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.page.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import org.apache.commons.lang.StringUtils;
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
public class AdministrationPageController {
    
    private final HashMap<String,String> diseasePlanName = new HashMap<String,String>();
    
    public void controller(PageModel model, @RequestParam(value = "disease_name", required = false) String disease_name,
                            @RequestParam(value = "diseaseName", required = false) String diseaseNameSelected,
                            @RequestParam(value = "drugName", required = false) String drugNameSelected,
                            @RequestParam(value = "medPlan_id", required = false) String medPlan_id,
                            @RequestParam(value = "action", required = false) String action){
        
        String diseaseName = diseaseNameSelected.replace(" ", "");
        String drugName = drugNameSelected.replace(" ", "");
        
        if(!diseaseName.isEmpty() && !drugName.isEmpty())
            diseasePlanName.put(diseaseName, drugName);
        model.addAttribute("diseasePlanName", diseasePlanName);
        
        if (StringUtils.isNotBlank(action)) {
            try {
                if ("confirmPlanItem".equals(action)) {
                    medicationplans medPlans = (medicationplans) model.getAttribute("medicationplans");
                    System.out.println("Saving plan for "+medPlans.getDiseaseid().getDisplayString());
                    Context.getService(medicationplansService.class).saveNewTable(medPlans);
                }
                if ("deletePlan".equals(action)) {
                    List<medicationplans> medPlans = Context.getService(medicationplansService.class).getMedicationPlansByDisease(Context.getConceptService().getConceptByName(disease_name));
                    for(medicationplans medPlan : medPlans){
                        Context.getService(medicationplansService.class).deleteMedicationPlan(medPlan);
                    }
                }
                if ("deletePlanItem".equals(action)) {
                    medicationplans medPlan = Context.getService(medicationplansService.class).getMedicationPlan(Integer.parseInt(medPlan_id));
                    Context.getService(medicationplansService.class).deleteMedicationPlan(medPlan);
                }
            } catch(Exception e){
                System.out.println("Error message "+e.getMessage());
            }
        }
        
        HashMap<Concept,List<medicationplans>> allMedicationPlans = new HashMap<Concept,List<medicationplans>>();
        List<Concept> diseases = new ArrayList<Concept>();
        Concept diseaseConcept = Context.getConceptService().getConcept(160168);
        
        for(ConceptSet diseaseConcepts : diseaseConcept.getConceptSets()){
            Concept diseaseMember = diseaseConcepts.getConcept();
            diseases.add(diseaseMember);
        }
        model.addAttribute("diseases", diseases);
        
        for(Concept disease : diseases){
            List<medicationplans> medicationPlans = Context.getService(medicationplansService.class).getMedicationPlansByDisease(disease);
            Collections.sort(medicationPlans,new Comparator<medicationplans>(){

                @Override
                public int compare(medicationplans p1, medicationplans p2) {
                    return p1.getDiseaseid().getDisplayString().compareTo(p2.getDiseaseid().getDisplayString());
                }

            });
            allMedicationPlans.put(disease, medicationPlans);
        }
        
        model.addAttribute("allMedicationPlans", allMedicationPlans);

    }
}
