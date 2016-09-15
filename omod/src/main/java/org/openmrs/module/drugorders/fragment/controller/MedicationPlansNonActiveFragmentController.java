/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import org.openmrs.Concept;
import org.openmrs.Order;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.api.drugordersdiseasesService;
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.module.drugorders.page.controller.MedicationPlans;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class MedicationPlansNonActiveFragmentController {
    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient){
        
        //Data structure to store the 'Drug Order' object properties for all the non-active orders for the given disease
        HashMap<Concept,ArrayList<Order>> drugOrderMainPlanNonActive = new HashMap <Concept,ArrayList<Order>>();

        //Data structure to store the 'drugorders' object properties for all the non-active orders for the given disease
        HashMap <Concept,ArrayList<drugorders>> drugOrderExtensionPlanNonActive = new HashMap <Concept,ArrayList<drugorders>>();
        
        for(Concept disease : MedicationPlans.getPlansOrderedForPatient(patient)){
            
            ArrayList<Order> drugOrderMain = new ArrayList<Order>();
            ArrayList<drugorders> drugOrderExtension = new ArrayList<drugorders>();
            
            for(Integer diseaseOrderID : MedicationPlans.getOrderIDFromPlanOrdersForPatient(patient)){
                if((disease == Context.getService(drugordersdiseasesService.class).getDrugOrderByOrderID(diseaseOrderID).getDiseaseid()) && (Context.getService(drugordersService.class).getDrugOrderByOrderID(diseaseOrderID).getOrderstatus()).equals("Discontinued-Plan")){
                    drugOrderMain.add(Context.getOrderService().getOrder(diseaseOrderID));
                    drugOrderExtension.add(Context.getService(drugordersService.class).getDrugOrderByOrderID(diseaseOrderID));
                }
            }
            
            if(drugOrderMain.size() > 0 && drugOrderExtension.size() > 0){
                drugOrderMainPlanNonActive.put(disease, drugOrderMain);
                drugOrderExtensionPlanNonActive.put(disease, drugOrderExtension);
            }
        }
                
        model.addAttribute("drugOrderMainPlanNonActive", drugOrderMainPlanNonActive);
        model.addAttribute("drugOrderExtensionPlanNonActive", drugOrderExtensionPlanNonActive);
        
    }
}