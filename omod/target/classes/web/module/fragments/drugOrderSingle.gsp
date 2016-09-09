<%
    ui.includeCss("drugorders", "drugorders.css")
    def orderList = "";
%>

<% existingDrugOrdersExtension.each { existingDrugOrderExtension -> %>
    <% existingDrugOrdersMain.each { existingDrugOrderMain -> %>
        <% if((existingDrugOrderMain.orderId == existingDrugOrderExtension.orderId) && ((existingDrugOrderExtension.orderstatus).equals("Active"))) { %>
            <span id="entries">
                <a href="#" id="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')">
                    ${ existingDrugOrderExtension.drugname.getDisplayString() } ${ existingDrugOrderExtension.startdate }    
                </a>    
            </span>

            <span id="button">
                <i class="icon-pencil edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','${ existingDrugOrderMain.orderId }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
                <i class="icon-remove delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ existingDrugOrderMain.orderId }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
            </span>
            
            <br/><br/>
        <% } %>
    <% } %>
<% } %>

<% existingDrugOrderGroups.each { existingDrugOrder -> %>
    <div id="groupOrderList">
        <% existingDrugOrder.value.each { existingOrder -> %>
            <% existingDrugOrdersMain.each { existingDrugOrderMain -> %>
                <% if(existingDrugOrderMain.orderId == existingOrder.orderId) { %>
                    <span id="entries">
                        <a href="#" id="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingOrder.startdate }','${ existingOrder.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }')">
                            ${ existingOrder.drugname.getDisplayString() } ${ existingOrder.startdate }    
                        </a>
                        <% orderList = orderList + existingOrder.drugname.getDisplayString() + "," %>
                    </span><br/><br/>
                <% } %>
            <% } %>
        <% } %>
    </div>
    <span id="button">
        <i class="icon-pencil edit-action" title="${ ui.message("Edit") }" onclick="showEditGroupOrderWindow()"></i>
        <i class="icon-remove delete-action" title="${ ui.message("Discard") }" onclick="showDiscardGroupOrderWindow('${existingDrugOrder.key}','${orderList}')"></i>
    </span><br/><br/>
<% } %>

<br/><br/><br/>

<div id="nonActiveOrdersWindow">
    <% existingDrugOrdersExtension.each { existingDrugOrderExtension -> %>
        <% existingDrugOrdersMain.each { existingDrugOrderMain -> %>
            <% if((existingDrugOrderMain.orderId == existingDrugOrderExtension.orderId) && (!((existingDrugOrderExtension.orderstatus).equals("Active")))) { %>
                    <span id="entries">
                        <a href="#" id="existingDrugOrdersID" onclick="showDrugOrderViewWindow('${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')">
                            ${ existingDrugOrderExtension.drugname.getDisplayString() } ${ existingDrugOrderExtension.startdate } 
                        </a>    
                    </span>

                    <span id="button">
                        <i class="icon-pencil edit-action" title="${ ui.message("Renew") }" onclick="showRenewIndividualDrugOrderWindow('RENEW DRUG ORDER','${ existingDrugOrderMain.orderId }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
                    </span>

                    <br/><br/>
            <% } %>
        <% } %>
    <% } %>
</div>