/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.ArrayList;
import java.util.List;
import org.openmrs.Order;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.module.drugorders.page.controller.OrderAndDrugOrder;
import org.openmrs.ui.framework.annotation.FragmentParam;
import org.openmrs.ui.framework.fragment.FragmentModel;

/**
 *
 * @author harini-geek
 */
public class DrugordersFragmentController {
    
    public void controller(FragmentModel model, @FragmentParam("patientId") Patient patient){
        
        ArrayList<OrderAndDrugOrder> drugOrders = new ArrayList<OrderAndDrugOrder>();
        List<drugorders> dorders = new ArrayList<drugorders>();
        
        List<Order> orders = Context.getOrderService().getAllOrdersByPatient(patient);
        int drugOrderTypeId = Context.getOrderService().getOrderTypeByName("Drug Order").getOrderTypeId();
        drugorders drugOrder;
        
        for (Order order : orders) {
            if (order.getOrderType().getOrderTypeId() == drugOrderTypeId) {
                drugOrder = Context.getService(drugordersService.class).getDrugOrderByOrderID(order.getOrderId());
                drugOrders.add(new OrderAndDrugOrder(order, drugOrder));
            }
        }
        
        for(OrderAndDrugOrder order : drugOrders){
            drugorders dorder = order.getdrugorders();
            dorders.add(dorder);
        }
        
        model.addAttribute("drugorders", dorders);
    }
}
