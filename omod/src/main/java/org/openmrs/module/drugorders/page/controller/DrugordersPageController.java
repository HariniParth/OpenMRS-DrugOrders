/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.page.controller;

/**
 *
 * @author harini-geek
 */

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.openmrs.CareSetting;
import org.openmrs.Concept;
import org.openmrs.Drug;
import org.openmrs.DrugOrder;
import org.openmrs.Encounter;
import org.openmrs.EncounterRole;
import org.openmrs.OrderFrequency;
import org.openmrs.Patient;
import org.openmrs.Provider;
import org.openmrs.api.APIException;
import org.openmrs.api.context.Context;
import org.openmrs.module.allergyapi.Allergies;
import org.openmrs.module.allergyapi.Allergy;
import org.openmrs.module.allergyapi.api.PatientService;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.api.drugordersdiseasesService;
import org.openmrs.module.drugorders.api.medicationplansService;
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.module.drugorders.drugordersActivator;
import org.openmrs.module.drugorders.drugordersdiseases;
import org.openmrs.module.drugorders.medicationplans;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.openmrs.module.uicommons.util.InfoErrorMessageUtil;
import org.springframework.web.bind.annotation.RequestParam;

public class DrugordersPageController {

    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient, 
            @RequestParam(value = "drugNameEntered", required = false) String drugNameSelected,
            @RequestParam(value = "startDateEntered", required = false) Date startDateEntered,
            @RequestParam(value = "drugRoute", required = false) String drugRoute,
            @RequestParam(value = "drugDose", required = false) String drugDose, 
            @RequestParam(value = "drugDoseUnits", required = false) String drugDoseUnits,
            @RequestParam(value = "drugQuantity", required = false) String drugQuantity, 
            @RequestParam(value = "quantityUnits", required = false) String quantityUnits,
            @RequestParam(value = "drugDuration", required = false) Integer drugDuration, 
            @RequestParam(value = "durationUnits", required = false) String durationUnits,
            @RequestParam(value = "drugFrequency", required = false) String drugFrequency,
            @RequestParam(value = "orderPriority", required = false) String orderPriority,
            @RequestParam(value = "refill", required = false) Integer refill,
            @RequestParam(value = "refillInterval", required = false) Integer refillInterval,
            @RequestParam(value = "associatedDiagnosis", required = false) String selectedDiagnosis,
            @RequestParam(value = "allergicOrderReason", required = false) String allergicOrderReason,
            @RequestParam(value = "patientInstructions", required = false) String patientInstructions, 
            @RequestParam(value = "pharmacistInstructions", required = false) String pharmacistInstructions,
            @RequestParam(value = "discontinueReasonCoded", required = false) String discontinueReasonCoded,
            @RequestParam(value = "discontinueReasonNonCoded", required = false) String discontinueReasonNonCoded,
            @SpringBean("allergyService") PatientService patientService, HttpSession session,
            @RequestParam(value = "action", required = false) String action,
            @RequestParam(value = "order_id", required = false) Integer orderId,
            @RequestParam(value = "orderClass", required = false) String orderClass,
            @RequestParam(value = "groupOrderID", required = false) Integer groupOrderID,
            @RequestParam(value = "groupCheckBox", required=false) long[] groupCheckBox,
            @RequestParam(value = "omitPlanItemCheckBox", required=false) String[] omitPlanItemCheckBox,
            @RequestParam(value = "diseaseForPlan", required = false) String diseaseForPlan,
            @RequestParam(value = "allergicDrugAction", required = false) String allergicDrugAction,
            @RequestParam(value = "allergicPlanItemOrderReason", required = false) String allergicPlanItemOrderReason) {

        String patientID = Integer.toString(patient.getPatientId());
        String drugNameEntered = drugNameSelected.trim();
        String associatedDiagnosis = selectedDiagnosis.trim();
        
        Allergies allergies = patientService.getAllergies(patient);
        model.addAttribute("allergies", allergies);
        
        if (StringUtils.isNotBlank(action)) {
            try {
                if ("CREATE DRUG ORDER".equals(action)) {
                    if (!(drugNameEntered.equals("")) && !(drugRoute.equals("")) && !(drugDose.equals("")) && !(drugDoseUnits.equals("")) && !(drugQuantity.equals("")) && !(quantityUnits.equals("")) && !(drugFrequency.equals("")) && (drugDuration != null) && !(durationUnits.equals(""))) {
                        
                        drugorders o = Context.getService(drugordersService.class).getDrugOrderByDrugAndPatient(Context.getConceptService().getConceptByName(drugNameEntered), patient);
                        if(o == null || !o.getOrderstatus().equals("Active")){
                            
                            DrugOrder drugOrder = null;
                            drugorders drugorder = null;
                            int order = createNewDrugOrder(drugOrder, patient, drugNameEntered, drugRoute, drugDose, drugDoseUnits, drugQuantity, quantityUnits, drugFrequency, drugDuration, durationUnits);
                            createDrugOrderExtension(drugorder, order, patientID, drugNameEntered, startDateEntered, allergicOrderReason, associatedDiagnosis, orderPriority, refill, refillInterval, patientInstructions, pharmacistInstructions);
                            
                            if(orderId != null){
                                Context.getService(drugordersService.class).getDrugOrderByOrderID(order).setGroupid(orderId);
                                Context.getService(drugordersService.class).getDrugOrderByOrderID(order).setOrderstatus("Active-Group");
                            }
                            InfoErrorMessageUtil.flashInfoMessage(session, "Order Created!");
                        } 
                        else {
                            InfoErrorMessageUtil.flashInfoMessage(session, "Order Exists!");
                        }
                    }
                }
                
                if ("SingleOrder".equals(action)) {
                    List<drugorders> newDrugOrders = Context.getService(drugordersService.class).getDrugOrdersByPatientAndStatus(patient, "New");
                    
                    for(drugorders order : newDrugOrders){
                        order.setOrderstatus("Active");
                    }
                    InfoErrorMessageUtil.flashInfoMessage(session, "Order Saved!");
                }
                
                if ("GroupOrder".equals(action)) {
                    if(groupCheckBox.length > 0){
                        int groupID = Context.getService(drugordersService.class).getLastGroupID() + 1;
                        
                        for(int i=0;i<groupCheckBox.length;i++){
                            int orderID = Integer.parseInt(Long.toString(groupCheckBox[i]));
                            drugorders orderInGroup = Context.getService(drugordersService.class).getDrugOrderByOrderID(orderID);
                            orderInGroup.setGroupid(groupID);
                            orderInGroup.setOrderstatus("Active-Group");
                        }
                        InfoErrorMessageUtil.flashInfoMessage(session, "Orders Saved!");
                    }
                    else
                        InfoErrorMessageUtil.flashErrorMessage(session, "Check Orders To Be Grouped!");
                }
                
                if ("selectMedPlan".equals(action)) {
                    
                    List<drugordersdiseases> existingMedPlanOrders = Context.getService(drugordersdiseasesService.class).getDrugOrdersByDiseaseAndPatient(Context.getConceptService().getConceptByName(diseaseForPlan), patient);
                    
                    if(existingMedPlanOrders.isEmpty()){
                        List<medicationplans> medplans = Context.getService(medicationplansService.class).getMedicationPlansByDisease(Context.getConceptService().getConceptByName(diseaseForPlan));
                        int planID = Context.getService(drugordersdiseasesService.class).getLastPlanID() + 1;
                        
                        for(medicationplans medplan : medplans){
                            
                            DrugOrder drugOrder = null;
                            drugorders drugorder = null;
                            boolean isAllergic = false;
                            boolean omitPlanItem = false;
                            
                            for(Allergy allergy : allergies){
                                if(allergy.getAllergen().toString().equals(medplan.getDrugid().getDisplayString())){
                                    allergicOrderReason = allergicPlanItemOrderReason;
                                    isAllergic = true;
                                }
                            }
                            
                            if(omitPlanItemCheckBox.length > 0){
                                if(Arrays.toString(omitPlanItemCheckBox).contains(medplan.getDrugid().getDisplayString())){
                                    omitPlanItem = true;
                                }
                            }
                            System.out.println(omitPlanItem);
                            if(!((allergicDrugAction.equals("discard") && isAllergic==true) || (omitPlanItem==true))){
                                int order = createNewDrugOrder(drugOrder, patient, medplan.getDrugid().getDisplayString(), medplan.getRoute().getDisplayString(), medplan.getDose().toString(), medplan.getDoseunits().getDisplayString(), medplan.getQuantity().toString(), medplan.getQuantityunits().getDisplayString(), medplan.getFrequency().getName(), medplan.getDuration(), medplan.getDurationunits().getDisplayString());
                                createDrugOrderExtension(drugorder, order, patientID, medplan.getDrugid().getDisplayString(), startDateEntered, allergicOrderReason, diseaseForPlan, orderPriority, 0, 0, patientInstructions, pharmacistInstructions);
                                Context.getService(drugordersService.class).getDrugOrderByOrderID(order).setOrderstatus("Active-Plan");
                                Context.getService(drugordersService.class).getDrugOrderByOrderID(order).setStartdate(Calendar.getInstance().getTime());
                                Context.getService(drugordersService.class).getDrugOrderByOrderID(order).setPriority(Context.getConceptService().getConceptByName("High"));
                                createDiseasePlan(order,planID,patientID,diseaseForPlan);
                            }
                        }
                    }
                    
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Saved!");
                }
                
                if ("DISCONTINUE ORDER".equals(action)){
                    drugorders order = Context.getService(drugordersService.class).getDrugOrderByOrderID(groupOrderID);
                    order.setOrderstatus("Non-Active");
                    if(!(discontinueReasonCoded.equalsIgnoreCase(""))){
                        order.setDiscontinuereason(Context.getConceptService().getConceptByName(discontinueReasonCoded.trim()));
                    }
                    if(!(discontinueReasonNonCoded.equals(""))){
                        order.setDiscontinuationreasons(discontinueReasonNonCoded);
                    }
                    Context.getOrderService().voidOrder(Context.getOrderService().getOrder(groupOrderID), "Discontinued");
                    
                    InfoErrorMessageUtil.flashInfoMessage(session, "Order Discontinued!");
                }
                
                if ("DISCARD ORDER GROUP".equals(action)) {
                    List<drugorders> orders = Context.getService(drugordersService.class).getDrugOrdersByGroupID(groupOrderID);
                    
                    for(drugorders order : orders){
                        order.setOrderstatus("Non-Active-Group");
                        if(!(discontinueReasonCoded.equalsIgnoreCase(""))){
                            order.setDiscontinuereason(Context.getConceptService().getConceptByName(discontinueReasonCoded.trim()));
                        }
                        if(!(discontinueReasonNonCoded.equals(""))){
                            order.setDiscontinuationreasons(discontinueReasonNonCoded);
                        }
                        Context.getOrderService().voidOrder(Context.getOrderService().getOrder(order.getOrderid()), "Discontinued-Group");
                    }
                    
                    InfoErrorMessageUtil.flashInfoMessage(session, "Orders Discontinued!");
                }
                
                if ("RENEW ORDER GROUP".equals(action)) {
                    List<drugorders> orders = Context.getService(drugordersService.class).getDrugOrdersByGroupID(groupOrderID);
                    int groupID = Context.getService(drugordersService.class).getLastGroupID() + 1;
                    
                    for(drugorders order : orders){
                        DrugOrder drugOrderMain = (DrugOrder) Context.getOrderService().getOrder(order.getOrderid());
                        DrugOrder drugOrder = null;
                        drugorders drugorder = null;
                        int orderID = createNewDrugOrder(drugOrder, patient, order.getDrugname().getDisplayString(), drugOrderMain.getRoute().getDisplayString(), drugOrderMain.getDose().toString(), drugOrderMain.getDoseUnits().getDisplayString(), drugOrderMain.getQuantity().toString(), drugOrderMain.getQuantityUnits().getDisplayString(), drugOrderMain.getFrequency().getName(), drugOrderMain.getDuration(), drugOrderMain.getDurationUnits().getDisplayString());
                        createDrugOrderExtension(drugorder, orderID, patientID, order.getDrugname().getDisplayString(), Calendar.getInstance().getTime(), "", order.getAssociateddiagnosis().getDisplayString(), order.getPriority().getDisplayString(), order.getRefill(), order.getRefillinterval(), "", "");
                        Context.getService(drugordersService.class).getDrugOrderByOrderID(orderID).setGroupid(groupID);
                        Context.getService(drugordersService.class).getDrugOrderByOrderID(orderID).setOrderstatus("Active-Group");
                    }
                    
                    InfoErrorMessageUtil.flashInfoMessage(session, "Orders Saved!");
                }
                
                if ("DISCARD MED PLAN".equals(action)){
                    List<drugordersdiseases> orders = Context.getService(drugordersdiseasesService.class).getDrugOrdersByPlanID(groupOrderID);
                    
                    for(drugordersdiseases order : orders){
                        
                        drugorders drugorder = Context.getService(drugordersService.class).getDrugOrderByOrderID(order.getOrderid());
                        drugorder.setOrderstatus("Non-Active-Plan");
                        if(!(discontinueReasonCoded.equalsIgnoreCase(""))){
                            drugorder.setDiscontinuereason(Context.getConceptService().getConceptByName(discontinueReasonCoded.trim()));
                        }
                        if(!(discontinueReasonNonCoded.equals(""))){
                            drugorder.setDiscontinuationreasons(discontinueReasonNonCoded);
                        }
                        Context.getOrderService().voidOrder(Context.getOrderService().getOrder(order.getOrderid()), "Discontinued-Plan");
                    }
                }
                
                if ("RENEW MED PLAN".equals(action)){
                    List<drugordersdiseases> planOrders = Context.getService(drugordersdiseasesService.class).getDrugOrdersByPlanID(groupOrderID);
                    int planID = Context.getService(drugordersdiseasesService.class).getLastPlanID() + 1;
                    
                    for(drugordersdiseases planOrder : planOrders){
                        DrugOrder orderMain = (DrugOrder) Context.getOrderService().getOrder(planOrder.getOrderid());
                        drugorders orderExtn = Context.getService(drugordersService.class).getDrugOrderByOrderID(planOrder.getOrderid());
                        
                        DrugOrder drugOrder = null;
                        drugorders drugorder = null;
                        int order = createNewDrugOrder(drugOrder, patient, orderExtn.getDrugname().getDisplayString(), orderMain.getRoute().getDisplayString(), orderMain.getDose().toString(), orderMain.getDoseUnits().getDisplayString(), orderMain.getQuantity().toString(), orderMain.getQuantityUnits().getDisplayString(), orderMain.getFrequency().getName(), orderMain.getDuration(), orderMain.getDurationUnits().getDisplayString());
                        createDrugOrderExtension(drugorder, order, patientID, orderExtn.getDrugname().getDisplayString(), Calendar.getInstance().getTime(), "", planOrder.getDiseaseid().getDisplayString(), orderExtn.getPriority().getDisplayString(), orderExtn.getRefill(), orderExtn.getRefillinterval(), "", "");
                        createDiseasePlan(order, planID, patientID, planOrder.getDiseaseid().getDisplayString());
                        Context.getService(drugordersService.class).getDrugOrderByOrderID(order).setOrderstatus("Active-Plan");
                    }
                    
                    InfoErrorMessageUtil.flashInfoMessage(session, "Plan Renewed!");
                }
                
                if ("EDIT DRUG ORDER".equals(action)) {
                    
                    drugorders originalOrderExtension = Context.getService(drugordersService.class).getDrugOrderByOrderID(orderId);
                    
                    Context.getOrderService().voidOrder(Context.getOrderService().getOrder(orderId), "Discontinued");

                    DrugOrder drugOrder = null;
                    drugorders drugorder = null;

                    int order = createNewDrugOrder(drugOrder, patient, drugNameEntered, drugRoute, drugDose, drugDoseUnits, drugQuantity, quantityUnits, drugFrequency, drugDuration, durationUnits);
                    createDrugOrderExtension(drugorder, order, patientID, drugNameEntered, startDateEntered, allergicOrderReason, associatedDiagnosis, orderPriority, refill, refillInterval, patientInstructions, pharmacistInstructions);
                    
                    if(orderClass.equals("PLAN")){
                        originalOrderExtension.setOrderstatus("Non-Active-Plan");
                        Context.getService(drugordersService.class).getDrugOrderByOrderID(order).setOrderstatus("Active-Plan");
                        Context.getService(drugordersdiseasesService.class).getDrugOrderByOrderID(originalOrderExtension.getOrderid()).setOrderid(order);
                    } 
                    else if(orderClass.equals("SINGLE")){
                        originalOrderExtension.setOrderstatus("Non-Active");
                        Context.getService(drugordersService.class).getDrugOrderByOrderID(order).setOrderstatus("Active");
                    }
                    else if(orderClass.equals("GROUP")){
                        originalOrderExtension.setOrderstatus("Non-Active-Group");
                        Context.getService(drugordersService.class).getDrugOrderByOrderID(order).setOrderstatus("Active-Group");
                        Context.getService(drugordersService.class).getDrugOrderByOrderID(order).setGroupid(originalOrderExtension.getGroupid());
                        originalOrderExtension.setGroupid(null);
                    }
                    
                    InfoErrorMessageUtil.flashInfoMessage(session, "Order Changes Saved!");
                }

                if ("RENEW DRUG ORDER".equals(action)) {
                    
                    drugorders originalOrderExtension = Context.getService(drugordersService.class).getDrugOrderByOrderID(orderId);
                    String drugName = originalOrderExtension.getDrugname().getDisplayString();

                    DrugOrder drugOrder = null;
                    drugorders drugorder = null;
                    int order = createNewDrugOrder(drugOrder, patient, drugName, drugRoute, drugDose, drugDoseUnits, drugQuantity, quantityUnits, drugFrequency, drugDuration, durationUnits);
                    createDrugOrderExtension(drugorder, order, patientID, drugName, startDateEntered, allergicOrderReason, associatedDiagnosis, orderPriority, refill, refillInterval, patientInstructions, pharmacistInstructions);
                    InfoErrorMessageUtil.flashInfoMessage(session, "Order Renewed!");
                }
                
            } catch (APIException e) {
                System.out.println(e.toString());
            } catch (NumberFormatException e) {
                System.out.println(e.toString());
            }
        }
    }

    private int createNewDrugOrder(DrugOrder order, Patient patient, String drugNameConfirmed, String drugRoute,
            String drugDose, String drugDoseUnits, String drugQuantity, String quantityUnits,
            String drugFrequency, Integer drugDuration, String durationUnits) {

        order = new DrugOrder();
        
        if(Context.getConceptService().getConceptByName(drugNameConfirmed) == null){
            
            drugordersActivator activator = new drugordersActivator();
            Concept drugConcept =  activator.saveConcept(drugNameConfirmed, Context.getConceptService().getConceptClassByName("Drug"));
            order.setConcept(drugConcept);
            
            Drug drug = new Drug();
            drug.setName(drugNameConfirmed);
            drug.setConcept(drugConcept);
            Context.getConceptService().saveDrug(drug);
            order.setDrug(drug);
            
        } else {
            order.setConcept(Context.getConceptService().getConceptByName(drugNameConfirmed));
            order.setDrug(Context.getConceptService().getDrugByNameOrId(drugNameConfirmed));
        }
                    
        CareSetting careSetting = Context.getOrderService().getCareSettingByName("Outpatient");
        order.setCareSetting(careSetting);

        Date start = defaultStartDate(),
                end = defaultEndDate(start);
        List<Encounter> encs = Context.getEncounterService().getEncounters(patient, null, start, end, null, null, null, null, null, false);

        Encounter encOld = encs.get(0), enc = new Encounter();
        enc.setEncounterDatetime(new Date());
        enc.setPatient(patient);
        enc.setEncounterType(encOld.getEncounterType());
        enc.setLocation(encOld.getLocation());
        List<Provider> provs = Context.getProviderService().getAllProviders();
        Provider provider = provs.get(0);
        EncounterRole encRole = Context.getEncounterService().getEncounterRoleByName("Unknown");
        enc.setProvider(encRole, provider);
        enc = (Encounter) Context.getEncounterService().saveEncounter(enc);

        order.setPatient(patient);
        order.setEncounter(enc);
        order.setOrderer(provider);

        order.setRoute(Context.getConceptService().getConceptByName(drugRoute));
        order.setDose(Double.valueOf(drugDose));
        order.setDoseUnits(Context.getConceptService().getConceptByName(drugDoseUnits));
        order.setQuantity(Double.valueOf(drugQuantity));
        order.setQuantityUnits(Context.getConceptService().getConceptByName(quantityUnits));
        order.setDuration(drugDuration);
        order.setDurationUnits(Context.getConceptService().getConceptByName(durationUnits));
        OrderFrequency orderFrequency = Context.getOrderService().getOrderFrequencyByConcept(Context.getConceptService().getConceptByName(drugFrequency));
        order.setFrequency(orderFrequency);
        order.setNumRefills(0);
        order = (DrugOrder) Context.getOrderService().saveOrder(order, null);
        int orderID = order.getOrderId();
        return orderID; 
    }
    
    private void createDrugOrderExtension(drugorders drugorder, int drugOrderID, String patientID, String drugName, Date startDate, String allergicOrderReason, String diagnosis, String orderPriority, int refill, int refillInterval, String patientInstructions, String pharmacistInstructions){
        drugorder = new drugorders();
        drugorder.setOrderid(drugOrderID);
        drugorder.setDrugname(Context.getConceptService().getConceptByName(drugName));
        drugorder.setStartdate(startDate);
        drugorder.setPatientid(patientID);
        drugorder.setRefill(refill);
        drugorder.setRefillinterval(refillInterval);
        drugorder.setOrderstatus("New");
        drugorder.setPriority(Context.getConceptService().getConceptByName(orderPriority));
        drugorder.setUuid(UUID.randomUUID().toString());
        drugorder.setOnhold(0);
        drugorder.setFordiscard(0);
        
        if(Context.getConceptService().getConceptByName(diagnosis) == null){
            drugordersActivator activator = new drugordersActivator();
            Concept diagnosisConcept =  activator.saveConcept(diagnosis, Context.getConceptService().getConceptClassByName("Diagnosis"));
            drugorder.setAssociateddiagnosis(diagnosisConcept);
        } else {
            drugorder.setAssociateddiagnosis(Context.getConceptService().getConceptByName(diagnosis));
        }
            
        if(!(allergicOrderReason).equals(""))
            drugorder.setIsallergicorderreasons(allergicOrderReason);
        if(!(patientInstructions).equals(""))
            drugorder.setPatientinstructions(patientInstructions);
        if(!(pharmacistInstructions).equals(""))
            drugorder.setPharmacistinstructions(pharmacistInstructions);
        
        Context.getService(drugordersService.class).saveDrugOrder(drugorder);
    }
    
    private void createDiseasePlan(int drugOrderID, int planID, String patientID, String diseaseName){
        
        drugordersdiseases diseaseDrugOrder = new drugordersdiseases();
        diseaseDrugOrder.setUuid(UUID.randomUUID().toString());
        diseaseDrugOrder.setPlanid(planID);
        diseaseDrugOrder.setOrderid(drugOrderID);
        diseaseDrugOrder.setPatientid(patientID);
        diseaseDrugOrder.setDiseaseid(Context.getConceptService().getConceptByName(diseaseName));
        Context.getService(drugordersdiseasesService.class).saveDrugOrder(diseaseDrugOrder);
        
    }

    private Date defaultStartDate() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        cal.set(2014, 1, 1);
        return cal.getTime();
    }

    private Date defaultEndDate(Date startDate) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(startDate);
        cal.add(Calendar.DAY_OF_MONTH, 1);
        cal.add(Calendar.MILLISECOND, -1);
        cal.set(2014, 12, 22);
        return cal.getTime();
    }

}