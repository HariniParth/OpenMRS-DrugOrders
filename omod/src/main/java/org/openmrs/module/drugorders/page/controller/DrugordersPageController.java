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

import com.mysql.jdbc.Constants;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.util.ArrayList;
import java.util.Calendar;
import static java.util.Collections.list;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.openmrs.CareSetting;
import org.openmrs.Concept;
import org.openmrs.ConceptName;
import org.openmrs.Drug;
import org.openmrs.DrugOrder;
import org.openmrs.Encounter;
import org.openmrs.EncounterRole;
import org.openmrs.Order;
import org.openmrs.OrderFrequency;
import org.openmrs.OrderType;
import org.openmrs.Patient;
import org.openmrs.Provider;
import org.openmrs.SimpleDosingInstructions;
import org.openmrs.TestOrder;
import org.openmrs.api.OrderContext;
import org.openmrs.api.OrderService;
import org.openmrs.api.context.Context;
import org.openmrs.module.allergyapi.api.PatientService;
import org.openmrs.module.drugorders.api.drugordersService;
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

public class DrugordersPageController {
    
    public static final String TWICE_A_DAY_FREQUENCY = "Twice a day";
    DrugOrder order = new DrugOrder();
    
    public void controller(PageModel model, @RequestParam("patientId") Patient patient, 
                            @RequestParam(value = "drugNameEntered", required = false) String drugNameEntered,
                            @RequestParam(value = "startDateConfirmed", required = false) Date startDateConfirmed,
                            UiUtils ui, @RequestParam(value = "allergicOrderReason", required = false) String allergicOrderReason,
 	                    @RequestParam(value = "associatedDiagnosis", required = false) String associatedDiagnosis,
                            @RequestParam(value = "drugRoute", required = false) String drugRoute,
                            @RequestParam(value = "drugDose", required = false) String drugDose,
                            @RequestParam(value = "drugDoseUnits", required = false) String drugDoseUnits,
                            @RequestParam(value = "drugQuantity", required = false) String drugQuantity,
                            @RequestParam(value = "quantityUnits", required = false) String quantityUnits,
                            @RequestParam(value = "drugFrequency", required = false) String drugFrequency,
                            @RequestParam(value = "drugDuration", required = false) Integer drugDuration,
                            @RequestParam(value = "durationUnits", required = false) String durationUnits,
                            @RequestParam(value = "patientInstructions", required = false) String patientInstructions,
                            @RequestParam(value = "pharmacistInstructions", required = false) String pharmacistInstructions,
                            @SpringBean("allergyService") PatientService patientService) {
 		
        

 		model.addAttribute("patient", patient);
 		model.addAttribute("allergies", patientService.getAllergies(patient));
                
                List<drugorders> dorders = new ArrayList<drugorders>();
                List<OrderAndDrugOrder> drugOrders = getDrugOrdersByPatient(patient);
                
                for(OrderAndDrugOrder drugOrder : drugOrders){
                    drugorders dorder = drugOrder.getdrugorders();
                    dorders.add(dorder);
                }
                
                model.addAttribute("existingDrugOrders", dorders);
                
                if(!(drugNameEntered.equals(""))) {
                    
                    createNewDrugOrder(patient, drugNameEntered, drugRoute, drugDose, drugDoseUnits, drugQuantity, quantityUnits, drugDuration, durationUnits);
                    drugorders drugorders = new drugorders();
                    drugorders.setDrugname(drugNameEntered);
                    drugorders.setStartdate(startDateConfirmed);
                    drugorders.setOrderId(order.getOrderId());
                    
                    if(!(drugRoute.equals(""))){
                        int routeConcept = Context.getConceptService().getConceptByName(drugRoute).getConceptId();
                        drugorders.setRoute(routeConcept);
                    }
                    
                    if(drugDose != null){
                        drugorders.setDose(drugDose);
                        int doseConcept = Context.getConceptService().getConceptByName(drugDoseUnits).getConceptId();
                        drugorders.setDoseunits(doseConcept);
                    }                    
                    
                    if(drugQuantity != null){
                        drugorders.setQuantity(drugQuantity);
                        int quantityConcept = Context.getConceptService().getConceptByName(quantityUnits).getConceptId();
                        drugorders.setQuantityunits(quantityConcept);
                    }
                    
                    if(drugDuration != null){
                        drugorders.setDuration(drugDuration);
                        int durationConcept = Context.getConceptService().getConceptByName(durationUnits).getConceptId();
                        drugorders.setDurationunits(durationConcept);
                    }
                    
                    if(!(drugFrequency.equals(""))){
                        int frequencyConcept = Context.getConceptService().getConceptByName(drugFrequency).getConceptId();
                        drugorders.setFrequency(frequencyConcept);
                    }
                    
                    if(!(associatedDiagnosis.equals("")))
                        drugorders.setAssociateddiagnosis(associatedDiagnosis);
                    if(!(patientInstructions.equals("")))
                        drugorders.setPatientinstructions(patientInstructions);
                    if(!(pharmacistInstructions.equals("")))
                        drugorders.setPharmacistinstructions(pharmacistInstructions);
                    
                    drugorders.setPatientid(Integer.toString(patient.getPatientId()));

                    Context.getService(drugordersService.class).saveNewTable(drugorders);
                }   
                                
 	}
    
    public List<OrderAndDrugOrder> getDrugOrdersByPatient(Patient p) {
        ArrayList<OrderAndDrugOrder> drugOrders = new ArrayList<OrderAndDrugOrder>();

        List<Order> orders = Context.getOrderService().getAllOrdersByPatient(p);
        int drugOrderTypeId = Context.getOrderService().getOrderTypeByName("Drug Order").getOrderTypeId();
        drugorders drugOrder;
        for (Order order : orders) {
            //if (order.getOrderType().getOrderTypeId() == 3) { OrderType ot = new OrderType();
            if (order.getOrderType().getOrderTypeId() == drugOrderTypeId) {
                drugOrder = Context.getService(drugordersService.class).getNewTable(order.getOrderId());
                drugOrders.add(new OrderAndDrugOrder(order, drugOrder));
            }
        }
        return drugOrders;
    }
    
    private Concept concept(String name) {
                    Concept doseUnitsConcept = new Concept();
                    doseUnitsConcept.setFullySpecifiedName(new ConceptName(name, Locale.ENGLISH));
                    return doseUnitsConcept;
                }
    
    private void createNewDrugOrder(Patient patient, String drugNameEntered, String drugRoute, 
                 String drugDose, String drugDoseUnits, String drugQuantity, String quantityUnits,
                 Integer drugDuration, String durationUnits){

                order.setDrug(Context.getConceptService().getDrugByNameOrId(drugNameEntered));
                order.setConcept(Context.getConceptService().getConceptByName(drugNameEntered));
                CareSetting careSetting = Context.getOrderService().getCareSettingByName("Outpatient");
                order.setCareSetting(careSetting);
                
                OrderFrequency orderFrequency = new OrderFrequency();
                orderFrequency.setFrequencyPerDay(2.0);
                orderFrequency.setConcept(Context.getConceptService().getConceptByName("Twice Daily"));
                orderFrequency = (OrderFrequency) Context.getOrderService().saveOrderFrequency(orderFrequency);
                
                order.setFrequency(orderFrequency);   
                
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
