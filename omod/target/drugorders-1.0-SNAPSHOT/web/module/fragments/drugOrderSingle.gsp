<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<% existingDrugOrdersExtension.each { existingDrugOrderExtension -> %>
    <% existingDrugOrdersMain.each { existingDrugOrderMain -> %>
        <% if((existingDrugOrderMain.orderId == existingDrugOrderExtension.orderId) && ((existingDrugOrderExtension.orderstatus).equals("Active"))) { %>
            <span id="entries">
                <a href="#" id="existingDrugOrdersID" onclick="showDrugOrderViewWindow('${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')">
                    ${ existingDrugOrderExtension.drugname.getDisplayString() } ${ existingDrugOrderExtension.startdate }    
                </a>    
            </span>

            <span id="button">
                <i class="icon-pencil edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('Edit Drug Order','${ existingDrugOrderMain.orderId }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
                <i class="icon-remove delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('${ existingDrugOrderMain.orderId }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
            </span>
            
            <br/><br/>
        <% } %>
    <% } %>
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
                        <i class="icon-pencil edit-action" title="${ ui.message("Renew") }" onclick="showRenewIndividualDrugOrderWindow('Renew Drug Order','${ existingDrugOrderMain.orderId }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
                    </span>

                    <br/><br/>
            <% } %>
        <% } %>
    <% } %>
</div>