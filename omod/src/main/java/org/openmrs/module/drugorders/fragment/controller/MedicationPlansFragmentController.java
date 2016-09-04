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
public class MedicationPlansFragmentController {
    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient){
        
        //Get list of disease related Drug Orders for the Patient
        List<drugordersdiseases> diseaseDrugOrdersByPatient = Context.getService(drugordersdiseasesService.class).getDrugOrdersByPatient(patient.getPatientId().toString());
       
        //Get list of diseases from the disease related Drug Orders for the Patient
        List<Concept> diseases = new ArrayList<Concept>();
        for(drugordersdiseases diseaseDrugOrderByPatient : diseaseDrugOrdersByPatient){
            diseases.add(diseaseDrugOrderByPatient.getDiseaseid());
        }
        
        //Get list of order IDs from the disease related Drug Orders for the Patient
        List<Integer> diseaseOrderIDs = new ArrayList<Integer>();
        for(drugordersdiseases diseaseDrugOrderByPatient : diseaseDrugOrdersByPatient){
            diseaseOrderIDs.add(diseaseDrugOrderByPatient.getOrderid());
        }
        
        //Data structure to store the 'Drug Order' object properties for all the orders for the given disease
        HashMap<Concept,ArrayList<Order>> drugOrderMainPlan = new HashMap <Concept,ArrayList<Order>>();

        //Data structure to store the 'drugorders' object properties for all the orders for the given disease
        HashMap <Concept,ArrayList<drugorders>> drugOrderExtensionPlan = new HashMap <Concept,ArrayList<drugorders>>();

        for(Concept disease : diseases){
            
            ArrayList<Order> drugOrderMain = new ArrayList<Order>();
            ArrayList<drugorders> drugOrderExtension = new ArrayList<drugorders>();
            
            for(Integer diseaseOrderID : diseaseOrderIDs){
                if(disease == Context.getService(drugordersdiseasesService.class).getDrugOrderByOrderID(diseaseOrderID).getDiseaseid()){
                    drugOrderMain.add(Context.getOrderService().getOrder(diseaseOrderID));
                    drugOrderExtension.add(Context.getService(drugordersService.class).getDrugOrderByOrderID(diseaseOrderID));
                }
            }
            drugOrderMainPlan.put(disease, drugOrderMain);
            drugOrderExtensionPlan.put(disease, drugOrderExtension);
        }
        
        model.addAttribute("drugOrderMainPlan", drugOrderMainPlan);
        model.addAttribute("drugOrderExtensionPlan", drugOrderExtensionPlan);
        
    }

}
