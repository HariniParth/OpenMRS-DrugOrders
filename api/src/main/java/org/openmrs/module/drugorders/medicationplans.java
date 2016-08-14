/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders;

import java.io.Serializable;
import org.openmrs.BaseOpenmrsObject;
import org.openmrs.Concept;
import org.openmrs.OrderFrequency;

/**
 *
 * @author harini-geek
 */
public class medicationplans extends BaseOpenmrsObject implements Serializable{
    
    private Integer id;
    private String Uuid;
    private Concept diseaseid;
    private Concept drugid;
    private Concept route;
    private OrderFrequency frequency;
    private Double dose;
    private Concept doseunits;
    private Integer duration;
    private Concept durationunits;
    private Double quantity;
    private Concept quantityunits;
    
    public medicationplans(){
        
    }
    
    @Override
    public Integer getId() {
            return id;
    }

    @Override
    public void setId(Integer id) {
            this.id = id;
    }
    
    @Override
    public String getUuid() {
            return Uuid;
    }

    @Override
    public void setUuid(String Uuid) {
            this.Uuid = Uuid;
    }
    
    public Concept getDiseaseid() {
            return diseaseid;
    }

    public void setDiseaseid(Concept diseaseid) {
            this.diseaseid = diseaseid;
    }

    public Concept getDrugid() {
            return drugid;
    }

    public void setDrugid(Concept drugid) {
            this.drugid = drugid;
    }

    public Concept getRoute() {
            return route;
    }

    public void setRoute(Concept route) {
            this.route = route;
    }

    public OrderFrequency getFrequency() {
            return frequency;
    }

    public void setFrequency(OrderFrequency frequency) {
            this.frequency = frequency;
    }

    public Double getDose() {
            return dose;
    }

    public void setDose(Double dose) {
            this.dose = dose;
    }

    public Concept getDoseunits() {
            return doseunits;
    }

    public void setDoseunits(Concept doseunits) {
            this.doseunits = doseunits;
    }

    public Double getQuantity() {
            return quantity;
    }

    public void setQuantity(Double quantity) {
            this.quantity = quantity;
    }

    public Concept getQuantityunits() {
            return quantityunits;
    }

    public void setQuantityunits(Concept quantityunits) {
            this.quantityunits = quantityunits;
    }

    public Integer getDuration() {
            return duration;
    }

    public void setDuration(Integer duration) {
            this.duration = duration;
    }

    public Concept getDurationunits() {
            return durationunits;
    }

    public void setDurationunits(Concept durationunits) {
            this.durationunits = durationunits;
    }
        
}
