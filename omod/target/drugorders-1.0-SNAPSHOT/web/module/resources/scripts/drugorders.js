/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready( function() {
    jq("#singleOrderWindow").hide();
    jq("#showDrugOrderView").hide();
    jq("#showDiscontinueOrderView").hide();
});

function showIndividualDrugOrderWindow(){
    jq("#singleOrderWindow").show();
}

function hideIndividualDrugOrderWindow(){
    jq("#singleOrderWindow").hide();
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
    $("#drugNameEntered").val("");
}

function showDrugOrderViewWindow(orderId,patientid,givenName,lastName,startdate,drugname,patientinstructions,pharmacistinstructions){
    jq("#showDrugOrderView").show();
    $("#order_id").text(orderId);
    $("#patient_id").text(patientid);
    $("#patient_name").text(givenName+" "+lastName);
    $("#start_date").text(startdate);
    $("#order_details").text(drugname);
    $("#patient_instructions").text(patientinstructions);
    $("#pharmacist_instructions").text(pharmacistinstructions);
}

function hideDrugOrderViewWindow(){
    jq("#showDrugOrderView").hide();
}

function showDiscontinueIndividualDrugOrderWindow(orderId){
    jq("#showDiscontinueOrderView").show();
    $("#dis_order_id").text(orderId);
}

function hideDiscontinueOrderWindow(){
    jq("#showDiscontinueOrderView").hide();
}