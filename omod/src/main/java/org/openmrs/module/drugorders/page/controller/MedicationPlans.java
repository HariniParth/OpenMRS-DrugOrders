/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.page.controller;

import java.util.ArrayList;
import java.util.List;
import org.openmrs.Concept;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.drugordersdiseasesService;
import org.openmrs.module.drugorders.drugordersdiseases;

/**
 *
 * @author harini-geek
 */
public class MedicationPlans {
    
    public MedicationPlans(){
        
    }
    
    public static List<drugordersdiseases> getDrugOrdersByPlanByPatient(Patient p){
        
        return Context.getService(drugordersdiseasesService.class).getDrugOrdersByPatient(p);  
    }
    
    public static List<Concept> getPlansOrderedForPatient(Patient p){
        
        //Get list of disease related Drug Orders for the Patient
        List<drugordersdiseases> diseaseDrugOrdersByPatient = getDrugOrdersByPlanByPatient(p);
        
        //Get list of diseases from the disease related Drug Orders for the Patient
        List<Concept> diseases = new ArrayList<Concept>();
        for(drugordersdiseases diseaseDrugOrderByPatient : diseaseDrugOrdersByPatient){
            diseases.add(diseaseDrugOrderByPatient.getDiseaseid());
        }
        
        return diseases;
    }
    
    public static List<Integer> getOrderIDFromPlanOrdersForPatient(Patient p){
        
        //Get list of disease related Drug Orders for the Patient
        List<drugordersdiseases> diseaseDrugOrdersByPatient = getDrugOrdersByPlanByPatient(p);
        
        //Get list of order IDs from the disease related Drug Orders for the Patient
        List<Integer> diseaseOrderIDs = new ArrayList<Integer>();
        for(drugordersdiseases diseaseDrugOrderByPatient : diseaseDrugOrdersByPatient){
            diseaseOrderIDs.add(diseaseDrugOrderByPatient.getOrderid());
        }
        
        return diseaseOrderIDs;
    }
    
}