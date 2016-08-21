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
import org.openmrs.Order;
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

        List<drugorders> drugOrders = Context.getService(drugordersService.class).getDrugOrdersByStatus("New");
        HashMap<Integer,drugorders> newDrugOrders = new HashMap<Integer,drugorders>();
        for(drugorders order : drugOrders){
            newDrugOrders.put(order.getOrderId(), order);
        }
        model.addAttribute("newDrugOrders", newDrugOrders);
        
        List<DrugOrder> orderMainData = getDrugOrderMainDataByPatient(patient);
        HashMap<Integer,DrugOrder> newOrderMainData = new HashMap<Integer,DrugOrder>();
        for(DrugOrder order : orderMainData){
            newOrderMainData.put(order.getOrderId(), order);
        }
        model.addAttribute("newOrderMainData", newOrderMainData);
        
    }
    
    private List<DrugOrder> getDrugOrderMainDataByPatient(Patient p){
        ArrayList<DrugOrder> drugOrdersMain = new ArrayList<DrugOrder>();
        List<Order> orders = Context.getOrderService().getAllOrdersByPatient(p);
        int drugOrderTypeId = Context.getOrderService().getOrderTypeByName("Drug Order").getOrderTypeId();
        DrugOrder drugOrderMain;
        
        for (Order order : orders) {
            if (order.getOrderType().getOrderTypeId() == drugOrderTypeId){
                drugOrderMain = (DrugOrder) Context.getOrderService().getOrder(order.getOrderId());
                drugOrdersMain.add(drugOrderMain);
            }
        }
        return drugOrdersMain;
    }
}