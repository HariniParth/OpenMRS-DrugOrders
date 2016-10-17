<%
    ui.includeCss("drugorders", "drugorders.css")
    def allergicDrugList = "";
%>

<div id="medicationPlanWindow" class="dialog">
    <div class="dialog-header">
        <h3 id="dialog-heading">${ ui.message("SELECT MEDICATION PLAN") }</h3>
    </div><br/>
    
    <div class="addMedicationPlanWindow">
        <form method="post" id="diseaseForm">
            <div class="fields"><label>Plan Name </label>
                <select id="diseaseName" name="diseaseName" class="select_field" onchange="selectDisease('${drugsNames}','${allergicDrugs}')">
                    <option value="">Choose option</option>
                    <% diseaseNames.each { diseaseName -> %>
                        <option value="${ diseaseName }">${ diseaseName }</option>
                    <% } %>
                </select>
            </div>
            
            <br/><br/>
            
            <button class="cancel pull-right" id="btn-place" type="button" onclick="hideMedicationPlanOrderWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>

<form method="post">
    <% if(medplans.size() > 0) { %>
        <div id="medPlanDetailsWindow" class="dialog">
            
            <div class="dialog-header">
                <h3 id="dialog-heading">${ ui.message("STANDARD MEDICATION PLAN") }</h3>
            </div><br/>
            
            <input type="hidden" id="diseaseForPlan" name="diseaseForPlan" value="${diseaseName}" />
            
            <div id="medPlansForDisease" class="fields">

                <h5>${diseaseName}</h5><br/>
                <% medplans.each { medplan -> %>
                
                    <span class="viewDetails">
                        <i class="icon-plus-sign edit-action" title="${ ui.message("View Details") }"></i>
                        <i class="icon-minus-sign edit-action" title="${ ui.message("Hide Details") }"></i>
                    </span>
                    ${medplan.drugid.getDisplayString()}<br/><br/>

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
                    </span>

                <% } %>
            </div>
                
            <% drugsNames.each { drugName -> %>
                <% allergicDrugs.each { allergicDrug -> %>
                    <% if(drugName == allergicDrug) { %>
                        <% allergicDrugList = allergicDrugList + drugName + " " %>
                    <% } %>
                <% } %>
            <% } %>
            
            <% if(allergicDrugList != "") { %>
                <div id="planItemAllergicReasonField">
                    <div class="fields" id="view_order_detail">
                        NOTE: The patient is allergic to ${allergicDrugList}<br/><br/>
                        
                        <input type="radio" name="allergicDrugAction" value="continue" checked>
                        Continue with this Plan<br/>
                        Enter the Reasons to Order<br/>
                        <input type="textarea" id="allergicPlanItemOrderReason" name="allergicPlanItemOrderReason" class="select_field" /> <br/>
                    
                        <input type="radio" name="allergicDrugAction" value="discard">
                        Discard order of ${allergicDrugList}<br/>
                        
                    </div><br/><br/>
                </div>
            <% } %>

            <input type="hidden" id="selectMedPlan" name="action" value="selectMedPlan" />
            <button class="confirm pull-right" id="btn-place" type="submit" onclick="submitMedicationPlansWindow()">${ ui.message("Select") }</button>
            <button class="cancel" id="btn-place" type="submit" onclick="hideMedicationPlansWindow()">${ ui.message("Cancel") }</button>
        </div>
    <% } %>
</form>

<script type="text/javascript">
    jq(".icon-plus-sign").click(function(){
        jq(this).parent().nextAll(".planItemDetails").first().show();
        jq(this).hide();
        jq(this).nextAll(".icon-minus-sign").show();
    });
    
    jq(".icon-minus-sign").click(function(){
        jq(this).parent().nextAll(".planItemDetails").first().hide();
        jq(this).hide();
        jq(this).prevAll(".icon-plus-sign").show();
    });
</script>  