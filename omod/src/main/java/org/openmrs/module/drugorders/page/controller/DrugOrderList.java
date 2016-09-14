/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.page.controller;

import java.util.ArrayList;
import java.util.List;
import org.openmrs.Order;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.drugorders;

/**
 *
 * @author harini-geek
 */
public class DrugOrderList {
    
    public DrugOrderList(){
        
    }
    
    public static List<OrderAndDrugOrder> getDrugOrdersByPatient(Patient p) {
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
    
    public static List<org.openmrs.DrugOrder> getDrugOrderMainDataByPatient(Patient p){
        ArrayList<org.openmrs.DrugOrder> drugOrdersMain = new ArrayList<org.openmrs.DrugOrder>();
        List<Order> orders = Context.getOrderService().getAllOrdersByPatient(p);
        int drugOrderTypeId = Context.getOrderService().getOrderTypeByName("Drug Order").getOrderTypeId();
        org.openmrs.DrugOrder drugOrderMain;
        
        for (Order order : orders) {
            if (order.getOrderType().getOrderTypeId() == drugOrderTypeId){
                drugOrderMain = (org.openmrs.DrugOrder) Context.getOrderService().getOrder(order.getOrderId());
                drugOrdersMain.add(drugOrderMain);
            }
        }
        return drugOrdersMain;
    }
    
}
