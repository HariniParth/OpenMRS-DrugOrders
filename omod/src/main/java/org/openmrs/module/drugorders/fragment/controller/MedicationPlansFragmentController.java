/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

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
public class MedicationPlansFragmentController {
    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient){
        
        //Data structure to store the 'Drug Order' object properties for all the active orders for the given disease
        HashMap<Concept,HashMap<Integer,Order>> ActivePlanMain = new HashMap <Concept,HashMap<Integer,Order>>();

        //Data structure to store the 'drugorders' object properties for all the active orders for the given disease
        HashMap <Concept,HashMap<Integer,drugorders>> ActivePlanExtension = new HashMap <Concept,HashMap<Integer,drugorders>>();

        for(Concept disease : MedicationPlans.getPlansOrderedForPatient(patient)){
            
            HashMap<Integer,Order> drugOrderMain = new HashMap<Integer,Order>();
            HashMap<Integer,drugorders> drugOrderExtension = new HashMap<Integer,drugorders>();
            
            for(Integer diseaseOrderID : MedicationPlans.getOrderIDFromPlanOrdersForPatient(patient)){
                if((disease == Context.getService(drugordersdiseasesService.class).getDrugOrderByOrderID(diseaseOrderID).getDiseaseid()) && (Context.getService(drugordersService.class).getDrugOrderByOrderID(diseaseOrderID).getOrderstatus()).equals("Active-Plan")){
                    drugOrderMain.put(diseaseOrderID,Context.getOrderService().getOrder(diseaseOrderID));
                    drugOrderExtension.put(diseaseOrderID,Context.getService(drugordersService.class).getDrugOrderByOrderID(diseaseOrderID));
                }
            }
            
            if(drugOrderMain.size() > 0 && drugOrderExtension.size() > 0){
                ActivePlanMain.put(disease, drugOrderMain);
                ActivePlanExtension.put(disease, drugOrderExtension);
            }         
        }
        
        model.addAttribute("ActivePlanMain", ActivePlanMain);
        model.addAttribute("ActivePlanExtension", ActivePlanExtension);

    }
    
}
