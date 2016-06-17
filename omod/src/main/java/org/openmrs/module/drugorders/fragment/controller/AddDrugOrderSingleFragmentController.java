/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.Collections;
import java.util.Comparator;
import org.openmrs.Patient;
import org.openmrs.api.PatientService;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.annotation.FragmentParam;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.openmrs.ui.util.ByFormattedObjectComparator;

/**
 *
 * @author harini-geek
 */
public class AddDrugOrderSingleFragmentController {
    
    public void controller(FragmentModel model, @FragmentParam("patientId") Patient patient, UiUtils ui,
	                       @SpringBean("patientService") PatientService patientService) {
		
		
	}
    
}
