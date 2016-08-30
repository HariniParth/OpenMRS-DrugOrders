<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="showDrugOrderView">

    <h4 id="header">${ ui.message("VIEW ORDER") }</h4>
        
    <br/><br/>
    
    <div class="fields" id="view_order_detail">
        <div id="order_label">
            <label>Order Details</label>
        </div>
        <div id="order_value">
            <label id="order_details"></label>
        </div>
    </div>
    
    <br/><br/><br/>
    
    <div class="fields" id="view_order_detail">
        <div id="order_label">
            <label>Start Date</label>
        </div>
        <div id="order_value">
            <label id="start_date"></label>
        </div>
    </div>
    
    <br/><br/>

    <div class="fields" id="view_order_detail">
        <label>Instructions from Physician for</label>
    </div>
    
    <br/>
    
    <div class="fields" id="view_order_detail">
        <div id="order_label">
            <label>Patient</label>
        </div>
        <div id="order_value">
            <label id="patient_instructions"></label>
        </div>
    </div>

    <br/><br/>

    <div class="fields" id="view_order_detail">
        <div id="order_label">
            <label>Pharmacist</label>
        </div>
        <div id="order_value">
            <label id="pharmacist_instructions"></label>
        </div>
    </div>
        
    <br/><br/>
    
    <div id="showDiscontinueOrderView">
        <form method="post">
            <h4 id="header">${ ui.message("DISCONTINUE ORDER") }</h4>
            
            <label class="fields">Select the reason to discontinue </label>

            <div class="fields">                
                <select id="discontinueOrderReasonCoded" name="discontinueOrderReasonCoded" class="select_field">
                    <option value="">Choose option</option>
                    <% discontinueReasons.each { discontinueReason -> %>
                        <option value="${ discontinueReason.getDisplayString() }">${ discontinueReason.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>

            <label class="fields">Enter the reason to discontinue </label>
            
            <div class="fields" id="view_order_detail">
                <input class="fields" type="textarea" maxlength="30" id="discontinueOrderReasonNonCoded" name="discontinueOrderReasonNonCoded"/>
            </div>

            <input type="hidden" id="dis_order_id" name="dis_order_id"/>
            <input type="hidden" name="action" value="discontinueDrugOrder"/>
            <br/>
            <button class="confirm pull-right" id="btn-place" name="discontinueOrder" type="submit" onclick="discontinueOrderWindow()">${ ui.message("Discontinue") }</button>
            <button class="cancel pull-left" id="btn-place" type="button" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button>
        </form>
    </div>
    
    <div id="view_window_close_btn">
        <button class="cancel pull-right" id="btn-place" type="button" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button>
    </div>

</div>

<% if(newDrugOrders.size() > 0) { %>
    <div id="confirmOrderView">
        <div class="dialog-header">
            <h4 id="text_heading">${ ui.message("ORDER CONFIRMED") }</h4>
        </div>
        <br/><br/>
        <div class="fields">
            <form method="post">
                <% newOrderMainData.each { mainOrder -> %>
                    <% newDrugOrders.each { order -> %>
                        <% if(mainOrder.key == order.key) { %>
                        <span id="order_label"><input type="checkbox" name="groupCheckBox" value="${order.key}">  ${order.value.drugname.getDisplayString()}</span>
                            <a href="#" class="detailsLink">Details</a>
                            <span id="button" class="pull-right">
                                <i class="icon-pencil edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('Edit Drug Order','${ mainOrder.key }','${ order.value.drugname.getDisplayString() }','${ order.value.startdate }','${ mainOrder.value.dose }','${ mainOrder.value.doseUnits.getDisplayString() }','${ mainOrder.value.route.getDisplayString() }','${ mainOrder.value.duration }','${ mainOrder.value.durationUnits.getDisplayString() }','${ mainOrder.value.quantity }','${ mainOrder.value.quantityUnits.getDisplayString() }','${ mainOrder.value.frequency }','${ order.value.associateddiagnosis.getDisplayString() }','${ order.value.patientinstructions }','${ order.value.pharmacistinstructions }')"></i>
                                <i class="icon-remove delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('${ mainOrder.key }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ order.value.startdate }','${ order.value.drugname.getDisplayString() }','${ mainOrder.value.dose }','${ mainOrder.value.doseUnits.getDisplayString() }','${ mainOrder.value.route.getDisplayString() }','${ mainOrder.value.duration }','${ mainOrder.value.durationUnits.getDisplayString() }','${ mainOrder.value.quantity }','${ mainOrder.value.quantityUnits.getDisplayString() }','${ mainOrder.value.frequency }','${ order.value.patientinstructions }','${ order.value.pharmacistinstructions }')"></i>
                            </span>
                            <br/><br/>

                            <div class="planItemDetails">
                                <span id="order_label">Dose:</span>
                                <span id="order_value">${mainOrder.value.dose}</span>
                                <span id="order_label">Dose units:</span>
                                <span id="order_value">${mainOrder.value.doseUnits.getDisplayString()}</span>
                                <span id="order_label">Route:</span>
                                <span id="order_value">${mainOrder.value.route.getDisplayString()}</span>
                                <span id="order_label">Quantity:</span>
                                <span id="order_value">${mainOrder.value.quantity}</span>
                                <span id="order_label">Qnty units:</span>
                                <span id="order_value">${mainOrder.value.quantityUnits.getDisplayString()}</span>
                                <span id="order_label">Duration:</span>
                                <span id="order_value">${mainOrder.value.duration}</span>
                                <span id="order_label">Durn units:</span>
                                <span id="order_value">${mainOrder.value.durationUnits.getDisplayString()}</span>
                                <span id="order_label">Frequency:</span>
                                <span id="order_value">${mainOrder.value.frequency}</span>
                            </div>
                        <% } %>
                    <% } %>
                <% } %>
    
                <script type="text/javascript">
                    jq(".detailsLink").click(function(){
                        jq(this).nextAll(".planItemDetails").toggle();
                    });
                </script>
                
                <br/><br/>
                
                <span class="fields"><a href="#" id="groupSelected">Group Selected</a></span>
                <span id="button" class="pull-right"><i class="icon-plus edit-action" title="${ ui.message("Add Another Order") }" onclick="showIndividualOrderDetailsWindow('CREATE DRUG ORDER')"></i></span>
                
                <br/><br/>
                
                <input type="hidden" id="confirmOrderGroup" name="action" value="confirmOrderGroup" />
                <button class="confirm right" id="btn-place" type="submit" onclick="confirmOrderGroup()">${ ui.message("Close") }</button>
                
            </form>
        </div>
    </div>
<% } %>

<% if(planDrugOrders.size() > 0) { %>
    <div id="confirmOrderView">
        <div class="dialog-header">
            <h4 id="text_heading">${ ui.message("PLAN CONFIRMED") }</h4>
        </div>
        <br/>
        <div class="fields">
            <form method="post">
                <label>Click on the 'Edit' icons to specify the Start Date and additional Instructions</label><br/>
                <p>${diseaseForPlan}</p>
                
                <% newOrderMainData.each { mainOrder -> %>
                    <% planDrugOrders.each { order -> %>
                        <% if(mainOrder.key == order.key) { %>
                        <span id="order_label">${order.value.drugname.getDisplayString()}</span>
                            <a href="#" class="detailsLink">Details</a>
                            <span id="button" class="pull-right">
                                <i class="icon-pencil edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('Edit Drug Order','${ mainOrder.key }','${ order.value.drugname.getDisplayString() }','${ order.value.startdate }','${ mainOrder.value.dose }','${ mainOrder.value.doseUnits.getDisplayString() }','${ mainOrder.value.route.getDisplayString() }','${ mainOrder.value.duration }','${ mainOrder.value.durationUnits.getDisplayString() }','${ mainOrder.value.quantity }','${ mainOrder.value.quantityUnits.getDisplayString() }','${ mainOrder.value.frequency }','${ diseaseForPlan }','${ order.value.patientinstructions }','${ order.value.pharmacistinstructions }')"></i>
                                <i class="icon-remove delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('${ mainOrder.key }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ order.value.startdate }','${ order.value.drugname.getDisplayString() }','${ mainOrder.value.dose }','${ mainOrder.value.doseUnits.getDisplayString() }','${ mainOrder.value.route.getDisplayString() }','${ mainOrder.value.duration }','${ mainOrder.value.durationUnits.getDisplayString() }','${ mainOrder.value.quantity }','${ mainOrder.value.quantityUnits.getDisplayString() }','${ mainOrder.value.frequency }','${ order.value.patientinstructions }','${ order.value.pharmacistinstructions }')"></i>
                            </span>
                            <br/><br/>

                            <div class="planItemDetails">
                                <span id="order_label">Dose:</span>
                                <span id="order_value">${mainOrder.value.dose}</span>
                                <span id="order_label">Dose units:</span>
                                <span id="order_value">${mainOrder.value.doseUnits.getDisplayString()}</span>
                                <span id="order_label">Route:</span>
                                <span id="order_value">${mainOrder.value.route.getDisplayString()}</span>
                                <span id="order_label">Quantity:</span>
                                <span id="order_value">${mainOrder.value.quantity}</span>
                                <span id="order_label">Qnty units:</span>
                                <span id="order_value">${mainOrder.value.quantityUnits.getDisplayString()}</span>
                                <span id="order_label">Duration:</span>
                                <span id="order_value">${mainOrder.value.duration}</span>
                                <span id="order_label">Durn units:</span>
                                <span id="order_value">${mainOrder.value.durationUnits.getDisplayString()}</span>
                                <span id="order_label">Frequency:</span>
                                <span id="order_value">${mainOrder.value.frequency}</span>
                            </div>
                        <% } %>
                    <% } %>
                <% } %>
    
                <script type="text/javascript">
                    jq(".detailsLink").click(function(){
                        jq(this).nextAll(".planItemDetails").toggle();
                    });
                </script>
                
                <br/><br/>
                
                <span id="button" class="pull-right"><i class="icon-plus edit-action" title="${ ui.message("Add Another Order") }" onclick="showMedicationPlanOrderWindow()"></i></span>
                
                <br/><br/>
                
                <input type="hidden" id="confirmMedPlan" name="action" value="confirmMedPlan" />
                <button class="confirm right" id="btn-place" type="submit" onclick="confirmMedPlan()">${ ui.message("Close") }</button>
                
            </form>
        </div>
    </div>
<% } %>