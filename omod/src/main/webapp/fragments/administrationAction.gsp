<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="confirmNewPlanWindow">
    
    <div class="dialog-header">
        <h4 id="text_heading">${ ui.message("Confirm New Medication Plan") }</h4>
    </div>
    
    <br/>
    
    <div class="confirmMedicationPlanWindow">
        <form method="post">
            <p>${diseaseName}</p>
            
            <% diseaseplans.each { diseaseplan -> %>
                <p>${diseaseplan.value.drugid.getDisplayString()} ${diseaseplan.value.dose} ${diseaseplan.value.doseunits.getDisplayString()} ${diseaseplan.value.route.getDisplayString()} ${diseaseplan.value.quantity} ${diseaseplan.value.quantityunits.getDisplayString()} ${diseaseplan.value.duration} ${diseaseplan.value.durationunits.getDisplayString()} ${diseaseplan.value.frequency.getDisplayString()}</p>
            <% } %>
            
            <input type="hidden" name="action" value="confirmPlanItem" />
            <button class="confirm right" id="btn-place" name="confirmDrug" type="submit" onclick="showMedPlanConfirmWindow()">${ ui.message("Next") }</button>
            <button class="cancel" id="btn-place" type="button" onclick="hideMedPlanConfirmWindow()">${ ui.message("Cancel") }</button>
        
        </form>
    </div>
    
</div>