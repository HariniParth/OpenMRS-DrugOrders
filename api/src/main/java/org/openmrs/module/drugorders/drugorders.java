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

import java.util.Date;
import org.openmrs.Concept;
import java.io.Serializable;
import org.openmrs.BaseOpenmrsObject;
import org.openmrs.BaseOpenmrsMetadata;

/**
 * It is a model class. It should extend either {@link BaseOpenmrsObject} or {@link BaseOpenmrsMetadata}.
 */
public class drugorders extends BaseOpenmrsObject implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
        private Integer orderId;
        private Integer groupid;
        private String Uuid;
        private String patientid;
        private Date startdate;
        private Concept drugname;
        private Integer isallergic;
        private String isallergicorderreasons;
        private Concept associateddiagnosis;
        private String patientinstructions;
        private String pharmacistinstructions;
        private Concept priority;
        private String orderstatus;
        private Integer discontinued;
        private Concept discontinuereason;
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
    
        public Integer getGroupid() {
            return groupid;
        }

        public void setGroupid(Integer groupid) {
            this.groupid = groupid;
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
        
        public Concept getDrugname() {
		return drugname;
	}

	public void setDrugname(Concept drugname) {
		this.drugname = drugname;
	}
        
        public Date getStartdate() {
            return startdate;
        }

        public void setStartdate(Date startdate) {
            this.startdate = startdate;
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
        
        public Concept getAssociateddiagnosis() {
		return associateddiagnosis;
	}

	public void setAssociateddiagnosis(Concept associateddiagnosis) {
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
        
        public Concept getPriority() {
		return priority;
	}

	public void setPriority(Concept priority) {
		this.priority = priority;
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
        
        public Concept getDiscontinuereason() {
		return discontinuereason;
	}

	public void setDiscontinuereason(Concept discontinuereason) {
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