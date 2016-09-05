<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="medicationPlanWindow">
    <div class="dialog-header">
        <h4 id="text_heading">${ ui.message("SELECT MEDICATION PLAN") }</h4>
    </div><br/>
    <div class="addMedicationPlanWindow">
        <form method="post" id="diseaseForm">
            <div class="fields"><label>Disease name </label><input id="diseaseName" type="text" autocomplete="on" oninput="autoCompleteDisease('${diseaseNames}')" name="diseaseName"/></div>
            <br/><br/>
            
            <button class="cancel pull-right" id="btn-place" type="button" onclick="hideMedicationPlanOrderWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>

<form method="post">
    <% if(medplans.size() > 0) { %>
        <div id="medPlanDetailsWindow">
            <h4 id="text_heading">${ ui.message("STANDARD MEDICATION PLAN") }</h4>
            <br/><br/>
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
            </div><br/><br/>

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
</script>

<script type="text/javascript">
    jq(".icon-minus-sign").click(function(){
        jq(this).parent().nextAll(".planItemDetails").first().hide();
        jq(this).hide();
        jq(this).prevAll(".icon-plus-sign").show();
    });
</script>