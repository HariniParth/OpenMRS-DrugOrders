/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.page.controller;

import java.util.HashMap;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class AdministrationPageController {
    
    private final HashMap<String,String> diseasePlanName = new HashMap<String,String>();
    
    public void controller(PageModel model, @RequestParam(value = "diseaseName", required = false) String diseaseNameSelected,
                            @RequestParam(value = "drugName", required = false) String drugNameSelected){
        
        String diseaseName = diseaseNameSelected.replace(" ", "");
        String drugName = drugNameSelected.replace(" ", "");
        
        if(!diseaseName.isEmpty() && !drugName.isEmpty())
            diseasePlanName.put(diseaseName, drugName);
        model.addAttribute("diseasePlanName", diseasePlanName);
    }
}
