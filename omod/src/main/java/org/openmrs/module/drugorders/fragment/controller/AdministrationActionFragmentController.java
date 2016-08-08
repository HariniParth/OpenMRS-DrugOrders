/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.HashMap;
import org.openmrs.DrugOrder;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.medicationplans;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class AdministrationActionFragmentController {
    

    public void controller(PageModel model, @RequestParam(value = "diseaseName", required = false) String diseaseNameSelected,
            @RequestParam(value = "drugName", required = false) String drugNameSelected,
            @RequestParam(value = "drugRoute", required = false) String drugRoute,
            @RequestParam(value = "drugDose", required = false) String drugDose,
            @RequestParam(value = "drugDoseUnits", required = false) String drugDoseUnits,
            @RequestParam(value = "drugQuantity", required = false) String drugQuantity,
            @RequestParam(value = "quantityUnits", required = false) String quantityUnits,
            @RequestParam(value = "drugDuration", required = false) Integer drugDuration,
            @RequestParam(value = "durationUnits", required = false) String durationUnits,
            @RequestParam(value = "drugFrequency", required = false) String drugFrequency){
        
        String diseaseName = diseaseNameSelected.replace(" ", "");
        String drugName = drugNameSelected.replace(" ", "");
        
        model.addAttribute("diseaseName", diseaseName);
        
        medicationplans medPlans = new medicationplans();
        medPlans.setDose(Double.valueOf(drugDose));
        medPlans.setQuantity(Double.valueOf(drugQuantity));
        medPlans.setDiseaseid(Context.getConceptService().getConceptByName(diseaseName).getConceptId());
        medPlans.setDrugid(Context.getConceptService().getConceptByName(drugName).getConceptId());
        medPlans.setDoseunits(Context.getConceptService().getConceptByName(drugDoseUnits).getConceptId());
        medPlans.setDuration(drugDuration);
        medPlans.setDurationunits(Context.getConceptService().getConceptByName(durationUnits).getConceptId());
        medPlans.setQuantityunits(Context.getConceptService().getConceptByName(quantityUnits).getConceptId());
        medPlans.setRoute(Context.getConceptService().getConceptByName(drugRoute).getConceptId());
        medPlans.setFrequency(Context.getConceptService().getConceptByName(drugFrequency).getConceptId());
    }
    
}
