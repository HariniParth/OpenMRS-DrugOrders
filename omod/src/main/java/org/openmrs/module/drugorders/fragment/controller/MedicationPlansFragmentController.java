/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.HashMap;
import java.util.List;
import org.openmrs.Concept;
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
        
        List<drugordersdiseases> diseaseDrugOrdersByPatient = Context.getService(drugordersdiseasesService.class).getDrugOrdersByPatient(patient.getPatientId().toString());
        model.addAttribute("diseaseDrugOrdersByPatient", diseaseDrugOrdersByPatient);
        HashMap<Concept,drugorders> diseaseDrugOrders = new HashMap<Concept,drugorders>();
                
        for(drugordersdiseases o1 : diseaseDrugOrdersByPatient){
            List<drugordersdiseases> drugordersdiseasesByDisease = Context.getService(drugordersdiseasesService.class).getDrugOrdersByDisease(o1.getDiseaseid());
            for(drugordersdiseases o2 : drugordersdiseasesByDisease){
                diseaseDrugOrders.put(o2.getDiseaseid(), Context.getService(drugordersService.class).getDrugOrderByOrderID(o2.getOrderid()));
            }
        }
        
        model.addAttribute("diseaseDrugOrders", diseaseDrugOrders);
        
    }

}
