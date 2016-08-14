<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="confirmNewPlanWindow">
    
    <div class="dialog-header">
        <h4 id="text_heading">${ ui.message("Medication Plan") }</h4>
    </div>
    
    <br/>
    
    <div class="confirmMedicationPlanWindow">
        <form method="post">
            <h5 class="fields">${diseaseName}</h5>
            
            <% existingMedplans.each { existingMedplan -> %>
                <p class="fields">
                    <span id="order_label">${existingMedplan.drugid.getDisplayString()}</span>
                    <a href="#" onclick="displayPlanItemDetails()" id="detailsLink">Details</a>
                    <span id="button">
                        <i class="icon-remove delete-action right" title="${ ui.message("Delete") }" onclick=""></i>
                        <i class="icon-pencil edit-action right" title="${ ui.message("Edit") }" onclick="editPlanItemDetails('${diseaseName}','${existingMedplan.drugid.getDisplayString()}','${existingMedplan.dose}','${existingMedplan.doseunits.getDisplayString()}','${existingMedplan.route.getDisplayString()}','${existingMedplan.quantity}','${existingMedplan.quantityunits.getDisplayString()}','${existingMedplan.duration}','${existingMedplan.durationunits.getDisplayString()}','${existingMedplan.frequency}')"></i>
                    </span>
                </p>
                
                <div id="planItemDetails" class="fields">
                    <span id="order_label">Dose:</span>
                    <span id="order_value">${existingMedplan.dose}</span><br/>
                    <span id="order_label">Dose units:</span>
                    <span id="order_value">${existingMedplan.doseunits.getDisplayString()}</span><br/>
                    <span id="order_label">Route:</span>
                    <span id="order_value">${existingMedplan.route.getDisplayString()}</span><br/>
                    <span id="order_label">Quantity:</span>
                    <span id="order_value">${existingMedplan.quantity}</span><br/>
                    <span id="order_label">Qnty units:</span>
                    <span id="order_value">${existingMedplan.quantityunits.getDisplayString()}</span><br/>
                    <span id="order_label">Duration:</span>
                    <span id="order_value">${existingMedplan.duration}</span><br/>
                    <span id="order_label">Durn units:</span>
                    <span id="order_value">${existingMedplan.durationunits.getDisplayString()}</span><br/>
                    <span id="order_label">Frequency:</span>
                    <span id="order_value">${existingMedplan.frequency}</span>
                </div>
                <br/>
            <% } %>
            
            <br/><br/>
            
            <input type="hidden" name="action" value="confirmPlanItem" />
            <button class="confirm right" id="btn-place" type="submit" onclick="hideMedPlanConfirmWindow()">${ ui.message("Close") }</button>
        
        </form>
    </div>
    
</div>