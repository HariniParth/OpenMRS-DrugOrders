/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready( function() {
    jq("#nonActiveOrdersLinkHide").hide();
    jq("#nonActiveOrdersWindow").hide();
    jq("#showDiscontinueOrderView").hide();
});

function showIndividualDrugOrderWindow(){
    jq("#medicationPlanWindow").hide();
    jq("#singleOrderWindow").show();
    document.getElementById("singleOrderWindow").style.display = 'block';
}

function hideIndividualDrugOrderWindow(){
    jq("#singleOrderWindow").hide();
}

function showMedicationPlanOrderWindow(){
    jq("#singleOrderWindow").hide();
    jq("#medicationPlanWindow").show();
    document.getElementById("medicationPlanWindow").style.display = 'block';
}

function hideMedicationPlanOrderWindow(){
    jq("#medicationPlanWindow").hide();
}

function showAllergicDrugOrderDetailsWindow(){
    jq("#allergicOrderWindow").hide();
}

function hideAllergicDrugOrderWindow(){
    jq("#allergicOrderWindow").hide();
    jq("#singleOrderWindow").show();
}

function showIndividualOrderDetailsWindow(){
    jq("#singleOrderWindow").hide();
    jq("#allergicOrderWindow").hide();
}

function hideIndividualOrderDetailsWindow(){
    jq("#singleOrderDetailsWindow").hide();
}

function showConfirmOrderWindow(){
    jq("#singleOrderDetailsWindow").hide();
}

function hideConfirmOrderWindow(){
    jq("#confirmOrderView").hide();
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

function showEditIndividualDrugOrderWindow(orderId,drugName,startDate,dose,doseUnits,route,duration,durationUnits,quantity,quantityUnits,frequency,patientinstructions,pharmacistinstructions){
    $("#edit_order_id").val(orderId);
    $("#drug_name").text(drugName);
    $("#SelectedOrderDate").text(startDate);
    $("#SelectedDrugRoute").text(route);
    $("#editDrugDose").val(dose);
    $("#SelectedDrugDoseUnits").text(doseUnits);
    $("#editDrugQuantity").val(quantity);
    $("#SelectedDrugQuantityUnits").text(quantityUnits);
    $("#editDrugDuration").val(duration);
    $("#SelectedDrugDurationUnits").text(durationUnits);
    $("#SelectedDrugFrequency").text(frequency);
    $("#editPatientInstructions").val(patientinstructions);
    $("#editPharmacistInstructions").val(pharmacistinstructions);
    jq("#editOrderWindow").show();
    document.getElementById("editOrderWindow").style.display = 'block';
}

function showRenewIndividualDrugOrderWindow(orderId,drugName,dose,doseUnits,route,duration,durationUnits,quantity,quantityUnits,frequency,associateddiagnosis,patientinstructions,pharmacistinstructions){
    $("#renew_order_id").val(orderId);
    $("#renew_drug_name").text(drugName);
    $("#renew_DrugRoute").text(route);
    $("#renewDrugDose").val(dose);
    $("#renew_DrugDoseUnits").text(doseUnits);
    $("#renewDrugQuantity").val(quantity);
    $("#renew_DrugQuantityUnits").text(quantityUnits);
    $("#renewDrugDuration").val(duration);
    $("#renew_DrugDurationUnits").text(durationUnits);
    $("#renew_DrugFrequency").text(frequency);
    $("#renewDiagnosis").val(associateddiagnosis);
    $("#renewPatientInstructions").val(patientinstructions);
    $("#renewPharmacistInstructions").val(pharmacistinstructions);
    jq("#renewOrderWindow").show();
    document.getElementById("renewOrderWindow").style.display = 'block';
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
    jq("#nonActiveOrdersLinkView").hide();
    jq("#nonActiveOrdersLinkHide").show();
}
   
function hideDiscontinuedFulfilledOrders(){
    jq("#nonActiveOrdersWindow").hide();
    jq("#nonActiveOrdersLinkHide").hide();
    jq("#nonActiveOrdersLinkView").show();
}
    