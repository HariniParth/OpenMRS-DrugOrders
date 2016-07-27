<%
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "drugorders.js")
%>

<div id="singleOrderDetailsWindow">
    
    <form method="post">
        
        <h4 id="header">${ ui.message("Order Details") }</h4>
                    
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Drug name</label>
            </div>
            <div id="order_value" class="select_field">
                <input type="text" id="drugNameEntered" value="${drugname}" name="drugNameEntered" />
            </div>
        </div>
        
        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Start Date</label>
            </div>
            <div id="order_value">
                ${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDateEntered', label: '', formFieldName: 'startDateEntered', useTime: '', defaultDate: startDate]) }
            </div>
        </div>

        <br/><br/><br/>
        
        <% if(allergicOrderReason != "") { %>
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label>Order Reason</label>
                </div>
                <div id="order_value">
                    <input type="textarea" value="${allergicOrderReason}" id="allergicOrderReason" name="allergicOrderReasonEntered" class="select_field" />
                </div>
            </div>

            <br/><br/>
        
        <% } %>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Route</label>
            </div>
            <div id="order_value">
                <select id="drugRoute" name="drugRoute" class="select_field">
                    <option value="">Choose option</option>
                    <% routes.each { route -> %>
                        <option value="${ route.getDisplayString() }">${ route.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <br/><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Dose</label>
            </div>
            <div id="order_value">
                <input type="text" id="drugDose" name="drugDose" class="select_field" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Dose units</label>
            </div>
            <div id="order_value">
                <select id="drugDoseUnits" name="drugDoseUnits" class="select_field">
                    <option value="">Choose option</option>
                    <% doses.each { dose -> %>
                        <option value="${ dose.getDisplayString() }">${ dose.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Quantity</label>
            </div>
            <div id="order_value">
                <input type="text" id="drugQuantity" name="drugQuantity" class="select_field" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Quantity units</label>
            </div>
            <div id="order_value">
                <select id="quantityUnits" name="quantityUnits" class="select_field">
                    <option value="">Choose option</option>
                    <% quantities.each { quantity -> %>
                        <option value="${ quantity.getDisplayString() }">${ quantity.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Duration</label>
            </div>
            <div id="order_value">
                <input type="text" id="drugDuration" name="drugDuration" class="select_field" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Duration units</label>
            </div>
            <div id="order_value">
                <select id="durationUnits" name="durationUnits" class="select_field">
                    <option value="">Choose option</option>
                    <% durations.each { duration -> %>
                        <option value="${ duration.getDisplayString() }">${ duration.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Frequency </label>
            </div>
            <div id="order_value">
                <select id="drugFrequency" name="drugFrequency" class="select_field">
                    <option value="">Choose option</option>
                    <% frequencies.each { frequency -> %>
                        <option value="${ frequency.getDisplayString() }">${ frequency.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>
                    
        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Diagnosis</label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="50" id="associatedDiagnosis" autocomplete="on" oninput="autoCompleteDiagnosis()" "autoCompleteDiagnosis()" name="associatedDiagnosis" class="select_field" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <label>Instructions from Physician for -</label>
        </div>  
            
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Patient</label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="50" id="patientInstructions" name="patientInstructions" class="select_field"/>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Pharmacist</label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="50" id="pharmacistInstructions" name="pharmacistInstructions" class="select_field"/>
            </div>
        </div>

        <br/><br/>
        
        <input type="hidden" name="action" value="addOrderDraft" />
        <button class="confirm right" id="btn-place" type="submit" onclick="showConfirmOrderWindow()">${ ui.message("Confirm") }</button>
        <button class="cancel" id="btn-place" type="button" onclick="hideIndividualOrderDetailsWindow()">${ ui.message("Cancel") }</button>

    </form>
</div>