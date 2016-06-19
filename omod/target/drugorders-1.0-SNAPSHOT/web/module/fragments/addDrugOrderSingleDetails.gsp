<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="singleOrderDetailsWindow">
    
    <div class="fields"><label>Drug name </label>
        <input type="text" id="drugNameEntered" value="${drugname}"/>
    </div>
    
    <div class="fields">
        ${ ui.includeFragment("uicommons", "field/datetimepicker", [ label: 'Start Date ', formFieldName: '', useTime: '']) }
    </div>
    
    <div class="fields"><label>Route </label>
        <select id="drugRoute">
            <option value="">Choose option</option>
        </select>
    </div>
    
    <div class="fields"><label>Dose </label>
        <input type="text" id="drugDose" />
    </div>
    
    <div class="fields"><label>Dose units </label>
        <select id="drugDoseUnits">
            <option value="">Choose option</option>
        </select>
    </div>
    
    <div class="fields"><label>Quantity </label>
        <input type="text" id="drugQuantity" />
    </div>
    
    <div class="fields"><label>Quantity units </label>
        <select id="quantityUnits">
            <option value="">Choose option</option>
        </select>
    </div>
    
    <div class="fields"><label>Duration </label>
        <input type="text" id="drugDuration" />
    </div>
    
    <div class="fields"><label>Duration units </label>
        <select id="durationUnits">
            <option value="">Choose option</option>
        </select>
    </div>
    
    <div class="fields"><label>Frequency </label>
        <select id="drugFrequency">
            <option value="">Choose option</option>
        </select>
    </div>
    
    <div class="fields"><label>Associated Diagnosis </label>
        <input type="textarea" maxlength="30" id="associatedDiagnosis" />
    </div>
    
    <div class="fields"><label>Patient Instructions </label>
        <input type="textarea" maxlength="30" id="patientInstructions" />
    </div>
    
    <div class="fields"><label>Pharmacist Instructions </label>
        <input type="textarea" maxlength="30" id="pharmacistInstructions" />
    </div>
    
    <button class="confirm right" id="btn-place" type="submit" onclick="showIndividualOrderDetailsWindow()">${ ui.message("Next") }</button>
    <button class="cancel" id="btn-place" onclick="hideIndividualOrderDetailsWindow()">${ ui.message("Cancel") }</button>
</div>