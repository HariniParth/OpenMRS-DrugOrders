<%
    ui.includeCss("drugorders", "drugorders.css")
    def orderList = "";
%>

<% existingDrugOrdersExtension.each { existingDrugOrderExtension -> %>
    <% existingDrugOrdersMain.each { existingDrugOrderMain -> %>
        <% if((existingDrugOrderMain.orderId == existingDrugOrderExtension.orderId) && ((existingDrugOrderExtension.orderstatus).equals("Active"))) { %>
        <span class="fields" id="entries">
                <a href="#" id="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')">
                    ${ existingDrugOrderExtension.drugname.getDisplayString() } ${ existingDrugOrderExtension.startdate }    
                </a>    
            </span>

            <span id="button">
                <i class="icon-pencil edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','SINGLE','${ existingDrugOrderMain.orderId }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
                <i class="icon-remove delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ existingDrugOrderMain.orderId }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
            </span>
            
            <br/><br/>
        <% } %>
    <% } %>
<% } %><br/>

<% existingDrugOrderGroups.each { existingDrugOrder -> %>
    <div class="fields">
        <% existingDrugOrder.value.each { existingOrder -> %>
            <% existingDrugOrdersMain.each { existingDrugOrderMain -> %>
                <% if(existingDrugOrderMain.orderId == existingOrder.orderId) { %>
                    <span id="entries">
                        <a href="#" id="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingOrder.startdate }','${ existingOrder.drugname.getDisplayString() }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingOrder.isallergicorderreasons }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }')">
                            ${ existingOrder.drugname.getDisplayString() } ${ existingOrder.startdate }    
                        </a>
                        <% orderList = orderList + existingOrder.drugname.getDisplayString() + "," %>
                    </span>
                    <span id="button">
                        <i class="icon-pencil edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','GROUP','${ existingDrugOrderMain.orderId }','${ existingOrder.drugname.getDisplayString() }','${ existingOrder.startdate }','${ existingDrugOrderMain.dose }','${ existingDrugOrderMain.doseUnits.getDisplayString() }','${ existingDrugOrderMain.route.getDisplayString() }','${ existingDrugOrderMain.duration }','${ existingDrugOrderMain.durationUnits.getDisplayString() }','${ existingDrugOrderMain.quantity }','${ existingDrugOrderMain.quantityUnits.getDisplayString() }','${ existingDrugOrderMain.frequency }','${ existingOrder.associateddiagnosis.getDisplayString() }','${ existingOrder.isallergicorderreasons }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }')"></i>
                    </span><br/><br/>
                <% } %>
            <% } %>
        <% } %>
        
        <span id="button">
            <i class="icon-edit edit-action" title="${ ui.message("Edit") }" onclick="showEditGroupOrderWindow('${existingDrugOrder.key}','${orderList}')"></i>
            <i class="icon-remove delete-action" title="${ ui.message("Discard") }" onclick="showDiscardGroupOrderWindow('${existingDrugOrder.key}','${orderList}')"></i>
        </span><br/><br/>
    </div>
<% } %>