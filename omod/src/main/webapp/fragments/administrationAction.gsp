<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="confirmNewPlanWindow">
    
    <div class="dialog-header">
        <h4 id="text_heading">${ ui.message("Confirm New Medication Plan") }</h4>
    </div>
    
    <br/><br/>
    
    <div class="confirmMedicationPlanWindow">
        <form method="post">
            <p>${diseaseName}</p>
            <p>${drugName}</p>
            
            <input type="hidden" name="action" value="confirmPlanItem" />
            <button class="confirm right" id="btn-place" name="confirmDrug" type="submit" onclick="showMedPlanConfirmWindow()">${ ui.message("Next") }</button>
            <button class="cancel" id="btn-place" type="button" onclick="hideMedPlanConfirmWindow()">${ ui.message("Cancel") }</button>
        
        </form>
    </div>
    
</div>