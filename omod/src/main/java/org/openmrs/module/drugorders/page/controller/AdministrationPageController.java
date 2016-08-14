/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.page.controller;

import java.util.HashMap;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.openmrs.Concept;
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
    
    public void controller(PageModel model, @RequestParam(value = "diseaseName", required = false) String diseaseNameSelected,
                            @RequestParam(value = "drugName", required = false) String drugNameSelected,
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
            } catch(Exception e){
                System.out.println("Error message "+e.getMessage());
            }
        }

    }
}
