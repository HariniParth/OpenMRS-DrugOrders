<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="medPlanWindow" class="dialog">
    <div class="dialog-header">
        <h3 id="dialog-heading">${ ui.message("SELECT MEDICATION PLAN") }</h3>
    </div><br/>
    
    <div class="addMedicationPlanWindow">
        <form method="post" id="diseaseForm">
            <div class="fields"><label><strong>Enter Plan Name </strong></label><br/>
                <input type="text" id="diseaseName" name="diseaseName"/>
            </div><br/><br/>            
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
            <h5 class="fields"><strong>${diseaseName}</strong></h5><br/>
            
            <div id="medPlansForDisease" class="fields">
                <% medplans.each { medplan -> %>
                    <div id="itemSpace">
                        <strong>${ medplan.drugId.getDisplayString() }
                            <span id="button" class="pull-right">
                                <i class="icon-edit edit-action" title="${ ui.message("Edit") }"></i>
                                <i class="icon-trash delete-action" title="${ ui.message("Discontinue") }"></i>
                            </span><br/><br/>
                        </strong>
                        
                        <div class="itemSummary">
                            <% if(allergicDrugs.contains(medplan.drugId.getDisplayString())) { %>
                                NOTE: Patient is allergic to this drug <br/>
                                Enter the Reasons to Order <br/>
                                <input type="textarea" class="allergicPlanItemOrderReason" name="allergicPlanItemOrderReason" /> <br/>
                            <% } %>
                            
                            <div id="view_order_detail">
                                <div id="order_label">Dose</div>
                                <div id="order_value">${ medplan.dose }</div>
                            </div>

                            <div id="view_order_detail">
                                <div id="order_label">Dose units</div>
                                <div id="order_value">${ medplan.doseUnits.getDisplayString() }</div>
                            </div>

                            <div id="view_order_detail">
                                <div id="order_label">Route</div>
                                <div id="order_value">${ medplan.route.getDisplayString() }</div>
                            </div>

                            <div id="view_order_detail">
                                <div id="order_label">Quantity</div>
                                <div id="order_value">${ medplan.quantityUnits.getDisplayString() }</div>
                            </div>

                            <div id="view_order_detail">
                                <div id="order_label">Qnty units</div>
                                <div id="order_value">${ medplan.quantityUnits.getDisplayString() }</div>
                            </div>

                            <div id="view_order_detail">
                                <div id="order_label">Duration</div>
                                <div id="order_value">${ medplan.duration }</div>
                            </div>

                            <div id="view_order_detail">
                                <div id="order_label">Durn units</div>
                                <div id="order_value">${ medplan.durationUnits.getDisplayString() }</div>
                            </div>

                            <div id="view_order_detail">
                                <div id="order_label">Frequency</div>
                                <div id="order_value">${ medplan.frequency }</div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>

            <input type="hidden" id="selectMedPlan" name="action" value="selectMedPlan" />
            <div id="btn-place"><button class="confirm pull-right" id="selectPlanButton" type="submit">${ ui.message("Select") }</button>
            <button class="cancel" type="button" onclick="hideMedicationPlansWindow()">${ ui.message("Cancel") }</button></div>
        </form>
    </div>
<% } %>