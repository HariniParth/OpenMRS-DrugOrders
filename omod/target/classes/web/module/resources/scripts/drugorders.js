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

function showIndividualOrderDetailsWindow(){
    jq("#singleOrderWindow").hide();
    jq("#singleOrderDetailsWindow").show();
}

function hideIndividualOrderDetailsWindow(){
    jq("#singleOrderDetailsWindow").hide();
}