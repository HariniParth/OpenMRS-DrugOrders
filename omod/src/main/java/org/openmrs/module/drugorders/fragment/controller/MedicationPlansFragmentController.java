/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.HashMap;
import java.util.List;
import org.openmrs.Concept;
import org.openmrs.DrugOrder;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.api.drugordersdiseasesService;
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.module.drugorders.drugordersdiseases;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class MedicationPlansFragmentController {
    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient){
        
        //Data structure to store the 'Drug Order' object properties for all the active orders for the given disease
        HashMap<Concept,HashMap<Integer,DrugOrder>> ActivePlanMain = new HashMap <Concept,HashMap<Integer,DrugOrder>>();
        
        //Data structure to store the 'drugorders' object properties for all the active orders for the given disease
        HashMap <Concept,HashMap<Integer,drugorders>> ActivePlanExtension = new HashMap <Concept,HashMap<Integer,drugorders>>();
        
        List<drugorders> activeMedOrders = Context.getService(drugordersService.class).getDrugOrdersByPatient(patient);
        
        for(drugorders activeMedOrder : activeMedOrders){
            drugordersdiseases activeMedPlan = Context.getService(drugordersdiseasesService.class).getDrugOrderByOrderID(activeMedOrder.getOrderId());
            
            if(!ActivePlanMain.containsKey(activeMedPlan.getDiseaseid())){
                
                HashMap<Integer,DrugOrder> drugOrderMain = new HashMap<Integer,DrugOrder>();
                HashMap<Integer,drugorders> drugOrderExtension = new HashMap<Integer,drugorders>();
                List<drugordersdiseases> ordersForPlan = Context.getService(drugordersdiseasesService.class).getDrugOrdersByPlan(activeMedPlan.getPlanid());
                
                for(drugordersdiseases orderPlan : ordersForPlan){
                    int order = orderPlan.getOrderid();
                    drugorders drugorder = Context.getService(drugordersService.class).getDrugOrderByOrderID(order);
                    
                    if(drugorder.getOrderstatus().equals("Active-Plan")){
                        drugOrderMain.put(order, (DrugOrder) Context.getOrderService().getOrder(order));
                        drugOrderExtension.put(order,drugorder);
                    }
                }
                
                ActivePlanMain.put(activeMedPlan.getDiseaseid(), drugOrderMain);
                ActivePlanExtension.put(activeMedPlan.getDiseaseid(), drugOrderExtension);
            }
        }
            
        model.addAttribute("ActivePlanMain", ActivePlanMain);
        model.addAttribute("ActivePlanExtension", ActivePlanExtension);
    }
}
