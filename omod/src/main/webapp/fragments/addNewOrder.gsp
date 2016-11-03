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

                <h5><strong>${diseaseName}</strong></h5><br/>
                <p>Check box to omit drug order</p>
                
                <% medplans.each { medplan -> %>
                    <div id="itemSpace">
                        <input type="checkbox" name="omitPlanItemCheckBox" value="${medplan.drugid.getDisplayString()}" /> 
                        <strong>${medplan.drugid.getDisplayString()}</strong><br/>
                        <div class="itemSummary">
                            ${medplan.dose} ${medplan.doseunits.getDisplayString()}, ${medplan.route.getDisplayString()}, ${medplan.quantity} ${medplan.quantityunits.getDisplayString()}, ${medplan.duration} ${medplan.durationunits.getDisplayString()}, ${medplan.frequency}
                        </div>
                    </div>
                    
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
            <button class="cancel" id="btn-place" type="button" onclick="hideMedicationPlansWindow()">${ ui.message("Cancel") }</button>
        </div>
    <% } %>
</form>