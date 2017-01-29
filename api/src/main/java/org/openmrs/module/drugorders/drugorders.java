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
        private String Uuid;
        private Date startdate;
        private Integer orderId;
        private Integer groupid;
        private Concept drugname;
        private String patientid;
        private Integer isallergic;
        private String isallergicorderreasons;
        private Concept associateddiagnosis;
        private String patientinstructions;
        private String pharmacistinstructions;
        private Concept priority;
        private Integer refill;
        private Integer refillinterval;
        private String orderstatus;
        private Integer onHold;
        private Integer forDiscard;
        private Concept discontinuereason;
        private String discontinuationreasons;
        
        private String commentfororderer;
        private String commentforpatient;
        private Date lastdispatchdate;
        private Date drugexpirydate;
        
	
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
        
        public Integer getRefillinterval() {
		return refillinterval;
	}

	public void setRefillinterval(Integer refillinterval) {
		this.refillinterval = refillinterval;
	}
        
        public Integer getRefill() {
		return refill;
	}

	public void setRefill(Integer refill) {
		this.refill = refill;
	}
        
        public String getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
           
        public Integer getOnHold() {
            return onHold;
        }

        public void setOnHold(Integer onHold) {
            this.onHold = onHold;
        }
        
        public Integer getForDiscard() {
		return forDiscard;
	}
	
	public void setForDiscard(Integer forDiscard) {
		this.forDiscard = forDiscard;
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
                
        public Date getLastdispatchdate() {
            return lastdispatchdate;
        }

        public void setLastdispatchdate(Date lastdispatchdate) {
            this.lastdispatchdate = lastdispatchdate;
        }
        
        public Date getDrugexpirydate() {
            return drugexpirydate;
        }

        public void setDrugexpirydate(Date drugexpirydate) {
            this.drugexpirydate = drugexpirydate;
        }
        
        public String getCommentfororderer() {
		return commentfororderer;
	}

	public void setCommentfororderer(String commentfororderer) {
		this.commentfororderer = commentfororderer;
	}
        
        public String getCommentforpatient() {
		return commentforpatient;
	}

	public void setCommentforpatient(String commentforpatient) {
		this.commentforpatient = commentforpatient;
	}
}