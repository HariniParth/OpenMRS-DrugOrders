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
        

<% if(medplans.size() > 0) { %>
    <div id="medPlanDetailsWindow" class="dialog">
        <form method="post">    
            
            <div class="dialog-header">
                <h3 id="dialog-heading">${ ui.message("STANDARD MEDICATION PLAN") }</h3>
            </div><br/>
            
            <input type="hidden" id="diseaseForPlan" name="diseaseForPlan" value="${diseaseName}" />
            
            <div id="medPlansForDisease" class="fields">

                <h5><strong>${diseaseName}</strong></h5><br/>
                
                <% medplans.each { medplan -> %>
                    <div id="itemSpace">
                        <strong>
                            ${ medplan.drugId.getDisplayString() }
                            
                            <span id="button" class="pull-right">
                                <i class="icon-edit edit-action" title="${ ui.message("Edit") }"></i>
                                <i class="icon-trash delete-action" title="${ ui.message("Delete") }"></i>
                            </span><br/>
                        </strong>
                        
                        <div class="itemSummary">
                            <% if(allergicDrugs.contains(medplan.drugId.getDisplayString())) { %>
                                NOTE: Patient is allergic to this drug <br/><br/>
                                <% allergicDrugList = allergicDrugList + medplan.drugId.getDisplayString() + " " %>
                            <% } %>
                            
                            ${ medplan.dose } ${ medplan.doseUnits.getDisplayString() }, ${ medplan.route.getDisplayString() }, ${ medplan.quantity } ${ medplan.quantityUnits.getDisplayString() }, ${ medplan.duration } ${ medplan.durationUnits.getDisplayString() }, ${ medplan.frequency }
                        </div>
                    </div>
                <% } %>
            </div>
            
            <% if(allergicDrugList != "") { %>
                <div class="fields" id="planItemAllergicReasonField">
                    Enter the Reasons to Order<br/>
                    <input type="textarea" id="allergicPlanItemOrderReason" name="allergicPlanItemOrderReason" class="select_field" /> <br/>
                </div>
            <% } %>

            <input type="hidden" id="selectMedPlan" name="action" value="selectMedPlan" />
            <button class="confirm pull-right" id="btn-place" type="submit" onclick="submitMedicationPlansWindow()">${ ui.message("Select") }</button>
            <button class="cancel" id="btn-place" type="button" onclick="hideMedicationPlansWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
<% } %>