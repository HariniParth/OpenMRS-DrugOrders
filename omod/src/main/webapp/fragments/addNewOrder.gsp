<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="medicationPlanWindow">
    <div class="dialog-header">
        <h3 id="text_heading">${ ui.message("Create Medication Plan Order") }</h3>
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
            <h3 id="text_heading">${ ui.message("Standard Medication Plan") }</h3>
            <br/><br/>
            <input type="hidden" id="diseaseForPlan" name="diseaseForPlan" value="${diseaseName}" />
            
            <div id="medPlansForDisease" class="fields">

                <h5>${diseaseName}</h5> <br/>
                <% medplans.each { medplan -> %>
                    <span id="order_label">${medplan.drugid.getDisplayString()}</span>

                    <a href="#" class="detailsLink">Details</a>
                    <br/><br/>

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
                
                <script type="text/javascript">
                    jq(".detailsLink").click(function(){
                        jq(this).nextAll(".planItemDetails").toggle();
                    });
                </script>
            
            </div>
            
            <br/><br/>

            <input type="hidden" id="confirmDiseasePlan" name="action" value="confirmDiseasePlan" />
            <button class="confirm pull-right" id="btn-place" type="submit" onclick="submitMedicationPlansWindow()">${ ui.message("Select") }</button>
            <button class="cancel" id="btn-place" type="submit" onclick="hideMedicationPlansWindow()">${ ui.message("Cancel") }</button>
        </div>
    <% } %>
</form>