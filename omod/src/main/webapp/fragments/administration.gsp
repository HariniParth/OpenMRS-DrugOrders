<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="viewPlanWindow" class="dialog">
    <div class="dialog-header">
        <h3 id="dialog-heading">${ ui.message("PLAN DRUG") }</h3>
    </div><br/><br/>
    
    <div class="fields">
        <div id="view_order_detail">
            <div id="order_label">
                <strong>Drug</strong>
            </div>
            <div id="order_value">
                <label id="plan_drug"></label>
            </div>
        </div>
        
        <div id="view_order_detail">
            <div id="order_label">
                <strong>Plan</strong>
            </div>
            <div id="order_value">
                <label id="plan_disease"></label>
            </div>
        </div><br/><br/><br/>
        
        <div id="view_order_detail">
            <div id="order_label">
                <strong>Dose</strong>
            </div>
            <div id="order_value">
                <label id="plan_dose"></label>
            </div>
        </div>
        
        <div id="view_order_detail">
            <div id="order_label">
                <strong>Dose units</strong>
            </div>
            <div id="order_value">
                <label id="plan_dose_units"></label>
            </div>
        </div>
        
        <div id="view_order_detail">
            <div id="order_label">
                <strong>Route</strong>
            </div>
            <div id="order_value">
                <label id="plan_route"></label>
            </div>
        </div>
        
        <div id="view_order_detail">
            <div id="order_label">
                <strong>Quantity</strong>
            </div>
            <div id="order_value">
                <label id="plan_quantity"></label>
            </div>
        </div>
        
        <div id="view_order_detail">
            <div id="order_label">
                <strong>Qnty units</strong>
            </div>
            <div id="order_value">
                <label id="plan_quantity_units"></label>
            </div>
        </div>
        
        <div id="view_order_detail">
            <div id="order_label">
                <strong>Duration</strong>
            </div>
            <div id="order_value">
                <label id="plan_duration"></label>
            </div>
        </div>
        
        <div id="view_order_detail">
            <div id="order_label">
                <strong>Durn units</strong>
            </div>
            <div id="order_value">
                <label id="plan_duration_units"></label>
            </div>
        </div>
        
        <div id="view_order_detail">
            <div id="order_label">
                <strong>Frequency</strong>
            </div>
            <div id="order_value">
                <label id="plan_frequency"></label>
            </div>
        </div>   
        <div><button class="cancel right" id="btn-place" onclick="hideMedPlanWindow()">${ ui.message("Close") }</button></div>
    </div>
</div>
  

<div id="createPlanWindow" class="dialog">
    <div class="dialog-header">
        <span id="dialog-heading"><h3 id="adminActionType"></h3></span>
    </div><br/>
    
    <div class="fields">
        <form id="createPlanForm" method="post">
            <input type="hidden" id="planId" name="planId" />
            
            <div id="disease_field">
                <label><strong>Enter Plan Name</strong></label>
                <input id="adminPlanName" name="planName"/>
            </div><br/>
            
            <p><strong>Specify Standard Formulation</strong></p>
            
            <div id="view_order_detail">
                <div id="order_label">
                    <label id="label"><strong>Drug Name</strong></label>
                </div>
                <div id="order_value">
                    <input id="adminDrugName" type="text" name="drugName"/>
                </div>
            </div>
            
            <br/><br/>

            <div id="view_order_detail">
                <div id="order_label">
                    <label><strong>Route</strong></label>
                </div>
                <div id="order_value">
                    <select id="adminRoute" name="drugRoute" class="select_field">
                        <option value="">Choose option</option>
                        <% routes.each { route -> %>
                            <option value="${ route.getDisplayString() }">${ route.getDisplayString() }</option>
                        <% } %>
                    </select>
                </div>
            </div>
            
            <br/><br/>
            
            <div id="view_order_detail">
                <div id="order_label">
                    <label><strong>Dose</strong></label>
                </div>
                <div id="order_value">
                    <input type="text" id="adminDose" name="drugDose" class="select_field" />
                </div>
            </div>

            <br/><br/>
            
            <div id="view_order_detail">
                <div id="order_label">
                    <label><strong>Dose Units</strong></label>
                </div>
                <div id="order_value">
                    <select id="adminDoseUnits" name="drugDoseUnits" class="select_field">
                        <option value="">Choose option</option>
                        <% doses.each { dose -> %>
                            <option value="${ dose.getDisplayString() }">${ dose.getDisplayString() }</option>
                        <% } %>
                    </select>
                </div>
            </div>

            <br/><br/>
            
            <div id="view_order_detail">
                <div id="order_label">
                    <label><strong>Quantity</strong></label>
                </div>
                <div id="order_value">
                    <input type="text" id="adminQuantity" name="drugQuantity" class="select_field" />
                </div>
            </div>

            <br/><br/>
            
            <div id="view_order_detail">
                <div id="order_label">
                    <label><strong>Qnty Units</strong></label>
                </div>
                <div id="order_value">
                    <select id="adminQuantityUnits" name="quantityUnits" class="select_field">
                        <option value="">Choose option</option>
                        <% quantities.each { quantity -> %>
                            <option value="${ quantity.getDisplayString() }">${ quantity.getDisplayString() }</option>
                        <% } %>
                    </select>
                </div>
            </div>

            <br/><br/>
            
            <div id="view_order_detail">
                <div id="order_label">
                    <label><strong>Duration</strong></label>
                </div>
                <div id="order_value">
                    <input type="text" id="adminDuration" name="drugDuration" class="select_field"/>
                </div>
            </div>

            <br/><br/>
            
            <div id="view_order_detail">
                <div id="order_label">
                    <label><strong>Durn Units</strong></label>
                </div>
                <div id="order_value">
                    <select id="adminDurationUnits" name="durationUnits" class="select_field">
                        <option value="">Choose option</option>
                        <% durations.each { duration -> %>
                            <option value="${ duration.getDisplayString() }">${ duration.getDisplayString() }</option>
                        <% } %>
                    </select>
                </div>
            </div>

            <br/><br/>
            
            <div id="view_order_detail">
                <div id="order_label">
                    <label><strong>Frequency</strong></label>
                </div>
                <div id="order_value">
                    <select id="adminFrequency" name="drugFrequency" class="select_field">
                        <option value="">Choose option</option>
                        <% frequencies.each { frequency -> %>
                            <option value="${ frequency.getConcept().getDisplayString() }">${ frequency.getConcept().getDisplayString() }</option>
                        <% } %>
                    </select>
                </div>
            </div>

            <br/><br/><br/>

            <input type="hidden" name="action" value="addPlan" />
            <button class="confirm right" id="planSaveButton" type="submit">${ ui.message("Confirm") }</button>
            <button class="cancel left" type="button" onclick="hideMedPlanCreateWindow()">${ ui.message("Cancel") }</button><br/><br/>
        </form>
    </div>
</div>


<div id="renamePlanWindow" class="dialog">
    <div class="dialog-header">
        <h3 id="dialog-heading">${ ui.message("RENAME PLAN") }</h3>
    </div><br/>
    
    <form method="post">
        <label class="fields"><strong>Given Plan Name</strong>
            <input id="oldPlanName" name="oldPlanName" readonly="true"/>
        </label><br/>

        <label class="fields"><strong>Enter Plan Name</strong>
            <input id="newPlanName" name="newPlanName" />
        </label><br/><br/>

        <input type="hidden" name="action" value="renamePlan" />
        <button class="confirm right" id="adminEditPlanName" type="submit" onclick="">${ ui.message("Confirm") }</button>
        <button class="cancel left" id="btn-place" type="button" onclick="hideMedPlanEditWindow()">${ ui.message("Cancel") }</button><br/><br/>
    </form>
</div>


<% if(selectedPlan.size() > 0) { %>
    <div id="deletePlanWindow" class="dialog">
        <div class="dialog-header">
            <h3 id="dialog-heading">${ ui.message("DISCARD PLAN") }</h3>
        </div>

        <div>
            <form method="post">
                
                <% selectedPlan.each { discardPlans -> %>
                    <% discardPlans.each { discardPlan -> %>
                        <h5 class="align-center"><strong>${ discardPlan.key }</strong></h5><br/>

                        <div class="fields" id="discardPlanBlock">
                            <% discardPlan.value.each { plan -> %>
                                <input type="checkbox" class="groupCheckBox" name="groupCheckBox" value="${ plan.id }" checked="true" />
                                <i class="icon-plus-sign  edit-action" title="${ ui.message("Show") }"></i>
                                <i class="icon-minus-sign edit-action" title="${ ui.message("Hide") }"></i>
                                <strong>${ plan.drugId.getDisplayString() }</strong><br/><br/>

                                <div class="groupBlock">                
                                    <div id="view_order_detail">
                                        <div id="order_label">Dose</div>
                                        <div id="order_value">${ plan.dose }</div>
                                    </div>

                                    <div id="view_order_detail">
                                        <div id="order_label">Dose units</div>
                                        <div id="order_value">${ plan.doseUnits.getDisplayString() }</div>
                                    </div>

                                    <div id="view_order_detail">
                                        <div id="order_label">Route</div>
                                        <div id="order_value">${ plan.route.getDisplayString() }</div>
                                    </div>

                                    <div id="view_order_detail">
                                        <div id="order_label">Quantity</div>
                                        <div id="order_value">${ plan.quantity }</div>
                                    </div>

                                    <div id="view_order_detail">
                                        <div id="order_label">Qnty units</div>
                                        <div id="order_value">${ plan.quantityUnits.getDisplayString() }</div>
                                    </div>

                                    <div id="view_order_detail">
                                        <div id="order_label">Duration</div>
                                        <div id="order_value">${ plan.duration }</div>
                                    </div>

                                    <div id="view_order_detail">
                                        <div id="order_label">Durn units</div>
                                        <div id="order_value">${ plan.durationUnits.getDisplayString() }</div>
                                    </div>

                                    <div id="view_order_detail">
                                        <div id="order_label">Frequency</div>
                                        <div id="order_value">${ plan.frequency }</div>
                                    </div>
                                </div>
                            <% } %>
                        </div>
                    <% } %>                    
                <% } %>
                
                <input name="action" value="deletePlan" type="hidden" />                
                <button class="confirm right" id="btn-place" name="discardPlan" type="submit" onclick="">${ ui.message("Confirm") }</button>
                <button class="cancel" id="btn-place" type="button" onclick="hideMedPlanDeleteWindow()">${ ui.message("Cancel") }</button>
            </form>
        </div>
    </div>
<% } %>

<script type="text/javascript">
    jq( function() {
        jq( "#adminPlanName" ).autocomplete({
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
            }
        } ),
        
        jq( "#adminDrugName" ).autocomplete({
            source: function( request, response ) {
                var results = [];
                jq.getJSON('${ ui.actionLink("getDrugNameSuggestions") }',
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
            }
        } ),
        
        jq( "#newPlanName" ).autocomplete({
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
            }
        } )
    });
    
</script>

<script type="text/javascript">
    jq(".icon-plus-sign").click(function(){
        jq(this).nextAll(".groupBlock").first().show();
        jq(this).hide();
        jq(this).next(".icon-minus-sign").show();
    });
</script>

<script type="text/javascript">
    jq(".icon-minus-sign").click(function(){
        jq(this).nextAll(".groupBlock").first().hide();
        jq(this).hide();
        jq(this).prev(".icon-plus-sign").show();
    });
</script>