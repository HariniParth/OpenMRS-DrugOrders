/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global diagnosis */

$(document).ready( function() {
    jq("#existingPlansLinkHide").hide();
    jq("#showDiscontinueOrderView").hide();
    jq(".planItemDetails").hide();
});

function showMedicationPlanOrderWindow(){
    jq("#medicationPlanWindow").show();
    document.getElementById("medicationPlanWindow").style.display = 'block';
}

function hideMedicationPlanOrderWindow(){
    jq("#medicationPlanWindow").hide();
}

function showIndividualOrderDetailsWindow(orderType){
    $("#orderType").text(orderType);
    $("#orderAction").val(orderType);
    jq("#confirmOrderView").hide();
    jq("#singleOrderDetailsWindow").show();
    document.getElementById("singleOrderDetailsWindow").style.display = 'block';
}

function hideIndividualOrderDetailsWindow(){
    jq("#singleOrderDetailsWindow").hide();
    jq("#allergicDrugOrderReasonField").hide();
    $("#drugNameEntered").val("");
    $("#allergicOrderReason").val("");
    $("#drugRoute").val("");
    $("#drugDose").val("");
    $("#drugDoseUnits").val("");
    $("#drugQuantity").val("");
    $("#quantityUnits").val("");
    $("#drugDuration").val("");
    $("#durationUnits").val("");
    $("#drugFrequency").val("");
    $("#associatedDiagnosis").val("");
    $("#patientInstructions").val("");
    $("#pharmacistInstructions").val("");
}

function showDrugOrderViewWindow(givenName,lastName,startdate,drugname,dose,doseUnits,route,duration,durationUnits,quantity,quantityUnits,frequency,patientinstructions,pharmacistinstructions){
    jq("#showDiscontinueOrderView").hide();
    jq("#view_window_close_btn").show();
    $("#patient_name").text(givenName+" "+lastName);
    $("#start_date").text(startdate);
    $("#order_details").text(drugname +" "+dose+" "+doseUnits+" "+route+" "+duration+" "+durationUnits+" "+quantity+" "+quantityUnits+" "+frequency);
    $("#patient_instructions").text(patientinstructions);
    $("#pharmacist_instructions").text(pharmacistinstructions);
    jq("#showDrugOrderView").show();
    document.getElementById("showDrugOrderView").style.display = 'block';
}

function hideDrugOrderViewWindow(){
    jq("#showDrugOrderView").hide();
}

function showEditIndividualDrugOrderWindow(orderType,orderId,drugName,startDate,dose,doseUnits,route,duration,durationUnits,quantity,quantityUnits,frequency,associateddiagnosis,patientinstructions,pharmacistinstructions){
    $("#orderType").text(orderType);
    $("#orderAction").val(orderType);
    $("#order_id").val(orderId);
    $("#drugNameEntered").val(drugName);
    $("#drugRoute").val(route);
    $("#drugDose").val(dose);
    $("#drugDoseUnits").val(doseUnits);
    $("#drugQuantity").val(quantity);
    $("#quantityUnits").val(quantityUnits);
    $("#drugDuration").val(duration);
    $("#durationUnits").val(durationUnits);
    $("#drugFrequency").val(frequency);
    $("#associatedDiagnosis").val(associateddiagnosis);
    $("#patientInstructions").val(patientinstructions);
    $("#pharmacistInstructions").val(pharmacistinstructions);
    jq("#singleOrderDetailsWindow").show();
    document.getElementById("singleOrderDetailsWindow").style.display = 'block';
}

function showRenewIndividualDrugOrderWindow(orderType,orderId,drugName,dose,doseUnits,route,duration,durationUnits,quantity,quantityUnits,frequency,associateddiagnosis,patientinstructions,pharmacistinstructions){
    $("#orderType").text(orderType);
    $("#orderAction").val(orderType);
    $("#order_id").val(orderId);
    $("#drugNameEntered").val(drugName);
    $("#drugRoute").val(route);
    $("#drugDose").val(dose);
    $("#drugDoseUnits").val(doseUnits);
    $("#drugQuantity").val(quantity);
    $("#quantityUnits").val(quantityUnits);
    $("#drugDuration").val(duration);
    $("#durationUnits").val(durationUnits);
    $("#drugFrequency").val(frequency);
    $("#associatedDiagnosis").val(associateddiagnosis);
    $("#patientInstructions").val(patientinstructions);
    $("#pharmacistInstructions").val(pharmacistinstructions);
    jq("#singleOrderDetailsWindow").show();
    document.getElementById("singleOrderDetailsWindow").style.display = 'block';
}

function hideEditOrderWindow(){
    jq("#editOrderWindow").hide();
}

function hideRenewOrderWindow(){
    jq("#renewOrderWindow").hide();
}

function showDiscontinueIndividualDrugOrderWindow(orderid,givenName,lastName,startdate,drugname,dose,doseUnits,route,duration,durationUnits,quantity,quantityUnits,frequency,patientinstructions,pharmacistinstructions){
    jq("#view_window_close_btn").hide();
    $("#dis_order_id").val(orderid);
    $("#patient_name").text(givenName+" "+lastName);
    $("#start_date").text(startdate);
    $("#order_details").text(drugname +" "+dose+" "+doseUnits+" "+route+" "+duration+" "+durationUnits+" "+quantity+" "+quantityUnits+" "+frequency);
    $("#patient_instructions").text(patientinstructions);
    $("#pharmacist_instructions").text(pharmacistinstructions);
    jq("#showDiscontinueOrderView").show();
    jq("#showDrugOrderView").show();
}

function showDiscontinuedFulfilledOrders(){
    jq("#nonActiveOrdersWindow").show();
    document.getElementById("nonActiveOrdersWindow").style.display = 'block';
    jq("#nonActiveOrdersLinkView").hide();
    document.getElementById("nonActiveOrdersLinkHide").style.display = 'block';
    jq("#nonActiveOrdersLinkHide").show();
}
   
function hideDiscontinuedFulfilledOrders(){
    jq("#nonActiveOrdersWindow").hide();
    jq("#nonActiveOrdersLinkHide").hide();
    jq("#nonActiveOrdersLinkView").show();
}

function autoCompleteDiagnosis(diagnosis){
    var list = diagnosis.replace("[","").replace("]","").split(',');
    console.log(list);
    $("#associatedDiagnosis").autocomplete({
       source : list
    });
}

function autoCompleteDrug(drug, allergies){
    var list = drug.replace("[","").replace("]","").split(',');
    console.log(list);
    $("#drugNameEntered").autocomplete({
       source : list,
       select : function( event , ui ) {
            var allergyList = allergies.split(",");
            var isAllergic = false;
            $.each(allergyList,function(index,value){
                var drugname = value.replace("[","").replace("]","").replace(" ","");
                var selectedDrug = (ui.item.label).replace(" ","");
                if(selectedDrug === drugname){
                    isAllergic = true;
                } 
            });
            if(isAllergic){
                jq("#allergicDrugOrderReasonField").show();
                document.getElementById("allergicDrugOrderReasonField").style.display = 'block';
            } else {
                jq("#allergicDrugOrderReasonField").hide();
            }
        }
    });
}

function autoCompleteDisease(disease){
    var list = disease.replace("[","").replace("]","").split(',');
    console.log(list);
    $("#diseaseName").autocomplete({
       source : list,
       select : function( event , ui ) {
           $("#diseaseName").val(ui.item.label);
           $("#diseaseForm").submit();
       }
    });
}

function autoCompletePlanItem(drugs){
    var list = drugs.replace("[","").replace("]","").split(',');
    console.log(list);
    $("#drug_name").autocomplete({
       source : list
    });
}

function editDraftOrder(editDraftOrderID,drugname,startdate,dose,doseUnits,route,duration,durationUnits,quantity,quantityUnits,frequency,diagnosis,patientinstructions,pharmacistinstructions){
    jq("#confirmOrderView").hide();
    $("#orderID").val(editDraftOrderID);
    $("#drugNameEntered").val(drugname);
    $("#allergicOrderReason").val("");
    $("#drugRoute").val(route);
    $("#drugDose").val(dose);
    $("#drugDoseUnits").val(doseUnits);
    $("#drugQuantity").val(quantity);
    $("#quantityUnits").val(quantityUnits);
    $("#drugDuration").val(duration);
    $("#durationUnits").val(durationUnits);
    $("#drugFrequency").val(frequency);
    $("#associatedDiagnosis").val(diagnosis);
    $("#patientInstructions").val(patientinstructions);
    $("#pharmacistInstructions").val(pharmacistinstructions);
    jq("#singleOrderDetailsWindow").show();
    document.getElementById("singleOrderDetailsWindow").style.display = 'block';
}

function deleteDraftOrder(deleteDraftOrderID){
    alert(deleteDraftOrderID);
}

function displayPlanCreationWindow(){
    jq("#confirmNewPlanWindow").hide();
    jq("#createNewPlanWindow").show();
    document.getElementById("createNewPlanWindow").style.display = 'block';
}

function addPlanItemWindow(diseaseName){
    jq("#confirmNewPlanWindow").hide();
    jq("#createNewPlanWindow").show();
    document.getElementById("createNewPlanWindow").style.display = 'block';
    $("#diseaseName").val(diseaseName);
}

function hideMedPlanCreateWindow(){
    jq("#createNewPlanWindow").hide();
    $("#diseaseName").val("");
    $("#planId").val("");
    $("#drug_name").val("");
    $("#drugRoute").val("");
    $("#drugDose").val("");
    $("#drugDoseUnits").val("");
    $("#drugQuantity").val("");
    $("#quantityUnits").val("");
    $("#drugDuration").val("");
    $("#durationUnits").val("");
    $("#drugFrequency").val("");
}

function editPlanItemDetails(planid,diseaseName,drugName,dose,doseunits,route,quantity,quantityunits,duration,durationunits,frequency){
    jq("#confirmNewPlanWindow").hide();
    jq("#createNewPlanWindow").show();
    document.getElementById("createNewPlanWindow").style.display = 'block';
    $("#planId").val(planid);
    $("#diseaseName").val(diseaseName);
    $("#drug_name").val(drugName);
    $("#drugDose").val(dose);
    $("#drugDoseUnits").val(doseunits);
    $("#drugRoute").val(route);
    $("#drugQuantity").val(quantity);
    $("#quantityUnits").val(quantityunits);
    $("#drugDuration").val(duration);
    $("#durationUnits").val(durationunits);
    $("#drugFrequency").val(frequency);
}

function deleteMedPlan(diseaseName){
    jq("#deleteMedPlanWindow").show();
    document.getElementById("deleteMedPlanWindow").style.display = 'block';
    $("#disease_name").text(diseaseName);
}

function deleteMedPlanItem(planid,diseaseName,drugName,dose,doseunits,route,quantity,quantityunits,duration,durationunits,frequency){
    jq("#confirmNewPlanWindow").hide();
    jq("#deleteMedPlanItemWindow").show();
    document.getElementById("deleteMedPlanItemWindow").style.display = 'block';
    $("#medPlan_id").val(planid);
    $("#disease_value").text(diseaseName);
    $("#drug_value").text(drugName);
    $("#dose_value").text(dose);
    $("#dose_units_value").text(doseunits);
    $("#route_value").text(route);
    $("#quantity_value").text(quantity);
    $("#quantity_units_value").text(quantityunits);
    $("#duration_value").text(duration);
    $("#duration_units_value").text(durationunits);
    $("#frequency_value").text(frequency);
}

function hideMedPlanDeleteWindow(){
    jq("#deleteMedPlanWindow").hide();
}

function hideMedPlanItemDeleteWindow(){
    jq("#deleteMedPlanItemWindow").hide();
}

function viewMedPlanWindow(drugname,dose,doseunits,route,quantity,quantityunits,duration,durationunits,frequency){
    jq("#viewPlanWindow").show();
    document.getElementById("viewPlanWindow").style.display = 'block';
    $("#plan_drug").text(drugname);
    $("#plan_dose").text(dose);
    $("#plan_dose_units").text(doseunits);
    $("#plan_route").text(route);
    $("#plan_quantity").text(quantity);
    $("#plan_quantity_units").text(quantityunits);
    $("#plan_duration").text(duration);
    $("#plan_duration_units").text(durationunits);
    $("#plan_frequency").text(frequency);
}

function hideMedPlanWindow(){
    jq("#viewPlanWindow").hide();
}