/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api.db;

import java.util.List;
import org.openmrs.Concept;
import org.openmrs.module.drugorders.medicationplans;

/**
 *
 * @author harini-geek
 */
public interface medicationplansDAO {
    
    public void deleteMedicationPlan(medicationplans plan);
    public medicationplans getMedicationPlan(Integer planId);
    public medicationplans saveMedicationPlan(medicationplans plan);
    public List<medicationplans> getMedicationPlansByDisease(Concept concept);
        
}
