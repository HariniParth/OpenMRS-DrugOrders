<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="confirmPlanWindow" class="dialog">
    
    <div class="dialog-header">
        <h3 id="dialog-heading">${ ui.message("MEDICATION PLAN") }</h3>
    </div><br/>
    
    <div>
        <form method="post">
            <h5 class="fields"><strong>${diseaseName}</strong>
                <span class="fields" id="button"><i class="icon-plus edit-action right" title="${ ui.message("Add Another Drug") }" onclick="addPlanItemWindow('${diseaseName}')"></i></span>
            </h5><br/><br/>
            
            <div>
                <% existingMedplans.each { existingMedplan -> %>
                    <div id="itemSpace" class="fields">
                        
                        <strong>${existingMedplan.drugId.getDisplayString()}</strong>

                        <span id="button">
                            <i class="icon-trash delete-action right" title="${ ui.message("Discard") }" onclick="deleteMedPlanItem('${existingMedplan.id}','${existingMedplan.diseaseId.getDisplayString()}','${existingMedplan.drugId.getDisplayString()}','${existingMedplan.dose}','${existingMedplan.doseUnits.getDisplayString()}','${existingMedplan.route.getDisplayString()}','${existingMedplan.quantity}','${existingMedplan.quantityUnits.getDisplayString()}','${existingMedplan.duration}','${existingMedplan.durationUnits.getDisplayString()}','${existingMedplan.frequency}')"></i>
                            <i class="icon-edit edit-action right" title="${ ui.message("Edit") }" onclick="editPlanItemDetails('${existingMedplan.id}','${diseaseName}','${existingMedplan.drugId.getDisplayString()}','${existingMedplan.dose}','${existingMedplan.doseUnits.getDisplayString()}','${existingMedplan.route.getDisplayString()}','${existingMedplan.quantity}','${existingMedplan.quantityUnits.getDisplayString()}','${existingMedplan.duration}','${existingMedplan.durationUnits.getDisplayString()}','${existingMedplan.frequency}')"></i>
                        </span><br/><br/>

                        <span class="planItemDetails">
                            <span id="order_label">Dose:</span>
                            <span id="order_value">${existingMedplan.dose}</span>
                            <span id="order_label">Dose units:</span>
                            <span id="order_value">${existingMedplan.doseUnits.getDisplayString()}</span>
                            <span id="order_label">Route:</span>
                            <span id="order_value">${existingMedplan.route.getDisplayString()}</span>
                            <span id="order_label">Quantity:</span>
                            <span id="order_value">${existingMedplan.quantity}</span>
                            <span id="order_label">Qnty units:</span>
                            <span id="order_value">${existingMedplan.quantityUnits.getDisplayString()}</span>
                            <span id="order_label">Duration:</span>
                            <span id="order_value">${existingMedplan.duration}</span>
                            <span id="order_label">Durn units:</span>
                            <span id="order_value">${existingMedplan.durationUnits.getDisplayString()}</span>
                            <span id="order_label">Frequency:</span>
                            <span id="order_value">${existingMedplan.frequency}</span>
                            <span id="view_order_detail"></span>
                        </span>
                    </div>

                <% } %>
            </div><br/>
            
            <input type="hidden" name="action" value="confirmPlanItem" />
            <button class="confirm right" id="btn-place" type="submit" onclick="hideMedPlanConfirmWindow()">${ ui.message("Done") }</button>
        
        </form>
    </div>
    
</div>