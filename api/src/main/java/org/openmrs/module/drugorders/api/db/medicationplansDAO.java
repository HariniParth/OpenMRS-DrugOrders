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
    
    public medicationplans getMedicationPlan(Integer planID);
    public medicationplans saveNewTable(medicationplans newTable);
    public List<medicationplans> getMedicationPlansByDisease(Concept concept);
    public List<medicationplans> getAllMedicationPlans();
    public void deleteMedicationPlan(medicationplans plan);
    
}
