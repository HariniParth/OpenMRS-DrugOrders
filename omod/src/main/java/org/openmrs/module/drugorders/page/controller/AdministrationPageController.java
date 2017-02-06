/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.page.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.api.APIException;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.medicationplansService;
import org.openmrs.module.drugorders.medicationplans;
import org.openmrs.module.uicommons.util.InfoErrorMessageUtil;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class AdministrationPageController {
    
    private final HashMap<String,String> diseasePlanName = new HashMap<String,String>();
    
    public void controller(PageModel model, HttpSession session, @RequestParam(value = "plan_name", required = false) String plan_name,
                            @RequestParam(value = "disease_name", required = false) String disease_name,
                            @RequestParam(value = "new_disease_name", required = false) String new_disease_name,
                            @RequestParam(value = "diseaseName", required = false) String diseaseNameSelected,
                            @RequestParam(value = "drugName", required = false) String drugNameSelected,
                            @RequestParam(value = "medPlan_id", required = false) String medPlan_id,
                            @RequestParam(value = "action", required = false) String action){
        
        String diseaseName = diseaseNameSelected.trim();
        String drugName = drugNameSelected.trim();
        String oldPlanName = disease_name.trim();
        String newPlanName = new_disease_name.trim();
        
        if(!diseaseName.isEmpty() && !drugName.isEmpty())
            diseasePlanName.put(diseaseName, drugName);
        model.addAttribute("diseasePlanName", diseasePlanName);
        
        if (StringUtils.isNotBlank(action)) {
            try {
                                
                if ("editPlan".equals(action)) {
                    List<medicationplans> medPlans = Context.getService(medicationplansService.class).getMedicationPlansByDisease(Context.getConceptService().getConceptByName(oldPlanName));
                    for(medicationplans medPlan : medPlans){
                        medPlan.setDiseaseId(Context.getConceptService().getConceptByName(newPlanName));
                        Context.getService(medicationplansService.class).saveMedicationPlan(medPlan);
                    }
                    
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Modified!");
                }
                
                if ("deletePlan".equals(action)) {
                    List<medicationplans> medPlans = Context.getService(medicationplansService.class).getMedicationPlansByDisease(Context.getConceptService().getConceptByName(plan_name));
                    for(medicationplans medPlan : medPlans){
                        Context.getService(medicationplansService.class).deleteMedicationPlan(medPlan);
                    }
                    
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Discarded!");
                }
                
                if ("deletePlanItem".equals(action)) {
                    medicationplans medPlan = Context.getService(medicationplansService.class).getMedicationPlan(Integer.parseInt(medPlan_id));
                    Context.getService(medicationplansService.class).deleteMedicationPlan(medPlan);
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Item Discarded!");
                }
                
            } catch(APIException e){
                System.out.println("Error message "+e.getMessage());
            } catch (NumberFormatException e) {
                System.out.println("Error message "+e.getMessage());
            }
        }
        
        HashMap<Concept,List<medicationplans>> allMedicationPlans = new HashMap<Concept,List<medicationplans>>();
        
        ConceptClass diseaseConcept = Context.getConceptService().getConceptClassByName("Diagnosis");
        List<Concept> diseases = Context.getConceptService().getConceptsByClass(diseaseConcept);
        model.addAttribute("diseases", diseases);
        
        for(Concept disease : diseases){
            List<medicationplans> medicationPlans = Context.getService(medicationplansService.class).getMedicationPlansByDisease(disease);
            Collections.sort(medicationPlans,new Comparator<medicationplans>(){

                @Override
                public int compare(medicationplans p1, medicationplans p2) {
                    return p1.getDiseaseId().getDisplayString().compareTo(p2.getDiseaseId().getDisplayString());
                }

            });
            allMedicationPlans.put(disease, medicationPlans);
        }
        
        model.addAttribute("allMedicationPlans", allMedicationPlans);

    }
}
