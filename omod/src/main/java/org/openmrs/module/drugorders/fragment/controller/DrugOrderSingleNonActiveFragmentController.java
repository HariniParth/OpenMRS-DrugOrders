/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.openmrs.DrugOrder;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.module.drugorders.page.controller.DrugOrderList;
import org.openmrs.module.drugorders.page.controller.OrderAndDrugOrder;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class DrugOrderSingleNonActiveFragmentController {
    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient){
        
        List<drugorders> dorders = new ArrayList<drugorders>();
        HashMap<Integer,List<drugorders>> groupDorders = new HashMap<Integer,List<drugorders>>();
        
        List<OrderAndDrugOrder> drugOrders = DrugOrderList.getDrugOrdersByPatient(patient);
                
        for(OrderAndDrugOrder drugOrder : drugOrders){
            drugorders dorder = drugOrder.getdrugorders();
            if(dorder.getOrderstatus().equals("Non-Active"))
                dorders.add(dorder);
            else if(dorder.getOrderstatus().equals("Non-Active-Group")){
                if(groupDorders.get(dorder.getOrderid()) == null){
                    groupDorders.put(dorder.getGroupid(), Context.getService(drugordersService.class).getDrugOrdersByGroupID(dorder.getGroupid()));
                }
            }
        }
                
        model.addAttribute("oldDrugOrdersExtension", dorders);
        model.addAttribute("oldDrugOrderGroups", groupDorders);
        
        HashMap<Integer,DrugOrder> oldDrugOrdersMain = DrugOrderList.getDrugOrderMainDataByPatient(patient);
        model.addAttribute("oldDrugOrdersMain", oldDrugOrdersMain);
                
    }
}