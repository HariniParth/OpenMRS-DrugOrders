<%
    ui.includeCss("drugorders", "drugorders.css")
    def selectedDisease = "";
%>

<div id="showDrugOrderView">

    <h4 id="text_heading"><label id="activeOrderAction"></label></h4><br/>
    
    <div id="singleOrderView">
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
            <div id="order_label">
                <label>Priority</label>
            </div>
            <div id="order_value">
                <label id="order_priority"></label>
            </div>
        </div>
        
        <br/><br/>
        
        <div id="allergicOrderReasonView">
            <div class="fields" id="view_order_detail">
                <label>Allergy Order Note</label><br/><br/>
                <div id="order_label">
                    <label>Order Reason</label>
                </div>
                <div id="order_value">
                    <label id="order_reason"></label>
                </div>
            </div>
            <br/><br/>
        </div>
        
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
        </div><br/><br/>
    </div>
        
    <div id="showDiscontinueOrderView">
        <form method="post">
            
            <div id="planOrderView">
                <div class="fields">
                    <input type="text" id="planDiscontinued" name="planDiscontinued" />
                </div>
            </div><br/>
            
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
            <button class="cancel pull-left" id="btn-place" type="button" onclick="hideDrugOrderViewWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
    
    <div id="view_window_close_btn">
        <button class="cancel pull-right" id="btn-place" type="button" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button>
    </div>

</div>


<div id="showRenewOrderView">
    <form method="post">
        <div class="dialog-header">
            <h4 id="text_heading">${ ui.message("RENEW MED PLAN") }</h4>
        </div><br/><br/>
        <div class="fields">
            <input type="text" id="planRenewed" name="planRenewed" />
        </div><br/>

        <input type="hidden" name="action" value="renewMedPlan"/>
        <br/>
        <button class="confirm pull-right" id="btn-place" name="renewMedPlan" type="submit" onclick="showRenewPlanOrderWindow()">${ ui.message("Renew") }</button>
        <button class="cancel pull-left" id="btn-place" type="button" onclick="hideRenewPlanOrderWindow()">${ ui.message("Cancel") }</button>
    </form>
</div>
    

<div id="showGroupOrderWindow">
    <form method="post">
        <div class="dialog-header">
            <span id="text_heading"><h4 id="groupOrderAction"></h4></span>
        </div><br/>
        
        <div class="fields" id="groupOrderBlock">
            <label>Drugs Ordered In This Group</label><br/><br/>
            <input type="hidden" id="groupOrderID" name="groupOrderID" />
        </div><br/>
                
        <input type="hidden" id="groupAction" name="action" />
        <input class="pull-right" type="submit" id="actionOrderGroup" value="Confirm" />
        <input class="pull-left" type="submit" id="cancelGroupAction" value="Cancel" onclick="hideGroupOrderWindow()" />
                
    </form>
</div>


<% if(newDrugOrders.size() > 0) { %>
    <div id="confirmOrderView">
        <div class="dialog-header">
            <h4 id="text_heading">${ ui.message("ORDER CONFIRMED") }</h4>
        </div>
        <br/><br/>
        <div class="fields">
            <form method="post" name="groupForm">
                <p>Check Orders To Be Grouped
                    <span id="button" class="pull-right"><i class="icon-plus edit-action" title="${ ui.message("Add Another Order") }" onclick="showIndividualOrderDetailsWindow('CREATE DRUG ORDER')"></i></span>
                </p><br/>
                
                <% newOrderMainData.each { mainOrder -> %>
                    <% newDrugOrders.each { order -> %>
                        <% if(mainOrder.key == order.key) { %>
                        
                        <input type="checkbox" name="groupCheckBox" value="${order.key}" ng-model="groupCheckBox" />  
                            <span class="viewDetails">
                                <i class="icon-plus-sign edit-action" title="${ ui.message("View Details") }"></i>
                                <i class="icon-minus-sign edit-action" title="${ ui.message("Hide Details") }"></i>
                            </span>
                            ${order.value.drugname.getDisplayString()}
                            
                            <span id="button" class="pull-right">
                                <i class="icon-pencil edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','SINGLE','${ mainOrder.key }','${ order.value.drugname.getDisplayString() }','${ order.value.startdate }','${ mainOrder.value.dose }','${ mainOrder.value.doseUnits.getDisplayString() }','${ mainOrder.value.route.getDisplayString() }','${ mainOrder.value.duration }','${ mainOrder.value.durationUnits.getDisplayString() }','${ mainOrder.value.quantity }','${ mainOrder.value.quantityUnits.getDisplayString() }','${ mainOrder.value.frequency }','${ order.value.associateddiagnosis.getDisplayString() }','${ order.value.isallergicorderreasons }','${ order.value.priority.getDisplayString() }','${ order.value.patientinstructions }','${ order.value.pharmacistinstructions }')"></i>
                                <i class="icon-remove delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ mainOrder.key }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ order.value.startdate }','${ order.value.drugname.getDisplayString() }','${ mainOrder.value.dose }','${ mainOrder.value.doseUnits.getDisplayString() }','${ mainOrder.value.route.getDisplayString() }','${ mainOrder.value.duration }','${ mainOrder.value.durationUnits.getDisplayString() }','${ mainOrder.value.quantity }','${ mainOrder.value.quantityUnits.getDisplayString() }','${ mainOrder.value.frequency }','${ order.value.priority.getDisplayString() }','${ order.value.patientinstructions }','${ order.value.pharmacistinstructions }')"></i>
                            </span><br/><br/>

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
                <% } %><br/><br/>

                <button class="pull-left" type="submit" id="confirmOrderGroup" name="action" value="GroupOrder" ng-disabled="!groupCheckBox">Group</button>
                <button class="pull-right" type="cancel" id="confirmOrderSingle" name="action" value="SingleOrder">Close</button>
                
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
                <label>Click 'Edit' icon to specify Additional Instructions</label><br/>
                
                <% if(diseaseForPlan != "") { %>
                    <% selectedDisease = diseaseForPlan %>
                <% } else if(associatedDiagnosis != "") { %>
                    <% selectedDisease = associatedDiagnosis %>
                <% } %>
                
                <h5>${selectedDisease}</h5><br/>
                
                <% newOrderMainData.each { mainOrder -> %>
                    <% planDrugOrders.each { order -> %>
                        <% if(mainOrder.key == order.key) { %>
                        
                            <span class="viewDetails">
                                <i class="icon-plus-sign edit-action" title="${ ui.message("View Details") }"></i>
                                <i class="icon-minus-sign edit-action" title="${ ui.message("Hide Details") }"></i>
                            </span>
                            ${order.value.drugname.getDisplayString()}

                            <span id="button" class="pull-right">
                                <i class="icon-pencil edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','PLAN','${ mainOrder.key }','${ order.value.drugname.getDisplayString() }','${ order.value.startdate }','${ mainOrder.value.dose }','${ mainOrder.value.doseUnits.getDisplayString() }','${ mainOrder.value.route.getDisplayString() }','${ mainOrder.value.duration }','${ mainOrder.value.durationUnits.getDisplayString() }','${ mainOrder.value.quantity }','${ mainOrder.value.quantityUnits.getDisplayString() }','${ mainOrder.value.frequency }','${ selectedDisease }','${ order.value.isallergicorderreasons }','${ order.value.priority.getDisplayString() }','${ order.value.patientinstructions }','${ order.value.pharmacistinstructions }')"></i>
                                <i class="icon-remove delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ mainOrder.key }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ order.value.startdate }','${ order.value.drugname.getDisplayString() }','${ mainOrder.value.dose }','${ mainOrder.value.doseUnits.getDisplayString() }','${ mainOrder.value.route.getDisplayString() }','${ mainOrder.value.duration }','${ mainOrder.value.durationUnits.getDisplayString() }','${ mainOrder.value.quantity }','${ mainOrder.value.quantityUnits.getDisplayString() }','${ mainOrder.value.frequency }','${ order.value.priority.getDisplayString() }','${ order.value.patientinstructions }','${ order.value.pharmacistinstructions }')"></i>
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
                <% } %><br/><br/>
                
                <input type="hidden" id="confirmMedPlan" name="action" value="confirmMedPlan" />
                <button class="confirm right" id="btn-place" type="submit" onclick="confirmMedPlan()">${ ui.message("Close") }</button>
                
            </form>
        </div>
    </div>
<% } %>


<script type="text/javascript">
    jq(".icon-plus-sign").click(function(){
        jq(this).parent().nextAll(".planItemDetails").first().show();
        jq(this).hide();
        jq(this).nextAll(".icon-minus-sign").show();
    });
</script>

<script type="text/javascript">
    jq(".icon-minus-sign").click(function(){
        jq(this).parent().nextAll(".planItemDetails").first().hide();
        jq(this).hide();
        jq(this).prevAll(".icon-plus-sign").show();
    });
</script>