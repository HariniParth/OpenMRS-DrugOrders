<%
    ui.includeCss("drugorders", "drugorders.css")
    def selectedDisease = "";
%>

<div id="showDrugOrderView" class="dialog">

    <div class="dialog-header">
        <h3 id="dialog-heading"><label id="activeOrderAction"></label></h3>
    </div><br/>
    
    <div id="singleOrderView">
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label><strong>Order</strong></label>
            </div>
            <div id="order_value">
                <label id="order_details"></label>
            </div>
        </div><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label><strong>Start Date</strong></label>
            </div>
            <div id="order_value">
                <label id="start_date"></label>
            </div>
        </div>
        
        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label><strong>Priority</strong></label>
            </div>
            <div id="order_value">
                <label id="order_priority"></label>
            </div>
        </div>
        
        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label><strong>Refills</strong></label>
            </div>
            <div id="order_value">
                <label id="order_refills"></label>
            </div>
        </div>
        
        <br/><br/>
        
        <div id="allergicOrderReasonView">
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label><strong>Allergy Note</strong></label>
                </div>
                <div id="order_value">
                    <label id="order_reason"></label>
                </div>
            </div><br/>
        </div>
        
        <div class="fields" id="view_order_detail">
            <label><strong>Instructions from Physician for</strong></label>
        </div><br/>

        <div id="patientInstructions">
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label><strong>Patient</strong></label>
                </div>
                <div id="order_value">
                    <label id="patient_instructions"></label>
                </div>
            </div><br/>
        </div>

        <div id="pharmacistInstructions">
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label><strong>Pharmacist</strong></label>
                </div>
                <div id="order_value">
                    <label id="pharmacist_instructions"></label>
                </div>
            </div><br/>
        </div>
        
        <div id="pharmacistCommentsView">
            <div class="fields" id="view_order_detail">
                <label><strong>Pharmacist's Comments for</strong></label><br/><br/>
                <div id="order_label">
                    <label><strong>Physician</strong></label>
                </div>
                <div id="order_value">
                    <label id="pharma_comments"></label>
                </div>
            </div><br/><br/>
        </div>

        <div id="view_window_close_btn">
            <button class="cancel right" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button>
        </div>
        
    </div>
</div>
    

<% if(groupMain.size() > 0) { %>

    <div id="showGroupOrderWindow" class="dialog">
        <form method="post">
            
            <div class="dialog-header">
                <span id="dialog-heading"><h3 id="groupOrderAction">${ groupOrderAction }</h3></span>
            </div><br/>

            <div class="fields" id="groupOrderBlock">
                <% if(groupOrderAction == "DISCARD MED PLAN" || groupOrderAction == "RENEW MED PLAN") { %>
                    <label><strong>${ plan }</strong></label><br/>
                    <label><strong>Drugs Ordered In This Plan</strong></label><br/>
                <% } %>
                
                <% if(groupOrderAction == "DISCARD ORDER GROUP" || groupOrderAction == "RENEW ORDER GROUP") { %>
                    <label><strong>Drugs Ordered In This Group</strong></label><br/>
                <% } %>
                
                <% groupMain.each { order -> %>
                    <div class="groupBlock">
                        <div class="groupDrugName" id="view_order_detail">
                            <strong>${ groupExtn.get(order.key).drugName.getDisplayString() }</strong>
                        
                        <div id="view_order_detail">
                            <div id="order_label">Dose</div>
                            <div id="order_value">${ order.value.dose }</div>
                        </div>
                        
                        <div id="view_order_detail">
                            <div id="order_label">Dose units</div>
                            <div id="order_value">${ order.value.doseUnits.getDisplayString() }</div>
                        </div>
                        
                        <div id="view_order_detail">
                            <div id="order_label">Route</div>
                            <div id="order_value">${ order.value.route.getDisplayString() }</div>
                        </div>
                        
                        <div id="view_order_detail">
                            <div id="order_label">Quantity</div>
                            <div id="order_value">${ order.value.quantity }</div>
                        </div>
                        
                        <div id="view_order_detail">
                            <div id="order_label">Qnty units</div>
                            <div id="order_value">${ order.value.quantityUnits.getDisplayString() }</div>
                        </div>
                        
                        <div id="view_order_detail">
                            <div id="order_label">Duration</div>
                            <div id="order_value">${ order.value.duration }</div>
                        </div>
                        
                        <div id="view_order_detail">
                            <div id="order_label">Durn units</div>
                            <div id="order_value">${ order.value.durationUnits.getDisplayString() }</div>
                        </div>
                        
                        <div id="view_order_detail">
                            <div id="order_label">Frequency</div>
                            <div id="order_value">${ order.value.frequency }</div>
                        </div>
                        
                        <div id="view_order_detail">
                            <div id="order_label">Diagnosis</div>
                            <div id="order_value">${ groupExtn.get(order.key).associatedDiagnosis.getDisplayString() }</div>
                        </div>                        
                    </div><br/>
                <% } %>
                
                <input type="hidden" id="groupOrderID" name="groupOrderID" value="${ group }" />
                <input type="hidden" id="groupAction" name="action" value="${ groupOrderAction }" />
            </div>
            
            <div id="view_order_detail">
                <div id="discontinueReasonSelect">
                    <label><strong>Select the reason to discontinue</strong></label>
                
                    <select id="discontinueReasonCoded" name="discontinueReasonCoded" onchange="discontinueReason()">
                        <option value="">Choose option</option>
                        <% discontinueReasons.each { discontinueReason -> %>
                            <option value="${ discontinueReason.getDisplayString() }">${ discontinueReason.getDisplayString() }</option>
                        <% } %>
                    </select>
                </div>
                
                <div id="discontinueReasonText">
                    <label><strong>Enter the reason to discontinue</strong></label>
                    <input class="fields" type="textarea" maxlength="30" id="discontinueReasonNonCoded" name="discontinueReasonNonCoded" />
                </div><br/>
            </div>
            
            <span id="btn-place"><button class="confirm pull-right" type="submit" id="orderActionButton">Confirm</button></span>
            <span id="btn-place"><button class="cancel pull-left" type="button" onclick="hideGroupOrderWindow()">Cancel</button></span>

        </form>
    </div>
    
<% } %>


<% if(newDrugOrders.size() > 0) { %>
    <div id="confirmOrderView" class="dialog">
        <div class="dialog-header">
            <h3 id="dialog-heading">${ ui.message("NEW INDIVIDUAL ORDERS") }</h3>
        </div>
        <br/><br/>
        <div class="fields">
            <form method="post" name="groupForm">
                <p>
                    <strong>Review and Confirm
                        <span id="button" class="pull-right"><i class="icon-plus edit-action" title="${ ui.message("Add Another Order") }" onclick="showIndividualOrderDetailsWindow('CREATE DRUG ORDER')"></i></span>
                    </strong>
                </p><br/>
                
                <% newDrugOrders.each { order -> %>
                    <div id="itemSpace" class="fields">
                        <strong>${ order.value.drugName.getDisplayString() }</strong>

                        <span id="button" class="pull-right">
                            <i class="icon-edit edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','SINGLE','${ order.key }','${ order.value.drugName.getDisplayString() }','${ order.value.startDate }','${ newOrderMainData.get(order.key).dose }','${ newOrderMainData.get(order.key).doseUnits.getDisplayString() }','${ newOrderMainData.get(order.key).route.getDisplayString() }','${ newOrderMainData.get(order.key).duration }','${ newOrderMainData.get(order.key).durationUnits.getDisplayString() }','${ newOrderMainData.get(order.key).quantity }','${ newOrderMainData.get(order.key).quantityUnits.getDisplayString() }','${ newOrderMainData.get(order.key).frequency }','${ order.value.refill }','${ order.value.refillInterval }','${ order.value.associatedDiagnosis.getDisplayString() }','${ order.value.isAllergicOrderReasons }','${ order.value.priority.getDisplayString() }','${ order.value.patientInstructions }','${ order.value.pharmacistInstructions }')"></i>
                            <i class="icon-trash delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ order.key }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ order.value.startDate.format('yyyy-MM-dd') }','${ order.value.drugName.getDisplayString() }','${ newOrderMainData.get(order.key).dose }','${ newOrderMainData.get(order.key).doseUnits.getDisplayString() }','${ newOrderMainData.get(order.key).route.getDisplayString() }','${ newOrderMainData.get(order.key).duration }','${ newOrderMainData.get(order.key).durationUnits.getDisplayString() }','${ newOrderMainData.get(order.key).quantity }','${ newOrderMainData.get(order.key).quantityUnits.getDisplayString() }','${ newOrderMainData.get(order.key).frequency }','${ order.value.priority.getDisplayString() }','${ order.value.patientInstructions }','${ order.value.pharmacistInstructions }')"></i>
                        </span><br/><br/>

                        <div>
                            <span id="order_label">Dose:</span>
                            <span id="order_value">${newOrderMainData.get(order.key).dose}</span>
                            <span id="order_label">Dose units:</span>
                            <span id="order_value">${newOrderMainData.get(order.key).doseUnits.getDisplayString()}</span>
                            <span id="order_label">Route:</span>
                            <span id="order_value">${newOrderMainData.get(order.key).route.getDisplayString()}</span>
                            <span id="order_label">Quantity:</span>
                            <span id="order_value">${newOrderMainData.get(order.key).quantity}</span>
                            <span id="order_label">Qnty units:</span>
                            <span id="order_value">${newOrderMainData.get(order.key).quantityUnits.getDisplayString()}</span>
                            <span id="order_label">Duration:</span>
                            <span id="order_value">${newOrderMainData.get(order.key).duration}</span>
                            <span id="order_label">Durn units:</span>
                            <span id="order_value">${newOrderMainData.get(order.key).durationUnits.getDisplayString()}</span>
                            <span id="order_label">Frequency:</span>
                            <span id="order_value">${newOrderMainData.get(order.key).frequency}</span>
                        </div>
                    </div>
                <% } %><br/><br/>

                <button class="confirm right" type="submit" id="btn-place" name="action" value="SingleOrder">Confirm</button>
                
            </form>
        </div>
    </div>
<% } %>