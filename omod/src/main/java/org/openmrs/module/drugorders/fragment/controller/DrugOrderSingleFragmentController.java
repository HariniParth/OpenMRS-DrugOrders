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
import org.openmrs.module.drugorders.page.controller.OrderAndDrugOrder;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class DrugOrderSingleFragmentController {
    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient){
        
        List<drugorders> dorders = new ArrayList<drugorders>();
        HashMap<Integer,List<drugorders>> groupDorders = new HashMap<Integer,List<drugorders>>();
        
        List<OrderAndDrugOrder> drugOrders = getDrugOrdersByPatient(patient);
                
        for(OrderAndDrugOrder drugOrder : drugOrders){
            drugorders dorder = drugOrder.getdrugorders();
            if((dorder.getOrderstatus().equals("Active")) || (dorder.getOrderstatus().equals("Discontinued")))
                dorders.add(dorder);
            else if((dorder.getOrderstatus().equals("Active-Group"))){
                if(groupDorders.get(dorder.getOrderId()) == null){
                    groupDorders.put(dorder.getGroupid(), Context.getService(drugordersService.class).getDrugOrdersByGroupID(dorder.getGroupid()));
                }
            }
        }
                
        model.addAttribute("existingDrugOrdersExtension", dorders);
        model.addAttribute("existingDrugOrderGroups", groupDorders);
        
        List<DrugOrder> drugOrderMain = getDrugOrderMainDataByPatient(patient);
        model.addAttribute("existingDrugOrdersMain", drugOrderMain);
                
    }
    
    private List<OrderAndDrugOrder> getDrugOrdersByPatient(Patient p) {
        ArrayList<OrderAndDrugOrder> drugOrders = new ArrayList<OrderAndDrugOrder>();
        List<Order> orders = Context.getOrderService().getAllOrdersByPatient(p);
        int drugOrderTypeId = Context.getOrderService().getOrderTypeByName("Drug Order").getOrderTypeId();
        drugorders drugOrder;
        
        for (Order order : orders) {
            if (order.getOrderType().getOrderTypeId() == drugOrderTypeId) {
                drugOrder = Context.getService(drugordersService.class).getDrugOrderByID(order.getOrderId());
                drugOrders.add(new OrderAndDrugOrder(order, drugOrder));
            }
        }
        return drugOrders;
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