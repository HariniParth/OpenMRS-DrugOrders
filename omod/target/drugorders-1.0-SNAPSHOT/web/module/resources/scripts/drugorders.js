/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready( function() {
    jq("#singleOrderWindow").hide();
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

function showDrugOrderViewWindow(orderId,patientid,startdate,drugname,patientinstructions,pharmacistinstructions){
    jq("#drugOrderView").show();
    $("#order_id").val(orderId);
    $("#patient_id").val(patientid);
    $("#start_date").val(startdate);
    $("#order_details").val(drugname);
    $("#patient_instructions").val(patientinstructions);
    $("#pharmacist_instructions").val(pharmacistinstructions);
}

function hideDrugOrderViewWindow(){
    jq("#drugOrderView").hide();
}