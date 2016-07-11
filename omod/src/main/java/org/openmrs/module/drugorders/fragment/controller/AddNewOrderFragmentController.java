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

public class AddNewOrderFragmentController {
    
    /**
     *
     * @param model
     * @param drugname
     * @param allergicOrderReason
     * @param startDate
     * @param patient
     */
    public void controller(PageModel model, @RequestParam(value = "drugname", required = false) String drugname,
            @RequestParam(value = "allergicOrderReason", required = false) String allergicOrderReason,
            @RequestParam(value = "startDate", required = false) Date startDate,
            @RequestParam("patientId") Patient patient){

        model.addAttribute("drugname", drugname);
        model.addAttribute("allergicOrderReason", allergicOrderReason);
        model.addAttribute("startDate", startDate);
        model.addAttribute("patientid", patient.getPatientId());
    }
}
