<%
    ui.includeCss("drugorders", "drugorders.css")
    def orderList = "";
%>

<div id="nonActiveOrdersWindow">
    <% oldDrugOrdersExtension.each { oldDrugOrderExtension -> %>
        <% oldDrugOrdersMain.each { oldDrugOrderMain -> %>
            <% if((oldDrugOrderMain.orderId == oldDrugOrderExtension.orderId) && (!((oldDrugOrderExtension.orderstatus).equals("Active")))) { %>
                    <span class="fields" id="entries">
                        <a href="#" id="oldDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ oldDrugOrderExtension.startdate }','${ oldDrugOrderExtension.drugname.getDisplayString() }','${ oldDrugOrderMain.dose }','${ oldDrugOrderMain.doseUnits.getDisplayString() }','${ oldDrugOrderMain.route.getDisplayString() }','${ oldDrugOrderMain.duration }','${ oldDrugOrderMain.durationUnits.getDisplayString() }','${ oldDrugOrderMain.quantity }','${ oldDrugOrderMain.quantityUnits.getDisplayString() }','${ oldDrugOrderMain.frequency }','${ oldDrugOrderExtension.isallergicorderreasons }','${ oldDrugOrderExtension.patientinstructions }','${ oldDrugOrderExtension.pharmacistinstructions }')">
                            ${ oldDrugOrderExtension.drugname.getDisplayString() } ${ oldDrugOrderExtension.startdate } 
                        </a>    
                    </span>

                    <span id="button">
                        <i class="icon-pencil edit-action" title="${ ui.message("Renew") }" onclick="showRenewIndividualDrugOrderWindow('RENEW DRUG ORDER','${ oldDrugOrderMain.orderId }','${ oldDrugOrderExtension.drugname.getDisplayString() }','${ oldDrugOrderMain.dose }','${ oldDrugOrderMain.doseUnits.getDisplayString() }','${ oldDrugOrderMain.route.getDisplayString() }','${ oldDrugOrderMain.duration }','${ oldDrugOrderMain.durationUnits.getDisplayString() }','${ oldDrugOrderMain.quantity }','${ oldDrugOrderMain.quantityUnits.getDisplayString() }','${ oldDrugOrderMain.frequency }','${ oldDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ oldDrugOrderExtension.patientinstructions }','${ oldDrugOrderExtension.pharmacistinstructions }')"></i>
                    </span>

                    <br/><br/>
            <% } %>
        <% } %>
    <% } %>
    
    <% oldDrugOrderGroups.each { oldDrugOrder -> %>
        <div class="fields">
            <% oldDrugOrder.value.each { oldOrder -> %>
                <% oldDrugOrdersMain.each { oldDrugOrderMain -> %>
                    <% if((oldDrugOrderMain.orderId == oldOrder.orderId) && (!((oldOrder.orderstatus).equals("Active-Group")))) { %>
                        <span id="entries">
                            [Group ${ oldDrugOrder.key }] 
                            <a href="#" id="oldDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ oldOrder.startdate }','${ oldOrder.drugname.getDisplayString() }','${ oldDrugOrderMain.dose }','${ oldDrugOrderMain.doseUnits.getDisplayString() }','${ oldDrugOrderMain.route.getDisplayString() }','${ oldDrugOrderMain.duration }','${ oldDrugOrderMain.durationUnits.getDisplayString() }','${ oldDrugOrderMain.quantity }','${ oldDrugOrderMain.quantityUnits.getDisplayString() }','${ oldDrugOrderMain.frequency }','${ oldOrder.isallergicorderreasons }','${ oldOrder.patientinstructions }','${ oldOrder.pharmacistinstructions }')">
                                ${ oldOrder.drugname.getDisplayString() } ${ oldOrder.startdate }    
                            </a>
                            <% orderList = orderList + oldOrder.drugname.getDisplayString() + "," %>
                        </span><br/><br/>
                    <% } %>
                <% } %>
            <% } %>
            
            <span id="button">
                <i class="icon-pencil edit-action" title="${ ui.message("Renew") }" onclick="showRenewGroupOrderWindow()"></i>
            </span><br/><br/>
        </div>
    <% } %>
</div>