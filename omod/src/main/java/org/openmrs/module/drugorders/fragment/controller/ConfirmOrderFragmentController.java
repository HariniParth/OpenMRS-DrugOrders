/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.Date;
import org.openmrs.Patient;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class ConfirmOrderFragmentController {
    
    public void controller(PageModel model, @RequestParam(value = "drugname", required = false) String drugname,
                            @RequestParam(value = "startDate", required = false) Date startDate,
                            @RequestParam(value = "drugNameEntered", required = false) String drugNameEntered,
                            @RequestParam(value = "startDateEntered", required = false) Date startDateEntered,
                            @RequestParam(value = "allergicOrderReasonEntered", required = false) String allergicOrderReasonEntered,
                            @RequestParam(value = "drugRoute", required = false) String drugRoute,
                            @RequestParam(value = "drugDose", required = false) String drugDose,
                            @RequestParam(value = "drugDoseUnits", required = false) String drugDoseUnits,
                            @RequestParam(value = "drugQuantity", required = false) String drugQuantity,
                            @RequestParam(value = "quantityUnits", required = false) String quantityUnits,
                            @RequestParam(value = "drugDuration", required = false) Integer drugDuration,
                            @RequestParam(value = "durationUnits", required = false) String durationUnits,
                            @RequestParam(value = "drugFrequency", required = false) String drugFrequency,
                            @RequestParam(value = "associatedDiagnosis", required = false) String associatedDiagnosis,
                            @RequestParam(value = "patientInstructions", required = false) String patientInstructions,
                            @RequestParam(value = "pharmacistInstructions", required = false) String pharmacistInstructions,
                            @RequestParam("patientId") Patient patient){
        
        model.addAttribute("drugname", drugname);
        model.addAttribute("startDate", startDate);
        model.addAttribute("patientid", patient.getPatientId());
        model.addAttribute("drugNameEntered", drugNameEntered);
        model.addAttribute("startDateEntered", startDateEntered);
        model.addAttribute("allergicOrderReasonEntered", allergicOrderReasonEntered);
        model.addAttribute("drugRoute", drugRoute);
        model.addAttribute("drugDose", drugDose);
        model.addAttribute("drugDoseUnits", drugDoseUnits);
        model.addAttribute("drugQuantity", drugQuantity);
        model.addAttribute("quantityUnits", quantityUnits);
        model.addAttribute("drugDuration", drugDuration);
        model.addAttribute("durationUnits", durationUnits);
        model.addAttribute("drugFrequency", drugFrequency);
        model.addAttribute("associatedDiagnosis", associatedDiagnosis);
        model.addAttribute("patientInstructions", patientInstructions);
        model.addAttribute("pharmacistInstructions", pharmacistInstructions);

    }
    
}
