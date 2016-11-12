/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api.db;

import java.util.List;
import org.openmrs.Concept;
import org.openmrs.module.drugorders.drugordersdiseases;

/**
 *
 * @author harini-geek
 */
public interface drugordersdiseasesDAO {
    
    public void deleteDrugOrder(drugordersdiseases order);
    public drugordersdiseases getDrugOrderByOrderID(Integer id);
    public drugordersdiseases saveDrugOrder(drugordersdiseases order);
    public List<drugordersdiseases> getDrugOrdersByPlan(Integer plan);
    public List<drugordersdiseases> getDrugOrdersByDisease(Concept concept);
    public List<drugordersdiseases> getDrugOrdersByPatient(String patientID);
    public List<drugordersdiseases> getDrugOrdersByDiseaseAndPatient(Concept concept,String patientID);
    
}
