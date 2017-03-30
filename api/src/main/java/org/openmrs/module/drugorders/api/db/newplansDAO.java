/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api.db;

import org.openmrs.Concept;
import org.openmrs.module.drugorders.newplans;

/**
 *
 * @author harini-geek
 */
public interface newplansDAO {
    
    public void deleteMedicationPlan(newplans plan);
    
    public newplans saveMedicationPlan(newplans plan);
    
    public newplans getMedicationPlan(Concept planName);
    
}
