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
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.OrderFrequency;
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
    
    private final HashMap<String,String> medPlanName = new HashMap<>();
    
    public void controller(PageModel model, HttpSession session, @RequestParam(value = "planId", required = false) String planId,
                            @RequestParam(value = "planName", required = false) String planName,
                            @RequestParam(value = "drugName", required = false) String drugName,
                            @RequestParam(value = "drugRoute", required = false) String drugRoute,
                            @RequestParam(value = "drugDose", required = false) String drugDose,
                            @RequestParam(value = "drugDoseUnits", required = false) String drugDoseUnits,
                            @RequestParam(value = "drugQuantity", required = false) String drugQuantity,
                            @RequestParam(value = "quantityUnits", required = false) String quantityUnits,
                            @RequestParam(value = "drugDuration", required = false) Integer drugDuration,
                            @RequestParam(value = "durationUnits", required = false) String durationUnits,
                            @RequestParam(value = "drugFrequency", required = false) String drugFrequency,
                            @RequestParam(value = "planToDiscard", required = false) String planToDiscard,
                            @RequestParam(value = "oldPlanName", required = false) String oldPlanName,
                            @RequestParam(value = "newPlanName", required = false) String newPlanName,
                            @RequestParam(value = "drugId", required = false) String drugId,
                            @RequestParam(value = "action", required = false) String action){
        
        planName = planName.trim();
        drugName = drugName.trim();
        oldPlanName = oldPlanName.trim();
        newPlanName = newPlanName.trim();
        
        if(!planName.isEmpty() && !drugName.isEmpty())
            medPlanName.put(planName, drugName);
        model.addAttribute("medPlanName", medPlanName);
        
        if (StringUtils.isNotBlank(action)) {
            try {
                if ("addPlan".equals(action)) {
                    medicationplans medPlans = new medicationplans();
                    medPlans.setUuid(UUID.randomUUID().toString());
                    medPlans.setDose(Double.valueOf(drugDose));
                    medPlans.setQuantity(Double.valueOf(drugQuantity));
                    medPlans.setDiseaseId(Context.getConceptService().getConceptByName(planName));
                    medPlans.setDrugId(Context.getConceptService().getConceptByName(drugName));
                    medPlans.setDoseUnits(Context.getConceptService().getConceptByName(drugDoseUnits));
                    medPlans.setDuration(drugDuration);
                    medPlans.setDurationUnits(Context.getConceptService().getConceptByName(durationUnits));
                    medPlans.setQuantityUnits(Context.getConceptService().getConceptByName(quantityUnits));
                    medPlans.setRoute(Context.getConceptService().getConceptByName(drugRoute));

                    OrderFrequency orderFrequency = Context.getOrderService().getOrderFrequencyByConcept(Context.getConceptService().getConceptByName(drugFrequency));
                    if (orderFrequency == null) {
                        medPlans.setFrequency(setOrderFrequency(drugFrequency));
                    } else {
                        medPlans.setFrequency(orderFrequency);
                    } 
                    
                    if(!(planId.equals(""))){
                        Context.getService(medicationplansService.class).deleteMedicationPlan(Context.getService(medicationplansService.class).getMedicationPlan(Integer.parseInt(planId)));
                    }
                    
                    Context.getService(medicationplansService.class).saveMedicationPlan(medPlans);
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Saved!");
                }
                
                if ("editPlan".equals(action)) {
                    List<medicationplans> medPlans = Context.getService(medicationplansService.class).getMedicationPlansByDisease(Context.getConceptService().getConceptByName(oldPlanName));
                    for(medicationplans medPlan : medPlans){
                        medPlan.setDiseaseId(Context.getConceptService().getConceptByName(newPlanName));
                        Context.getService(medicationplansService.class).saveMedicationPlan(medPlan);
                    }
                    
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Modified!");
                }
                
                if ("deletePlan".equals(action)) {
                    List<medicationplans> medPlans = Context.getService(medicationplansService.class).getMedicationPlansByDisease(Context.getConceptService().getConceptByName(planToDiscard));
                    for(medicationplans medPlan : medPlans){
                        Context.getService(medicationplansService.class).deleteMedicationPlan(medPlan);
                    }
                    
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Discarded!");
                }
                
                if ("deletePlanItem".equals(action)) {
                    medicationplans medPlan = Context.getService(medicationplansService.class).getMedicationPlan(Integer.parseInt(drugId));
                    Context.getService(medicationplansService.class).deleteMedicationPlan(medPlan);
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Item Discarded!");
                }
                
            } catch(APIException | NumberFormatException e){
                System.out.println("Error message "+e.getMessage());
            }
        }
        
        HashMap<Concept,List<medicationplans>> allMedicationPlans = new HashMap<>();
        
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
    
    private OrderFrequency setOrderFrequency(String Frequency) {

        OrderFrequency orderFrequency = new OrderFrequency();
        orderFrequency.setFrequencyPerDay(0.0);
        orderFrequency.setConcept(Context.getConceptService().getConceptByName(Frequency));
        orderFrequency = (OrderFrequency) Context.getOrderService().saveOrderFrequency(orderFrequency);
        return orderFrequency;

    }
}
