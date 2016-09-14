<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="nonActiveOrdersWindow">
    <% existingDrugOrdersExtension.each { existingDrugOrderExtension -> %>
        <% existingDrugOrdersMain.each { existingDrugOrderMain -> %>
            <% if((existingDrugOrderMain.orderId == existingDrugOrderExtension.orderId) && (!((existingDrugOrderExtension.orderstatus).equals("Active")))) { %>
                    <span id="entries">
                        <a href="#" id="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')">
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