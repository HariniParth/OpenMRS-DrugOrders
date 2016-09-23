<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="confirmNewPlanWindow">
    
    <div class="dialog-header">
        <h4 id="text_heading">${ ui.message("MEDICATION PLAN") }</h4>
    </div><br/>
    
    <div class="confirmMedicationPlanWindow">
        <form method="post">
            <h5 class="fields">${diseaseName}
                <span class="fields" id="button"><i class="icon-plus edit-action right" title="${ ui.message("Add Another Drug") }" onclick="addPlanItemWindow('${diseaseName}')"></i></span>
            </h5><br/><br/>
            
            <div>
                <% existingMedplans.each { existingMedplan -> %>
                    <p class="fields">

                        <span class="viewDetails">
                            <i class="icon-plus-sign edit-action" title="${ ui.message("View Details") }"></i>
                            <i class="icon-minus-sign edit-action" title="${ ui.message("Hide Details") }"></i>
                        </span>
                        ${existingMedplan.drugid.getDisplayString()}

                        <span id="button">
                            <i class="icon-remove delete-action right" title="${ ui.message("Delete") }" onclick="deleteMedPlanItem('${existingMedplan.id}','${existingMedplan.diseaseid.getDisplayString()}','${existingMedplan.drugid.getDisplayString()}','${existingMedplan.dose}','${existingMedplan.doseunits.getDisplayString()}','${existingMedplan.route.getDisplayString()}','${existingMedplan.quantity}','${existingMedplan.quantityunits.getDisplayString()}','${existingMedplan.duration}','${existingMedplan.durationunits.getDisplayString()}','${existingMedplan.frequency}')"></i>
                            <i class="icon-pencil edit-action right" title="${ ui.message("Edit") }" onclick="editPlanItemDetails('${existingMedplan.id}','${diseaseName}','${existingMedplan.drugid.getDisplayString()}','${existingMedplan.dose}','${existingMedplan.doseunits.getDisplayString()}','${existingMedplan.route.getDisplayString()}','${existingMedplan.quantity}','${existingMedplan.quantityunits.getDisplayString()}','${existingMedplan.duration}','${existingMedplan.durationunits.getDisplayString()}','${existingMedplan.frequency}')"></i>
                        </span><br/><br/>

                        <span class="planItemDetails">
                            <span id="order_label">Dose:</span>
                            <span id="order_value">${existingMedplan.dose}</span>
                            <span id="order_label">Dose units:</span>
                            <span id="order_value">${existingMedplan.doseunits.getDisplayString()}</span>
                            <span id="order_label">Route:</span>
                            <span id="order_value">${existingMedplan.route.getDisplayString()}</span>
                            <span id="order_label">Quantity:</span>
                            <span id="order_value">${existingMedplan.quantity}</span>
                            <span id="order_label">Qnty units:</span>
                            <span id="order_value">${existingMedplan.quantityunits.getDisplayString()}</span>
                            <span id="order_label">Duration:</span>
                            <span id="order_value">${existingMedplan.duration}</span>
                            <span id="order_label">Durn units:</span>
                            <span id="order_value">${existingMedplan.durationunits.getDisplayString()}</span>
                            <span id="order_label">Frequency:</span>
                            <span id="order_value">${existingMedplan.frequency}</span>
                            <span id="view_order_detail"></span>
                        </span>
                    </p>

                <% } %>
            </div><br/><br/>
            
            <input type="hidden" name="action" value="confirmPlanItem" />
            <button class="confirm right" id="btn-place" type="submit" onclick="hideMedPlanConfirmWindow()">${ ui.message("Done") }</button>
        
        </form>
    </div>
    
</div>

<script type="text/javascript">
    jq(".icon-plus-sign").click(function(){
        jq(this).parent().nextAll(".planItemDetails").first().show();
        jq(this).hide();
        jq(this).nextAll(".icon-minus-sign").show();
    });
</script>

<script type="text/javascript">
    jq(".icon-minus-sign").click(function(){
        jq(this).parent().nextAll(".planItemDetails").first().hide();
        jq(this).hide();
        jq(this).prevAll(".icon-plus-sign").show();
    });
</script>