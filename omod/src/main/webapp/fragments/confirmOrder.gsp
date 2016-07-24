<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="confirmDrugOrderView">
    
    <form method="post">
        <h4 id="header">${ ui.message("Confirm Order") }</h4>

        <br/><br/>

        <input type="hidden" name="drugNameConfirmed" value="${drugNameEntered}" />
        <div class="hidden">${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDateConfirmed', label: '', formFieldName: 'startDateConfirmed', useTime: '', defaultDate: startDateEntered]) }</div>
        <input type="hidden" name="allergicOrderReasonConfirmed" value="${allergicOrderReasonEntered}" />
        <input type="hidden" name="drugRouteConfirmed" value="${drugRoute}" />
        <input type="hidden" name="drugDoseConfirmed" value="${drugDose}" />
        <input type="hidden" name="drugDoseUnitsConfirmed" value="${drugDoseUnits}" />
        <input type="hidden" name="drugQuantityConfirmed" value="${drugQuantity}" />
        <input type="hidden" name="quantityUnitsConfirmed" value="${quantityUnits}" />
        <input type="hidden" name="drugDurationConfirmed" value="${drugDuration}" />
        <input type="hidden" name="durationUnitsConfirmed" value="${durationUnits}" />
        <input type="hidden" name="drugFrequencyConfirmed" value="${drugFrequency}" />
        <input type="hidden" name="associatedDiagnosisConfirmed" value="${associatedDiagnosis}" />
        <input type="hidden" name="patientInstructionsConfirmed" value="${patientInstructions}" />
        <input type="hidden" name="pharmacistInstructionsConfirmed" value="${pharmacistInstructions}" />
        
        
        <a href="#" class="fields">${drugNameEntered} ${startDateEntered}</a>
        <span id="button">
            <i class="icon-pencil edit-action" title="${ ui.message("Edit") }"></i>
            <i class="icon-remove delete-action" title="${ ui.message("Delete") }"></i>
        </span>
        
        <br/><br/><br/><br/>
        
        <input type="hidden" name="action" value="confirmOrder" />
        <button class="confirm right" id="btn-place" type="submit">${ ui.message("Submit") }</button>
        <button class="cancel" id="btn-place" type="button">${ ui.message("Cancel") }</button>
    </form>
    
</div>