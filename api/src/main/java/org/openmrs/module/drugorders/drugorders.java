/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.drugorders;

import java.io.Serializable;
import java.util.Date;
import org.openmrs.BaseOpenmrsObject;
import org.openmrs.BaseOpenmrsMetadata;

/**
 * It is a model class. It should extend either {@link BaseOpenmrsObject} or {@link BaseOpenmrsMetadata}.
 */
public class drugorders extends BaseOpenmrsObject implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
        private Integer orderId;
        private String Uuid;
        private String patientid;
        private Date startdate;
        private String drugname;
        private Integer dose;
        private Integer doseunits;
        private Integer route;
        private Integer duration;
        private Integer durationunits;
        private Integer quantity;
        private Integer quantityunits;
        private Integer isallergic;
        private Integer frequency;
        private String isallergicorderreasons;
        private String associateddiagnosis;
        private String patientinstructions;
        private String pharmacistinstructions;
        private String orderstatus;
        private Integer discontinued;
        private String discontinuereason;
        private String discontinuationreasons;
        private Integer approvalrequired;
	
        public drugorders(){
            
        }
        
	@Override
	public Integer getId() {
		return id;
	}
	
	@Override
	public void setId(Integer id) {
		this.id = id;
	}
        
        public Integer getOrderId() {
            return orderId;
        }

        public void setOrderId(Integer orderId) {
            this.orderId = orderId;
        }
    
        @Override
	public String getUuid() {
		return Uuid;
	}
        
        @Override
	public void setUuid(String Uuid) {
		this.Uuid = Uuid;
	}
        
        public String getPatientid() {
		return patientid;
	}

	public void setPatientid(String patientid) {
		this.patientid = patientid;
	}
        
        public String getDrugname() {
		return drugname;
	}

	public void setDrugname(String drugname) {
		this.drugname = drugname;
	}
        
        public Date getStartdate() {
            return startdate;
        }

        public void setStartdate(Date startdate) {
            this.startdate = startdate;
        }

        public Integer getDose() {
		return dose;
	}
	
	public void setDose(Integer dose) {
		this.dose = dose;
	}
        
        public Integer getDoseunits() {
		return doseunits;
	}

	public void setDoseunits(Integer doseunits) {
		this.doseunits = doseunits;
	}
        
        public Integer getRoute() {
		return route;
	}

	public void setRoute(Integer route) {
		this.route = route;
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
        
        public Integer getQuantity() {
		return quantity;
	}
	
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
        
        public Integer getQuantityunits() {
		return quantityunits;
	}

	public void setQuantityunits(Integer quantityunits) {
		this.quantityunits = quantityunits;
	}
          
        public Integer getFrequency() {
		return frequency;
	}

	public void setFrequency(Integer frequency) {
		this.frequency = frequency;
	}
        
        public Integer getIsallergic() {
		return isallergic;
	}
	
	public void setIsallergic(Integer isallergic) {
		this.isallergic = isallergic;
	}
        
        public String getIsallergicorderreasons() {
		return isallergicorderreasons;
	}

	public void setIsallergicorderreasons(String isallergicorderreasons) {
		this.isallergicorderreasons = isallergicorderreasons;
	}
        
        public String getAssociateddiagnosis() {
		return associateddiagnosis;
	}

	public void setAssociateddiagnosis(String associateddiagnosis) {
		this.associateddiagnosis = associateddiagnosis;
	}
        
        public String getPatientinstructions() {
		return patientinstructions;
	}

	public void setPatientinstructions(String patientinstructions) {
		this.patientinstructions = patientinstructions;
	}
        
        public String getPharmacistinstructions() {
		return pharmacistinstructions;
	}

	public void setPharmacistinstructions(String pharmacistinstructions) {
		this.pharmacistinstructions = pharmacistinstructions;
	} 
        
        public String getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
        
        public Integer getDiscontinued() {
		return discontinued;
	}
	
	public void setDiscontinued(Integer discontinued) {
		this.discontinued = discontinued;
	}
        
        public String getDiscontinuereason() {
		return discontinuereason;
	}

	public void setDiscontinuereason(String discontinuereason) {
		this.discontinuereason = discontinuereason;
	}
        
        public String getDiscontinuationreasons() {
		return discontinuationreasons;
	}

	public void setDiscontinuationreasons(String discontinuationreasons) {
		this.discontinuationreasons = discontinuationreasons;
	}
        
        public Integer getApprovalrequired() {
		return approvalrequired;
	}
	
	public void setApprovalrequired(Integer approvalrequired) {
		this.approvalrequired = approvalrequired;
	}
	
}