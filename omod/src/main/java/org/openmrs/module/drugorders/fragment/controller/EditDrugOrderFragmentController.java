/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.DrugOrder;
import org.openmrs.Order;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.ui.framework.page.PageModel;
import org.apache.commons.lang.StringUtils;
import org.openmrs.api.APIException;
import org.openmrs.module.drugorders.api.drugordersdiseasesService;
import org.openmrs.module.drugorders.drugordersdiseases;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author harini-geek
 */
public class EditDrugOrderFragmentController {
        
    public void controller(PageModel model,@RequestParam("patientId") Patient patient,
                            @RequestParam(value = "selectedActivePlan", required = false) String selectedActivePlan,
                            @RequestParam(value = "selectedNonActivePlan", required = false) String selectedNonActivePlan,
                            @RequestParam(value = "selectedActiveGroup", required = false) String selectedActiveGroup,
                            @RequestParam(value = "selectedNonActiveGroup", required = false) String selectedNonActiveGroup,
                            @RequestParam(value = "diseaseForPlan", required = false) String diseaseForPlan,
                            @RequestParam(value = "associatedDiagnosis", required = false) String associatedDiagnosis){

        HashMap<Integer,DrugOrder> groupMain = new HashMap<Integer,DrugOrder>();
        HashMap<Integer,drugorders> groupExtn = new HashMap<Integer,drugorders>();
        
        model.addAttribute("diseaseForPlan", diseaseForPlan);
        model.addAttribute("associatedDiagnosis", associatedDiagnosis);
        
        ConceptClass reasonConcept = Context.getConceptService().getConceptClassByName("Discontinue Order Reasons");
        List<Concept> discontinueReasons = Context.getConceptService().getConceptsByClass(reasonConcept);
        model.addAttribute("discontinueReasons", discontinueReasons);
        
        
        List<drugorders> drugOrders = Context.getService(drugordersService.class).getDrugOrdersByPatientAndStatus(patient, "New");
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
        
        
        if(StringUtils.isNotBlank(selectedActiveGroup)){
            try {
                int group = Integer.parseInt(selectedActiveGroup);
                List<drugorders> groupOrders = Context.getService(drugordersService.class).getDrugOrdersByGroupID(group);
                for(drugorders groupOrder: groupOrders){
                    groupMain.put(groupOrder.getOrderId(), (DrugOrder) Context.getOrderService().getOrder(groupOrder.getOrderId()));
                    groupExtn.put(groupOrder.getOrderId(), Context.getService(drugordersService.class).getDrugOrderByOrderID(groupOrder.getOrderId()));
                }
                model.addAttribute("group", group);
                model.addAttribute("groupOrderAction", "DISCARD ORDER GROUP");
                
            } catch(NumberFormatException e){
                System.out.println(e.toString());
            } catch (APIException e) {
                System.out.println(e.toString());
            }
        }
        
        
        if(StringUtils.isNotBlank(selectedNonActiveGroup)){
            try {
                int group = Integer.parseInt(selectedNonActiveGroup);
                List<drugorders> groupOrders = Context.getService(drugordersService.class).getDrugOrdersByGroupID(group);
                for(drugorders groupOrder: groupOrders){
                    groupMain.put(groupOrder.getOrderId(), (DrugOrder) Context.getOrderService().getOrder(groupOrder.getOrderId()));
                    groupExtn.put(groupOrder.getOrderId(), Context.getService(drugordersService.class).getDrugOrderByOrderID(groupOrder.getOrderId()));
                }
                model.addAttribute("group", group);
                model.addAttribute("groupOrderAction", "RENEW ORDER GROUP");
                
            } catch(NumberFormatException e){
                System.out.println(e.toString());
            } catch (APIException e) {
                System.out.println(e.toString());
            }
        }
        
                
        if(StringUtils.isNotBlank(selectedActivePlan)){
            try {
                int group = 0;
                Concept planConcept = Context.getConceptService().getConceptByName(selectedActivePlan);
                List<drugorders> planOrders = Context.getService(drugordersService.class).getDrugOrdersByPatientAndStatus(patient, "Active-Plan");
                for(drugorders planOrder: planOrders){
                    if(planOrder.getAssociateddiagnosis() == planConcept){
                        groupMain.put(planOrder.getOrderId(), (DrugOrder) Context.getOrderService().getOrder(planOrder.getOrderId()));
                        groupExtn.put(planOrder.getOrderId(), Context.getService(drugordersService.class).getDrugOrderByOrderID(planOrder.getOrderId()));
                        if(group == 0)
                            group = Context.getService(drugordersdiseasesService.class).getDrugOrderByOrderID(planOrder.getOrderId()).getPlanid();
                    }
                }
                model.addAttribute("group", group);
                model.addAttribute("groupOrderAction", "DISCARD MED PLAN");
                
            } catch(NumberFormatException e){
                System.out.println(e.toString());
            } catch (APIException e) {
                System.out.println(e.toString());
            }
        }
        
                
        if(StringUtils.isNotBlank(selectedNonActivePlan)){
            try {
                int group = Integer.parseInt(selectedNonActivePlan);
                List<drugordersdiseases> planOrders = Context.getService(drugordersdiseasesService.class).getDrugOrdersByPlanID(group);
                for(drugordersdiseases planOrder : planOrders){
                    groupMain.put(planOrder.getOrderid(), (DrugOrder) Context.getOrderService().getOrder(planOrder.getOrderid()));
                    groupExtn.put(planOrder.getOrderid(), Context.getService(drugordersService.class).getDrugOrderByOrderID(planOrder.getOrderid()));
                }
                model.addAttribute("group", group);
                model.addAttribute("groupOrderAction", "RENEW MED PLAN");
                
            } catch(NumberFormatException e){
                System.out.println(e.toString());
            } catch (APIException e) {
                System.out.println(e.toString());
            }
        }
        
        model.addAttribute("groupMain", groupMain);
        model.addAttribute("groupExtn", groupExtn);
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