/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global diagnosis */

$(document).ready( function() {
    jq("#existingPlansLinkHide").hide();
    jq("#showDiscontinueOrderView").hide();
    jq("#planItemDetails").hide();
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
    var list = diagnosis.split(',');
    console.log(list);
    $("#associatedDiagnosis").autocomplete({
       source : list
    });
}

function autoCompleteDrug(drug, allergies){
    var list = drug.split(',');
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
    var list = disease.split(',');
    console.log(list);
    $("#disease_name").autocomplete({
       source : list
    });
}

function autoCompletePlanItem(drugs){
    var list = drugs.split(',');
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
    jq("#createNewPlanWindow").show();
    document.getElementById("createNewPlanWindow").style.display = 'block';
}

function hideMedPlanCreateWindow(){
    jq("#createNewPlanWindow").hide();
}

function showExistingMedicationPlans(){
    jq("#existingPlansLinkView").hide();
    jq("#existingPlansLinkHide").show();
}
   
function hideExistingMedicationPlans(){
    jq("#existingPlansLinkHide").hide();
    jq("#existingPlansLinkView").show();
}

function displayPlanItemDetails(){
    jq("#planItemDetails").toggle();
}