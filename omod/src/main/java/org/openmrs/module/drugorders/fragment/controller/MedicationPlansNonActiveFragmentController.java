/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.ArrayList;
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
public class MedicationPlansNonActiveFragmentController {
    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient){

        //Data structure to store the 'Drug Order' object properties for all the non-active orders for the given disease
        HashMap<Integer, HashMap<Concept, HashMap<Integer, DrugOrder>>> NonActivePlanMain = new HashMap<Integer, HashMap<Concept, HashMap<Integer, DrugOrder>>>();

        //Data structure to store the 'drugorders' object properties for all the non-active orders for the given disease
        HashMap<Integer, HashMap<Concept, HashMap<Integer, drugorders>>> NonActivePlanExtension = new HashMap<Integer, HashMap<Concept, HashMap<Integer, drugorders>>>();
        HashMap<Integer, ArrayList<String>> planDrugs = new HashMap<Integer, ArrayList<String>>();
        
        List<drugorders> nonActiveMedOrders = Context.getService(drugordersService.class).getDrugOrdersByStatus("Non-Active-Plan");
        
        for(drugorders nonActiveMedOrder : nonActiveMedOrders){
            drugordersdiseases nonActiveMedPlan = Context.getService(drugordersdiseasesService.class).getDrugOrderByOrderID(nonActiveMedOrder.getOrderId());
            
            if(!NonActivePlanMain.containsKey(nonActiveMedPlan.getPlanid())){
                List<drugordersdiseases> ordersByPlan = Context.getService(drugordersdiseasesService.class).getDrugOrdersByPlan(nonActiveMedPlan.getPlanid());
                
                HashMap<Concept, HashMap<Integer, DrugOrder>> planMain = new HashMap<Concept, HashMap<Integer, DrugOrder>>();
                HashMap<Concept, HashMap<Integer, drugorders>> planExtn = new HashMap<Concept, HashMap<Integer, drugorders>>();
                
                HashMap<Integer,DrugOrder> orderMain = new HashMap<Integer,DrugOrder>();
                HashMap<Integer,drugorders> orderExtn = new HashMap<Integer,drugorders>();
                ArrayList<String> drugNames = new ArrayList<String>();
                
                for(drugordersdiseases orderByPlan : ordersByPlan){
                    int order = orderByPlan.getOrderid();
                    orderMain.put(order, (DrugOrder) Context.getOrderService().getOrder(order));
                    orderExtn.put(order, Context.getService(drugordersService.class).getDrugOrderByOrderID(order));
                    
                    drugNames.add(Context.getService(drugordersService.class).getDrugOrderByOrderID(order).getDrugname().getDisplayString());
                }
                
                planMain.put(nonActiveMedPlan.getDiseaseid(), orderMain);
                planExtn.put(nonActiveMedPlan.getDiseaseid(), orderExtn);
                
                NonActivePlanMain.put(nonActiveMedPlan.getPlanid(), planMain);
                NonActivePlanExtension.put(nonActiveMedPlan.getPlanid(), planExtn);
                
                planDrugs.put(nonActiveMedPlan.getPlanid(), drugNames);
            }
        }
        
        model.addAttribute("planDrugs", planDrugs);
        model.addAttribute("NonActivePlanMain", NonActivePlanMain);
        model.addAttribute("NonActivePlanExtension", NonActivePlanExtension);
    }
}