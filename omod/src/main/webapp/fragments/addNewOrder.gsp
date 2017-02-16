<%
    ui.includeCss("drugorders", "drugorders.css")
    def allergicDrugList = "";
%>

<div id="medPlanWindow" class="dialog">
    <div class="dialog-header">
        <h3 id="dialog-heading">${ ui.message("SELECT MEDICATION PLAN") }</h3>
    </div><br/>
    
    <div class="addMedicationPlanWindow">
        <form method="post" id="diseaseForm">
            <div class="fields"><label>Plan Name </label>
                <input type="text" id="diseaseName" name="diseaseName"/>
            </div>
            
            <br/><br/>
            
            <button class="cancel pull-right" id="btn-place" type="button" onclick="hideMedicationPlanOrderWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>

<script type="text/javascript">
    jq( function() {
        jq( "#diseaseName" ).autocomplete({
            source: function( request, response ) {
                var results = [];
                jq.getJSON('${ ui.actionLink("getPlanNameSuggestions") }',
                    {
                      'query': request.term, 
                    })
                .success(function(data) {
                    for (index in data) {
                        var item = data[index];
                        results.push(item.name);
                        }
                    response( results );
                })
                .error(function(xhr, status, err) {
                    alert('AJAX error ' + err);
                });
            },
            select: function(){
                jq("#diseaseForm").submit();
            }
        } )
    });
</script>
        

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
                        <input type="checkbox" name="omitPlanItemCheckBox" value="${medplan.drugId.getDisplayString()}" /> 
                        <strong>${medplan.drugId.getDisplayString()}</strong><br/>
                        <div class="itemSummary">
                            ${medplan.dose} ${medplan.doseUnits.getDisplayString()}, ${medplan.route.getDisplayString()}, ${medplan.quantity} ${medplan.quantityUnits.getDisplayString()}, ${medplan.duration} ${medplan.durationUnits.getDisplayString()}, ${medplan.frequency}
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