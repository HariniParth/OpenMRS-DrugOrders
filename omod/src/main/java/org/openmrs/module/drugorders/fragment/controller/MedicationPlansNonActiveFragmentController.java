/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.HashMap;
import java.util.List;
import org.openmrs.Concept;
import org.openmrs.Order;
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
public class MedicationPlansNonActiveFragmentController {
    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient){
        
        //Data structure to store the 'Drug Order' object properties for all the non-active orders for the given disease
        HashMap<Integer, HashMap<Concept, HashMap<Integer, Order>>> NonActivePlanMain = new HashMap<Integer, HashMap<Concept, HashMap<Integer, Order>>>();

        //Data structure to store the 'drugorders' object properties for all the non-active orders for the given disease
        HashMap<Integer, HashMap<Concept, HashMap<Integer, drugorders>>> NonActivePlanExtension = new HashMap<Integer, HashMap<Concept, HashMap<Integer, drugorders>>>();
        
        List<drugordersdiseases> planByPatient = Context.getService(drugordersdiseasesService.class).getDrugOrdersByPatient(patient.getPatientId().toString());
                
        for(drugordersdiseases patientPlan : planByPatient){
            
            if(!NonActivePlanMain.containsKey(patientPlan.getPlanid())){
                List<drugordersdiseases> plans = Context.getService(drugordersdiseasesService.class).getDrugOrdersByPlan(patientPlan.getPlanid());
                
                HashMap<Concept, HashMap<Integer, Order>> planMain = new HashMap<Concept, HashMap<Integer, Order>>();
                HashMap<Concept, HashMap<Integer, drugorders>> planExtn = new HashMap<Concept, HashMap<Integer, drugorders>>();
                
                HashMap<Integer,Order> orderMain = new HashMap<Integer,Order>();
                HashMap<Integer,drugorders> orderExtn = new HashMap<Integer,drugorders>();
                
                for(drugordersdiseases plan : plans){ 
                    orderMain.put(plan.getOrderid(), Context.getOrderService().getOrder(plan.getOrderid()));
                    orderExtn.put(plan.getOrderid(), Context.getService(drugordersService.class).getDrugOrderByOrderID(plan.getOrderid()));
                }                
                planMain.put(patientPlan.getDiseaseid(), orderMain);
                planExtn.put(patientPlan.getDiseaseid(), orderExtn);
                
                NonActivePlanMain.put(patientPlan.getPlanid(), planMain);
                NonActivePlanExtension.put(patientPlan.getPlanid(), planExtn);
            }
        }
        
        model.addAttribute("NonActivePlanMain", NonActivePlanMain);
        model.addAttribute("NonActivePlanExtension", NonActivePlanExtension);
        
    }
}