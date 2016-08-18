<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="medicationPlanWindow">
    <div class="dialog-header">
        <h3 id="text_heading">${ ui.message("Create Medication Plan Order") }</h3>
    </div>
    <div class="addMedicationPlanWindow">
        <form method="post">
            <div class="fields"><label>Disease name </label><input id="diseaseName" type="text" autocomplete="on" oninput="autoCompleteDisease('${diseaseNames}')" name="diseaseName"/></div>
            <div class="fields">${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'medPlanStartDate', label: 'Start Date ', formFieldName: 'medPlanStartDate', useTime: '']) }</div>            
            <input type="hidden" id="confirmDiseasePlan" name="action" value="confirmDiseasePlan" />
            <button class="confirm right" id="btn-place" type="submit" onclick="showMedicationPlanDetailsWindow()">${ ui.message("Next") }</button>
            <button class="cancel" id="btn-place" type="button" onclick="hideMedicationPlanOrderWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>

<% if(medplans.size() > 0) { %>
    <div id="medPlanDetailsWindow">
        <h4 id="text_heading">${ ui.message("Standard Medication Plan") }</h4>
        <br/><br/>
        
        <div id="medPlansForDisease" class="fields">
            
            <h5>${diseaseName}</h5> <br/>
            <% medplans.each { medplan -> %>
                <span id="order_label">${medplan.drugid.getDisplayString()}</span>
                
                <a href="#" class="detailsLink">Details</a>
                <span id="button">
                    <i class="icon-remove delete-action pull-right" title="${ ui.message("Delete") }" onclick="deleteMedPlanItem('${medplan.id}','${diseaseName}','${medplan.drugid.getDisplayString()}','${medplan.dose}','${medplan.doseunits.getDisplayString()}','${medplan.route.getDisplayString()}','${medplan.quantity}','${medplan.quantityunits.getDisplayString()}','${medplan.duration}','${medplan.durationunits.getDisplayString()}','${medplan.frequency}')"></i>
                    <i class="icon-pencil edit-action pull-right" title="${ ui.message("Edit") }" onclick="editPlanItemDetails('${medplan.id}','${diseaseName}','${medplan.drugid.getDisplayString()}','${medplan.dose}','${medplan.doseunits.getDisplayString()}','${medplan.route.getDisplayString()}','${medplan.quantity}','${medplan.quantityunits.getDisplayString()}','${medplan.duration}','${medplan.durationunits.getDisplayString()}','${medplan.frequency}')"></i>
                </span><br/><br/>
                    
                <span class="planItemDetails">
                    <span id="order_label">Dose:</span>
                    <span id="order_value">${medplan.dose}</span>
                    <span id="order_label">Dose units:</span>
                    <span id="order_value">${medplan.doseunits.getDisplayString()}</span>
                    <span id="order_label">Route:</span>
                    <span id="order_value">${medplan.route.getDisplayString()}</span>
                    <span id="order_label">Quantity:</span>
                    <span id="order_value">${medplan.quantity}</span>
                    <span id="order_label">Qnty units:</span>
                    <span id="order_value">${medplan.quantityunits.getDisplayString()}</span>
                    <span id="order_label">Duration:</span>
                    <span id="order_value">${medplan.duration}</span>
                    <span id="order_label">Durn units:</span>
                    <span id="order_value">${medplan.durationunits.getDisplayString()}</span>
                    <span id="order_label">Frequency:</span>
                    <span id="order_value">${medplan.frequency}</span>
                    <br/><br/><br/>
                </span>
                    
                <script type="text/javascript">
                    jq(".detailsLink").click(function(){
                        jq(this).nextAll(".planItemDetails").toggle();
                    });
                </script>
            <% } %>
        </div>
        <br/><br/>
        
        <button class="confirm pull-right" id="btn-place" type="submit" onclick="submitMedicationPlansWindow()">${ ui.message("Submit") }</button>
        <button class="cancel" id="btn-place" type="button" onclick="hideMedicationPlansWindow()">${ ui.message("Cancel") }</button>
    </div>
<% } %>