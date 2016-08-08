/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders;

/**
 *
 * @author harini-geek
 */
public class medicationplans {
    
    private Integer id;
    private String Uuid;
    private Integer diseaseid;
    private Integer drugid;
    private Integer route;
    private Integer frequency;
    private Double dose;
    private Integer doseunits;
    private Integer duration;
    private Integer durationunits;
    private Double quantity;
    private Integer quantityunits;
    
    public medicationplans(){
        
    }
    
    public Integer getId() {
            return id;
    }

    public void setId(Integer id) {
            this.id = id;
    }
    
    public String getUuid() {
            return Uuid;
    }

    public void setUuid(String Uuid) {
            this.Uuid = Uuid;
    }
    
    public Integer getDiseaseid() {
            return diseaseid;
    }

    public void setDiseaseid(Integer diseaseid) {
            this.diseaseid = diseaseid;
    }

    public Integer getDrugid() {
            return drugid;
    }

    public void setDrugid(Integer drugid) {
            this.drugid = drugid;
    }

    public Integer getRoute() {
            return route;
    }

    public void setRoute(Integer route) {
            this.route = route;
    }

    public Integer getFrequency() {
            return frequency;
    }

    public void setFrequency(Integer frequency) {
            this.frequency = frequency;
    }

    public Double getDose() {
            return dose;
    }

    public void setDose(Double dose) {
            this.dose = dose;
    }

    public Integer getDoseunits() {
            return doseunits;
    }

    public void setDoseunits(Integer doseunits) {
            this.doseunits = doseunits;
    }

    public Double getQuantity() {
            return quantity;
    }

    public void setQuantity(Double quantity) {
            this.quantity = quantity;
    }

    public Integer getQuantityunits() {
            return quantityunits;
    }

    public void setQuantityunits(Integer quantityunits) {
            this.quantityunits = quantityunits;
    }

    public Integer getDuration() {
            return duration;
    }

    public void setDuration(Integer duration) {
            this.duration = duration;
    }

    public Integer getDurationunits() {
            return durationunits;
    }

    public void setDurationunits(Integer durationunits) {
            this.durationunits = durationunits;
    }
        
}
