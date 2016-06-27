<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="singleOrderDetailsWindow">
    
    <form method="post">
                    
        <div class="fields"><label>Drug name </label>
            <input type="text" id="drugNameEntered" value="${drugname}" name="drugNameEntered" />
        </div>

        <div class="fields">
            ${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDateConfirmed', label: 'Start Date ', formFieldName: 'startDateConfirmed', useTime: '', defaultDate: startDate]) }
        </div>

        <div class="fields"><label>Route </label>
            <select id="drugRoute" name="drugRoute">
                <option value="">Choose option</option>
                <% routes.each { route -> %>
                    <option value="${ route.getDisplayString() }">${ route.getDisplayString() }</option>
                <% } %>
            </select>
        </div>
        
            
        <div class="fields"><label>Dose </label>
            <input type="text" id="drugDose" name="drugDose"/>
        </div>

        <div class="fields"><label>Dose units </label>
            <select id="drugDoseUnits" name="drugDoseUnits">
                <option value="">Choose option</option>
                <% doses.each { dose -> %>
                    <option value="${ dose.getDisplayString() }">${ dose.getDisplayString() }</option>
                <% } %>
            </select>
        </div>

        <div class="fields"><label>Quantity </label>
            <input type="text" id="drugQuantity" name="drugQuantity"/>
        </div>

        <div class="fields"><label>Quantity units </label>
            <select id="quantityUnits" name="quantityUnits">
                <option value="">Choose option</option>
                <% quantities.each { quantity -> %>
                    <option value="${ quantity.getDisplayString() }">${ quantity.getDisplayString() }</option>
                <% } %>
            </select>
        </div>

        <div class="fields"><label>Duration </label>
            <input type="text" id="drugDuration" name="drugDuration"/>
        </div>

        <div class="fields"><label>Duration units </label>
            <select id="durationUnits" name="durationUnits">
                <option value="">Choose option</option>
                <% durations.each { duration -> %>
                    <option value="${ duration.getDisplayString() }">${ duration.getDisplayString() }</option>
                <% } %>
            </select>
        </div>

        <div class="fields"><label>Frequency </label>
            <select id="drugFrequency" name="drugFrequency">
                <option value="">Choose option</option>
                <% frequencies.each { frequency -> %>
                    <option value="${ frequency.getDisplayString() }">${ frequency.getDisplayString() }</option>
                <% } %>
            </select>
        </div>

        <div class="fields"><label>Associated Diagnosis </label>
            <input type="textarea" maxlength="30" id="associatedDiagnosis" name="associatedDiagnosis"/>
        </div>

        <div class="fields"><label>Patient Instructions </label>
            <input type="textarea" maxlength="30" id="patientInstructions" name="patientInstructions"/>
        </div>

        <div class="fields"><label>Pharmacist Instructions </label>
            <input type="textarea" maxlength="30" id="pharmacistInstructions" name="pharmacistInstructions"/>
        </div>

        <button class="confirm right" id="btn-place" type="submit" onclick="showIndividualOrderDetailsWindow()">${ ui.message("Next") }</button>
        <button class="cancel" id="btn-place" onclick="hideIndividualOrderDetailsWindow()">${ ui.message("Cancel") }</button>

    </form>
</div>