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
            
            <% diseaseplans.each { diseaseplan -> %>
                <p class="fields">
                    <span id="order_label">${diseaseplan.value.drugid.getDisplayString()}</span>
                    <a href="#" onclick="displayPlanItemDetails()" id="detailsLink">Details</a>
                    <span id="button">
                        <i class="icon-remove delete-action right" title="${ ui.message("Delete") }" onclick=""></i>
                        <i class="icon-pencil edit-action right" title="${ ui.message("Edit") }" onclick="editPlanItemDetails('${diseaseName}','${diseaseplan.value.drugid.getDisplayString()}','${diseaseplan.value.dose}','${diseaseplan.value.doseunits.getDisplayString()}','${diseaseplan.value.route.getDisplayString()}','${diseaseplan.value.quantity}','${diseaseplan.value.quantityunits.getDisplayString()}','${diseaseplan.value.duration}','${diseaseplan.value.durationunits.getDisplayString()}','${diseaseplan.value.frequency.getDisplayString()}')"></i>
                    </span>
                </p><br/>
                
                <div id="planItemDetails" class="fields">
                    <span id="order_label">Dose:</span>
                    <span id="order_value">${diseaseplan.value.dose}</span><br/>
                    <span id="order_label">Dose units:</span>
                    <span id="order_value">${diseaseplan.value.doseunits.getDisplayString()}</span><br/>
                    <span id="order_label">Route:</span>
                    <span id="order_value">${diseaseplan.value.route.getDisplayString()}</span><br/>
                    <span id="order_label">Quantity:</span>
                    <span id="order_value">${diseaseplan.value.quantity}</span><br/>
                    <span id="order_label">Qnty units:</span>
                    <span id="order_value">${diseaseplan.value.quantityunits.getDisplayString()}</span><br/>
                    <span id="order_label">Duration:</span>
                    <span id="order_value">${diseaseplan.value.duration}</span><br/>
                    <span id="order_label">Durn units:</span>
                    <span id="order_value">${diseaseplan.value.durationunits.getDisplayString()}</span><br/>
                    <span id="order_label">Frequency:</span>
                    <span id="order_value">${diseaseplan.value.frequency.getDisplayString()}</span>
                </div>
            <% } %>
            
            <br/><br/>
            
            <input type="hidden" name="action" value="confirmPlanItem" />
            <button class="confirm right" id="btn-place" type="submit" onclick="hideMedPlanConfirmWindow()">${ ui.message("Close") }</button>
        
        </form>
    </div>
    
</div>