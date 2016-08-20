/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.List;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class EditDrugOrderFragmentController {
    
    public void controller(PageModel model,@RequestParam("patientId") Patient patient){

        List<drugorders> newDrugOrders = Context.getService(drugordersService.class).getDrugOrdersByStatus("New");
        model.addAttribute("newDrugOrders", newDrugOrders);
    }
}