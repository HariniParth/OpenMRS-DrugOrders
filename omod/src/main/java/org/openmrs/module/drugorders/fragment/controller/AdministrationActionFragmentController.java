/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.openmrs.Concept;
import org.openmrs.OrderFrequency;
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
public class AdministrationActionFragmentController {
    
    public final Map<String, medicationplans> diseaseplans = new HashMap<String,medicationplans>();
    
    public void controller(PageModel model, @RequestParam(value = "diseaseName", required = false) String diseaseNameSelected,
            @RequestParam(value = "planId", required = false) String planId,
            @RequestParam(value = "drugName", required = false) String drugNameSelected,
            @RequestParam(value = "drugRoute", required = false) String drugRoute,
            @RequestParam(value = "drugDose", required = false) String drugDose,
            @RequestParam(value = "drugDoseUnits", required = false) String drugDoseUnits,
            @RequestParam(value = "drugQuantity", required = false) String drugQuantity,
            @RequestParam(value = "quantityUnits", required = false) String quantityUnits,
            @RequestParam(value = "drugDuration", required = false) Integer drugDuration,
            @RequestParam(value = "durationUnits", required = false) String durationUnits,
            @RequestParam(value = "drugFrequency", required = false) String drugFrequency,
            @RequestParam(value = "action", required = false) String action, HttpSession session){
        
        String diseaseName = diseaseNameSelected.trim();
        String drugName = drugNameSelected.trim();
        
        model.addAttribute("diseaseName", diseaseName);
        
        medicationplans medPlans = new medicationplans();
        medPlans.setUuid(UUID.randomUUID().toString());
        medPlans.setDose(Double.valueOf(drugDose));
        medPlans.setQuantity(Double.valueOf(drugQuantity));
        medPlans.setDiseaseId(Context.getConceptService().getConceptByName(diseaseName));
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
            
        diseaseplans.put(diseaseName, medPlans);
        
        model.addAttribute("medicationplans", medPlans);
        model.addAttribute("diseaseplans", diseaseplans);

        if (StringUtils.isNotBlank(action)) {
            try {
                if ("addPlanItem".equals(action)) {
                    if(!(planId.equals(""))){
                        Context.getService(medicationplansService.class).deleteMedicationPlan(Context.getService(medicationplansService.class).getMedicationPlan(Integer.parseInt(planId)));
                    }
                    
                    Context.getService(medicationplansService.class).saveMedicationPlan(medPlans);
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Saved!");
                }
            } catch(Exception e){
                System.out.println("Error message "+e.getMessage());
            }
        }
        
        Concept diseaseConcept = Context.getConceptService().getConceptByName(diseaseName);
        List<medicationplans> existingMedplans = Context.getService(medicationplansService.class).getMedicationPlansByDisease(diseaseConcept);
        model.addAttribute("existingMedplans", existingMedplans);
    }
    
    private OrderFrequency setOrderFrequency(String Frequency) {

        OrderFrequency orderFrequency = new OrderFrequency();
        orderFrequency.setFrequencyPerDay(0.0);
        orderFrequency.setConcept(Context.getConceptService().getConceptByName(Frequency));
        orderFrequency = (OrderFrequency) Context.getOrderService().saveOrderFrequency(orderFrequency);
        return orderFrequency;

    }
    
}
