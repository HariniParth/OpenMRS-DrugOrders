<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="singleOrderDetailsWindow">
    
    <form method="post">
                    
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Drug name </label>
            </div>
            <div id="order_value">
                <input type="text" id="drugNameEntered" value="${drugname}" name="drugNameEntered" />
            </div>
        </div>
        
        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            ${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDateConfirmed', label: 'Start Date ', formFieldName: 'startDateConfirmed', useTime: '', defaultDate: startDate]) }
        </div>

        <br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Route </label>
            </div>
            <div id="order_value">
                <select id="drugRoute" name="drugRoute">
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
                <label>Dose </label>
            </div>
            <div id="order_value">
                <input type="text" id="drugDose" name="drugDose"/>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Dose units </label>
            </div>
            <div id="order_value">
                <select id="drugDoseUnits" name="drugDoseUnits">
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
                <label>Quantity </label>
            </div>
            <div id="order_value">
                <input type="text" id="drugQuantity" name="drugQuantity"/>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Quantity units </label>
            </div>
            <div id="order_value">
                <select id="quantityUnits" name="quantityUnits">
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
                <label>Duration </label>
            </div>
            <div id="order_value">
                <input type="text" id="drugDuration" name="drugDuration"/>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Duration units </label>
            </div>
            <div id="order_value">
                <select id="durationUnits" name="durationUnits">
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
                <select id="drugFrequency" name="drugFrequency">
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
                <label>Associated Diagnosis </label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="30" id="associatedDiagnosis" name="associatedDiagnosis"/>
            </div>
        </div>

        <br/><br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Patient Instructions </label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="30" id="patientInstructions" name="patientInstructions"/>
            </div>
        </div>

        <br/><br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Pharmacist Instructions </label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="30" id="pharmacistInstructions" name="pharmacistInstructions"/>
            </div>
        </div>

        <br/><br/><br/>
        
        <button class="confirm right" id="btn-place" type="submit" onclick="showIndividualOrderDetailsWindow()">${ ui.message("Next") }</button>
        <button class="cancel" id="btn-place" onclick="hideIndividualOrderDetailsWindow()">${ ui.message("Cancel") }</button>

    </form>
</div>