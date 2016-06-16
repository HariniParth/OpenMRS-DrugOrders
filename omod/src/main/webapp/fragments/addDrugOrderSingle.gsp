<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="singleOrderWindow">
    <div class="dialog-header">
        <h3 id="text_heading">${ ui.message("Create Individual Drug Order") }</h3>
    </div>
    <div class="addSingleOrderWindow">
        <div id="fields"><label>Drug name </label><input type="text" id="drugName" /></div>
        <div id="fields">${ ui.includeFragment("uicommons", "field/datetimepicker", [ label: 'Start Date ', formFieldName: '', useTime: '']) }</div>
        <button class="confirm right" id="btn-place" type="submit" onclick="showIndividualOrderDetailsWindow()">${ ui.message("Next") }</button>
        <button class="cancel" id="btn-place" onclick="hideIndividualDrugOrderWindow()">${ ui.message("Cancel") }</button>
    </div>
</div>

<div id="singleOrderDetailsWindow">
    
    <div id="fields"><label>Drug name </label>
        <input type="text" id="drugNameEntered" />
    </div>
    
    <div id="fields">
        ${ ui.includeFragment("uicommons", "field/datetimepicker", [ label: 'Start Date ', formFieldName: '', useTime: '']) }
    </div>
    
    <div id="fields"><label>Route </label>
        <select id="drugRoute">
            <option value="">Choose option</option>
        </select>
    </div>
    
    <div id="fields"><label>Dose </label>
        <input type="text" id="drugDose" />
    </div>
    
    <div id="fields"><label>Dose units </label>
        <select id="drugDoseUnits">
            <option value="">Choose option</option>
        </select>
    </div>
    
    <div id="fields"><label>Quantity </label>
        <input type="text" id="drugQuantity" />
    </div>
    
    <div id="fields"><label>Quantity units </label>
        <select id="quantityUnits">
            <option value="">Choose option</option>
        </select>
    </div>
    
    <div id="fields"><label>Duration </label>
        <input type="text" id="drugDuration" />
    </div>
    
    <div id="fields"><label>Duration units </label>
        <select id="durationUnits">
            <option value="">Choose option</option>
        </select>
    </div>
    
    <div id="fields"><label>Frequency </label>
        <select id="drugFrequency">
            <option value="">Choose option</option>
        </select>
    </div>
    
    <div id="fields"><label>Associated Diagnosis </label>
        <input type="textarea" maxlength="30" id="associatedDiagnosis" />
    </div>
    
    <div id="fields"><label>Patient Instructions </label>
        <input type="textarea" maxlength="30" id="patientInstructions" />
    </div>
    
    <div id="fields"><label>Pharmacist Instructions </label>
        <input type="textarea" maxlength="30" id="pharmacistInstructions" />
    </div>
    
    <button class="confirm right" id="btn-place" type="submit" onclick="showIndividualOrderDetailsWindow()">${ ui.message("Next") }</button>
    <button class="cancel" id="btn-place" onclick="hideIndividualOrderDetailsWindow()">${ ui.message("Cancel") }</button>
</div>