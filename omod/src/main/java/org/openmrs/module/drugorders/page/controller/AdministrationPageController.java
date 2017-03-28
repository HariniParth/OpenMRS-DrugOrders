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
import org.openmrs.OrderFrequency;
import org.openmrs.api.APIException;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.standardplansService;
import org.openmrs.module.drugorders.standardplans;
import org.openmrs.module.uicommons.util.InfoErrorMessageUtil;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class AdministrationPageController {
        
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
                
        if (StringUtils.isNotBlank(action)) {
            try {
                if ("addPlan".equals(action)) {
                    standardplans medPlans = new standardplans();
                    medPlans.setPlanId(ConceptName(planName.trim()));
                    medPlans.setDrugId(ConceptName(drugName.trim()));
                    medPlans.setRoute(ConceptName(drugRoute));
                    medPlans.setDose(Double.valueOf(drugDose));
                    medPlans.setDoseUnits(ConceptName(drugDoseUnits));
                    medPlans.setDuration(drugDuration);
                    medPlans.setDurationUnits(ConceptName(durationUnits));
                    medPlans.setQuantity(Double.valueOf(drugQuantity));
                    medPlans.setQuantityUnits(ConceptName(quantityUnits));
                    
                    OrderFrequency orderFrequency = Context.getOrderService().getOrderFrequencyByConcept(ConceptName(drugFrequency));
                    if (orderFrequency == null) {
                        medPlans.setFrequency(setOrderFrequency(drugFrequency));
                    } else {
                        medPlans.setFrequency(orderFrequency);
                    } 
                    
                    if(!(planId.equals(""))){
                        Context.getService(standardplansService.class).deleteMedicationPlan(Context.getService(standardplansService.class).getMedicationPlan(Integer.parseInt(planId)));
                    }
                    Context.getService(standardplansService.class).saveMedicationPlan(medPlans);
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Saved!");
                }
                
                if ("renamePlan".equals(action)) {
                    List<standardplans> medPlans = Context.getService(standardplansService.class).getMedicationPlansByDisease(ConceptName(oldPlanName.trim()));
                    for(standardplans medPlan : medPlans){
                        medPlan.setPlanId(ConceptName(newPlanName.trim()));
                        Context.getService(standardplansService.class).saveMedicationPlan(medPlan);
                    }
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Renamed!");
                }
                
                if ("deletePlan".equals(action)) {
                    List<standardplans> medPlans = Context.getService(standardplansService.class).getMedicationPlansByDisease(ConceptName(planToDiscard));
                    for(standardplans medPlan : medPlans){
                        Context.getService(standardplansService.class).deleteMedicationPlan(medPlan);
                    }
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Discarded!");
                }
                
                if ("deletePlanItem".equals(action)) {
                    standardplans medPlan = Context.getService(standardplansService.class).getMedicationPlan(Integer.parseInt(drugId));
                    Context.getService(standardplansService.class).deleteMedicationPlan(medPlan);
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Item Discarded!");
                }
                
            } catch(APIException | NumberFormatException e){
                System.out.println("Error message "+e.getMessage());
            }
        }
        
        HashMap<Concept,List<standardplans>> allMedicationPlans = new HashMap<>();
        
        ConceptClass diseaseConcept = Context.getConceptService().getConceptClassByName("Diagnosis");
        List<Concept> diseases = Context.getConceptService().getConceptsByClass(diseaseConcept);
        model.addAttribute("diseases", diseases);
        
        for(Concept disease : diseases){
            List<standardplans> medicationPlans = Context.getService(standardplansService.class).getMedicationPlansByDisease(disease);
            Collections.sort(medicationPlans,new Comparator<standardplans>(){
                @Override
                public int compare(standardplans p1, standardplans p2) {
                    return p1.getPlanId().getDisplayString().compareTo(p2.getPlanId().getDisplayString());
                }
            });
            allMedicationPlans.put(disease, medicationPlans);
        }
        model.addAttribute("allMedicationPlans", allMedicationPlans);
    }
    
    private Concept ConceptName(String conceptString){
        return Context.getConceptService().getConceptByName(conceptString);
    }
    
    private OrderFrequency setOrderFrequency(String Frequency) {
        OrderFrequency orderFrequency = new OrderFrequency();
        orderFrequency.setFrequencyPerDay(0.0);
        orderFrequency.setConcept(ConceptName(Frequency));
        orderFrequency = (OrderFrequency) Context.getOrderService().saveOrderFrequency(orderFrequency);
        return orderFrequency;
    }
}
