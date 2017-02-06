/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders;

import org.openmrs.Concept;
import java.io.Serializable;
import org.openmrs.BaseOpenmrsObject;

/**
 *
 * @author harini-geek
 */
public class drugordersdiseases extends BaseOpenmrsObject implements Serializable{
    
    private Integer id;
    private Integer planId;
    private Integer orderId;
    private String patientId;
    private Concept diseaseId;    
    
    public drugordersdiseases(){
        
    }
    
    @Override
    public Integer getId() {
            return id;
    }

    @Override
    public void setId(Integer id) {
            this.id = id;
    }
    
    public Integer getPlanId() {
        return planId;
    }

    public void setPlanId(Integer planId) {
        this.planId = planId;
    }
    
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
    
    public Concept getDiseaseId() {
            return diseaseId;
    }

    public void setDiseaseId(Concept diseaseId) {
            this.diseaseId = diseaseId;
    }
    
    public String getPatientId() {
            return patientId;
    }

    public void setPatientId(String patientId) {
            this.patientId = patientId;
    }
}
