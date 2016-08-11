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
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

public class DrugordersPageController {

    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient, @RequestParam(value = "drugNameEntered", required = false) String drugNameSelected,
            @RequestParam(value = "startDateEntered", required = false) Date startDateEntered,
            @RequestParam(value = "allergicOrderReason", required = false) String allergicOrderReason,
            @RequestParam(value = "associatedDiagnosis", required = false) String selectedDiagnosis,
            @RequestParam(value = "drugRoute", required = false) String drugRoute, @RequestParam(value = "drugFrequency", required = false) String drugFrequency,
            @RequestParam(value = "drugDose", required = false) String drugDose, @RequestParam(value = "drugDoseUnits", required = false) String drugDoseUnits,
            @RequestParam(value = "drugQuantity", required = false) String drugQuantity, @RequestParam(value = "quantityUnits", required = false) String quantityUnits,
            @RequestParam(value = "drugDuration", required = false) Integer drugDuration, @RequestParam(value = "durationUnits", required = false) String durationUnits,
            @RequestParam(value = "patientInstructions", required = false) String patientInstructions, @RequestParam(value = "pharmacistInstructions", required = false) String pharmacistInstructions,
            @RequestParam(value = "orderID", required = false) String orderID, @SpringBean("allergyService") PatientService patientService,
            @RequestParam(value = "action", required = false) String action,
            @RequestParam(value = "dis_order_id", required = false) Integer dis_order_id, @RequestParam(value = "edit_order_id", required = false) Integer edit_order_id,
            @RequestParam(value = "startDateNew", required = false) Date startDateNew,
            @RequestParam(value = "editDrugRoute", required = false) String editDrugRoute, @RequestParam(value = "editDrugFrequency", required = false) String editDrugFrequency,
            @RequestParam(value = "editDrugDose", required = false) String editDrugDose, @RequestParam(value = "editDrugDoseUnits", required = false) String editDrugDoseUnits,
            @RequestParam(value = "editDrugQuantity", required = false) String editDrugQuantity, @RequestParam(value = "editQuantityUnits", required = false) String editQuantityUnits,
            @RequestParam(value = "editDrugDuration", required = false) Integer editDrugDuration, @RequestParam(value = "editDurationUnits", required = false) String editDurationUnits,
            @RequestParam(value = "editPatientInstructions", required = false) String editPatientInstructions, @RequestParam(value = "editPharmacistInstructions", required = false) String editPharmacistInstructions,
            @RequestParam(value = "renew_order_id", required = false) Integer renew_order_id,
            @RequestParam(value = "startDateRenew", required = false) Date startDateRenew, @RequestParam(value = "renewDiagnosis", required = false) String renewDiagnosis,
            @RequestParam(value = "renewDrugRoute", required = false) String renewDrugRoute, @RequestParam(value = "renewDrugFrequency", required = false) String renewDrugFrequency,
            @RequestParam(value = "renewDrugDose", required = false) String renewDrugDose, @RequestParam(value = "renewDrugDoseUnits", required = false) String renewDrugDoseUnits,
            @RequestParam(value = "renewDrugQuantity", required = false) String renewDrugQuantity, @RequestParam(value = "renewQuantityUnits", required = false) String renewQuantityUnits,
            @RequestParam(value = "renewDrugDuration", required = false) Integer renewDrugDuration, @RequestParam(value = "renewDurationUnits", required = false) String renewDurationUnits,
            @RequestParam(value = "renewPatientInstructions", required = false) String renewPatientInstructions, @RequestParam(value = "renewPharmacistInstructions", required = false) String renewPharmacistInstructions) {

        String patientID = Integer.toString(patient.getPatientId());
        String drugNameEntered = drugNameSelected.replace(" ", "");
        String associatedDiagnosis = selectedDiagnosis.replace(" ", "");
        model.addAttribute("allergies", patientService.getAllergies(patient));

        if (StringUtils.isNotBlank(action)) {
            try {
                if ("addOrderDraft".equals(action)) {

                    if (!(drugNameEntered.equals("")) && !(drugRoute.equals("")) && !(drugDose.equals("")) && !(drugDoseUnits.equals("")) && !(drugQuantity.equals("")) && !(quantityUnits.equals("")) && !(drugFrequency.equals("")) && (drugDuration != null) && !(durationUnits.equals(""))) {
                        DrugOrder drugOrder = null;
                        drugorders drugorder = null;
                        int order = createNewDrugOrder(drugOrder, patient, drugNameEntered, drugRoute, drugDose, drugDoseUnits, drugQuantity, quantityUnits, drugFrequency, drugDuration, durationUnits);
                        createDrugOrderExtension(drugorder, order, patientID, drugNameEntered, startDateEntered, allergicOrderReason, associatedDiagnosis, patientInstructions, pharmacistInstructions);
                    }
                }

                if ("discontinueDrugOrder".equals(action)) {
                    drugorders drugorderToDiscontinue = Context.getService(drugordersService.class).getNewTable(dis_order_id);
                    drugorderToDiscontinue.setOrderstatus("Discontinued");
                    Context.getOrderService().voidOrder(Context.getOrderService().getOrder(dis_order_id), "Discontinued");
                }

                if ("editDrugOrder".equals(action)) {
                    drugorders originalOrderExtension = Context.getService(drugordersService.class).getNewTable(edit_order_id);
                    String drugName = originalOrderExtension.getDrugname();
                    Date startDate = originalOrderExtension.getStartdate();
                    String diagnosis = originalOrderExtension.getAssociateddiagnosis();

                    Context.getService(drugordersService.class).deleteNewTable(Context.getService(drugordersService.class).getNewTable(edit_order_id));
                    Context.getOrderService().purgeOrder(Context.getOrderService().getOrder(edit_order_id), true);

                    DrugOrder drugOrder = null;
                    drugorders drugorder = null;

                    int order = createNewDrugOrder(drugOrder, patient, drugName, editDrugRoute, editDrugDose, editDrugDoseUnits, editDrugQuantity, editQuantityUnits, editDrugFrequency, editDrugDuration, editDurationUnits);
                    Date editedStartDate;
                    if (startDateNew != null) {
                        editedStartDate = startDateNew;
                    } else {
                        editedStartDate = startDate;
                    }
                    
                    createDrugOrderExtension(drugorder, order, patientID, drugName, editedStartDate, allergicOrderReason, diagnosis, editPatientInstructions, editPharmacistInstructions);
                
                }

                if ("renewDrugOrder".equals(action)) {
                    drugorders originalOrderExtension = Context.getService(drugordersService.class).getNewTable(renew_order_id);
                    String drugName = originalOrderExtension.getDrugname();

                    DrugOrder drugOrder = null;
                    drugorders drugorder = null;
                    int order = createNewDrugOrder(drugOrder, patient, drugName, renewDrugRoute, renewDrugDose, renewDrugDoseUnits, renewDrugQuantity, renewQuantityUnits, renewDrugFrequency, renewDrugDuration, renewDurationUnits);
                    createDrugOrderExtension(drugorder, order, patientID, drugName, startDateRenew, allergicOrderReason, renewDiagnosis, renewPatientInstructions, renewPharmacistInstructions);
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
        drugorder.setDrugname(drugName);
        drugorder.setStartdate(startDate);
        drugorder.setPatientid(patientID);
        drugorder.setOrderstatus("Active");
        if(!(diagnosis).equals(""))
            drugorder.setAssociateddiagnosis(diagnosis);
        if(!(allergicOrderReason).equals(""))
            drugorder.setIsallergicorderreasons(allergicOrderReason);
        if(!(patientInstructions).equals(""))
            drugorder.setPatientinstructions(patientInstructions);
        if(!(pharmacistInstructions).equals(""))
            drugorder.setPharmacistinstructions(pharmacistInstructions);
        
        Context.getService(drugordersService.class).saveNewTable(drugorder);
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
