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

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import org.apache.commons.lang.StringUtils;
import org.openmrs.CareSetting;
import org.openmrs.DrugOrder;
import org.openmrs.Encounter;
import org.openmrs.EncounterRole;
import org.openmrs.OrderFrequency;
import org.openmrs.Patient;
import org.openmrs.Provider;
import org.openmrs.api.context.Context;
import org.openmrs.module.allergyapi.api.PatientService;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.api.drugordersdiseasesService;
import org.openmrs.module.drugorders.api.drugordersgroupsService;
import org.openmrs.module.drugorders.api.medicationplansService;
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.module.drugorders.drugordersdiseases;
import org.openmrs.module.drugorders.drugordersgroups;
import org.openmrs.module.drugorders.medicationplans;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

public class DrugordersPageController {

    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient, 
            @RequestParam(value = "drugNameEntered", required = false) String drugNameSelected,
            @RequestParam(value = "startDateEntered", required = false) Date startDateEntered,
            @RequestParam(value = "allergicOrderReason", required = false) String allergicOrderReason,
            @RequestParam(value = "associatedDiagnosis", required = false) String selectedDiagnosis,
            @RequestParam(value = "drugRoute", required = false) String drugRoute, 
            @RequestParam(value = "drugFrequency", required = false) String drugFrequency,
            @RequestParam(value = "drugDose", required = false) String drugDose, 
            @RequestParam(value = "drugDoseUnits", required = false) String drugDoseUnits,
            @RequestParam(value = "drugQuantity", required = false) String drugQuantity, 
            @RequestParam(value = "quantityUnits", required = false) String quantityUnits,
            @RequestParam(value = "drugDuration", required = false) Integer drugDuration, 
            @RequestParam(value = "durationUnits", required = false) String durationUnits,
            @RequestParam(value = "patientInstructions", required = false) String patientInstructions, 
            @RequestParam(value = "pharmacistInstructions", required = false) String pharmacistInstructions,
            @RequestParam(value = "discontinueOrderReasonCoded", required = false) String discontinueOrderReasonCoded,
            @RequestParam(value = "discontinueOrderReasonNonCoded", required = false) String discontinueOrderReasonNonCoded,
            @SpringBean("allergyService") PatientService patientService,
            @RequestParam(value = "action", required = false) String action,
            @RequestParam(value = "groupCheckBox", required=false) long[] groupCheckBox,
            @RequestParam(value = "diseaseForPlan", required = false) String diseaseForPlan,
            @RequestParam(value = "dis_order_id", required = false) Integer dis_order_id, 
            @RequestParam(value = "order_id", required = false) Integer order_id) {

        String patientID = Integer.toString(patient.getPatientId());
        String drugNameEntered = drugNameSelected.replace(" ", "");
        String associatedDiagnosis = selectedDiagnosis.replace(" ", "");
        model.addAttribute("allergies", patientService.getAllergies(patient));
        
        if (StringUtils.isNotBlank(action)) {
            try {
                if ("Create Drug Order".equals(action)) {
                    if (!(drugNameEntered.equals("")) && !(drugRoute.equals("")) && !(drugDose.equals("")) && !(drugDoseUnits.equals("")) && !(drugQuantity.equals("")) && !(quantityUnits.equals("")) && !(drugFrequency.equals("")) && (drugDuration != null) && !(durationUnits.equals(""))) {
                        DrugOrder drugOrder = null;
                        drugorders drugorder = null;
                        int order = createNewDrugOrder(drugOrder, patient, drugNameEntered, drugRoute, drugDose, drugDoseUnits, drugQuantity, quantityUnits, drugFrequency, drugDuration, durationUnits);
                        createDrugOrderExtension(drugorder, order, patientID, drugNameEntered, startDateEntered, allergicOrderReason, associatedDiagnosis, patientInstructions, pharmacistInstructions);
                    }
                }

                if ("discontinueDrugOrder".equals(action)) {
                    drugorders drugorderToDiscontinue = Context.getService(drugordersService.class).getDrugOrderByID(dis_order_id);
                    drugorderToDiscontinue.setOrderstatus("Discontinued");
                    
                    if(!(discontinueOrderReasonCoded.equalsIgnoreCase(""))){
                        String discontinueOrderCoded = discontinueOrderReasonCoded.replace("", "");
                        drugorderToDiscontinue.setDiscontinuereason(Context.getConceptService().getConceptByName(discontinueOrderCoded));
                    }
                    
                    if(!(discontinueOrderReasonNonCoded.equals(""))){
                        drugorderToDiscontinue.setDiscontinuationreasons(discontinueOrderReasonCoded);
                    }
                    
                    Context.getOrderService().voidOrder(Context.getOrderService().getOrder(dis_order_id), "Discontinued");
                }
                
                if ("confirmOrderGroup".equals(action)) {
                    List<drugorders> newDrugOrders = Context.getService(drugordersService.class).getDrugOrdersByStatus("New");
                    for(drugorders order : newDrugOrders){
                        order.setOrderstatus("Active");
                        for(int i=0;i<groupCheckBox.length;i++){
                            int orderID = Integer.parseInt(Long.toString(groupCheckBox[i]));
                            drugordersgroups groupItem = new drugordersgroups();
                            groupItem.setGroupid(orderID);
                            groupItem.setOrderid(orderID);
                            Context.getService(drugordersgroupsService.class).saveDrugOrderGroup(groupItem);
                        }
                    }
                }
                
                if ("selectMedPlan".equals(action)) {
                    List<medicationplans> medplans = Context.getService(medicationplansService.class).getMedicationPlansByDisease(Context.getConceptService().getConceptByName(diseaseForPlan));
                    
                    for(medicationplans medplan : medplans){
                        
                        DrugOrder drugOrder = null;
                        drugorders drugorder = null;
                        int order = createNewDrugOrder(drugOrder, patient, medplan.getDrugid().getDisplayString(), medplan.getRoute().getDisplayString(), medplan.getDose().toString(), medplan.getDoseunits().getDisplayString(), medplan.getQuantity().toString(), medplan.getQuantityunits().getDisplayString(), medplan.getFrequency().getName(), medplan.getDuration(), medplan.getDurationunits().getDisplayString());
                        createDrugOrderExtension(drugorder, order, patientID, medplan.getDrugid().getDisplayString(), startDateEntered, allergicOrderReason, associatedDiagnosis, patientInstructions, pharmacistInstructions);
                        Context.getService(drugordersService.class).getDrugOrderByOrderID(order).setOrderstatus("Plan");
                        createDiseasePlan(order,patientID,diseaseForPlan);
                        
                    }
                }
                
                if ("confirmMedPlan".equals(action)) {
                    List<drugorders> newDrugOrders = Context.getService(drugordersService.class).getDrugOrdersByStatus("Plan");
                    for(drugorders order : newDrugOrders){
                        order.setOrderstatus("Active-Plan");
                    }
                }
                
                if ("Edit Drug Order".equals(action)) {
                    
                    drugorders originalOrderExtension = Context.getService(drugordersService.class).getDrugOrderByID(order_id);
                    String drugName = originalOrderExtension.getDrugname().getDisplayString();

                    Context.getService(drugordersService.class).deleteDrugOrder(Context.getService(drugordersService.class).getDrugOrderByID(order_id));
                    Context.getOrderService().purgeOrder(Context.getOrderService().getOrder(order_id), true);

                    DrugOrder drugOrder = null;
                    drugorders drugorder = null;

                    int order = createNewDrugOrder(drugOrder, patient, drugName, drugRoute, drugDose, drugDoseUnits, drugQuantity, quantityUnits, drugFrequency, drugDuration, durationUnits);
                    createDrugOrderExtension(drugorder, order, patientID, drugName, startDateEntered, allergicOrderReason, associatedDiagnosis, patientInstructions, pharmacistInstructions);
              
                }

                if ("Renew Drug Order".equals(action)) {
                    drugorders originalOrderExtension = Context.getService(drugordersService.class).getDrugOrderByID(order_id);
                    String drugName = originalOrderExtension.getDrugname().getDisplayString();

                    DrugOrder drugOrder = null;
                    drugorders drugorder = null;
                    int order = createNewDrugOrder(drugOrder, patient, drugName, drugRoute, drugDose, drugDoseUnits, drugQuantity, quantityUnits, drugFrequency, drugDuration, durationUnits);
                    createDrugOrderExtension(drugorder, order, patientID, drugName, startDateEntered, allergicOrderReason, associatedDiagnosis, patientInstructions, pharmacistInstructions);
                }
                
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }
    }

    private int createNewDrugOrder(DrugOrder order, Patient patient, String drugNameConfirmed, String drugRoute,
            String drugDose, String drugDoseUnits, String drugQuantity, String quantityUnits,
            String drugFrequency, Integer drugDuration, String durationUnits) {

        int orderID = 0;
        order = new DrugOrder();
        order.setDrug(Context.getConceptService().getDrugByNameOrId(drugNameConfirmed));
        order.setConcept(Context.getConceptService().getConceptByName(drugNameConfirmed));
        CareSetting careSetting = Context.getOrderService().getCareSettingByName("Outpatient");
        order.setCareSetting(careSetting);

        if (!(drugFrequency.equals(""))) {
            OrderFrequency orderFrequency = Context.getOrderService().getOrderFrequencyByConcept(Context.getConceptService().getConceptByName(drugFrequency));
            if (orderFrequency == null) {
                order.setFrequency(setOrderFrequency(drugFrequency));
            } else {
                order.setFrequency(orderFrequency);
            }
        }

        Date start = defaultStartDate(),
                end = defaultEndDate(start);
        List<Encounter> encs = Context.getEncounterService().getEncounters(null, null, start, end, null, null, null, false);

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
        order.setNumRefills(0);
        order = (DrugOrder) Context.getOrderService().saveOrder(order, null);
        orderID = order.getOrderId();
        return orderID; 
    }

    private OrderFrequency setOrderFrequency(String Frequency) {

        OrderFrequency orderFrequency = new OrderFrequency();
        orderFrequency.setFrequencyPerDay(0.0);
        orderFrequency.setConcept(Context.getConceptService().getConceptByName(Frequency));
        orderFrequency = (OrderFrequency) Context.getOrderService().saveOrderFrequency(orderFrequency);
        return orderFrequency;

    }
    
    private void createDrugOrderExtension(drugorders drugorder, int drugOrderID, String patientID, String drugName, Date startDate, String allergicOrderReason, String diagnosis, String patientInstructions, String pharmacistInstructions){
        drugorder = new drugorders();
        drugorder.setOrderId(drugOrderID);
        drugorder.setDrugname(Context.getConceptService().getConceptByName(drugName));
        drugorder.setStartdate(startDate);
        drugorder.setPatientid(patientID);
        drugorder.setOrderstatus("New");
        drugorder.setUuid(UUID.randomUUID().toString());
        
        if(!(diagnosis).equals(""))
            drugorder.setAssociateddiagnosis(Context.getConceptService().getConceptByName(diagnosis));
        if(!(allergicOrderReason).equals(""))
            drugorder.setIsallergicorderreasons(allergicOrderReason);
        if(!(patientInstructions).equals(""))
            drugorder.setPatientinstructions(patientInstructions);
        if(!(pharmacistInstructions).equals(""))
            drugorder.setPharmacistinstructions(pharmacistInstructions);

        Context.getService(drugordersService.class).saveDrugOrder(drugorder);
    }
    
    private void createDiseasePlan(int drugOrderID, String patientID, String diseaseName){
        
        drugordersdiseases diseaseDrugOrder = new drugordersdiseases();
        diseaseDrugOrder.setUuid(UUID.randomUUID().toString());
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
