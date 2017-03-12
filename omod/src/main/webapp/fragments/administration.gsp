<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="viewPlanWindow" class="dialog">
    <div class="dialog-header">
        <h3 id="dialog-heading">${ ui.message("PLAN DRUG") }</h3>
    </div><br/><br/>
    
    <div class="fields">
        <span id="order_label"><strong>Plan Name</strong></span>
        <span id="order_label">
            <label id="plan_disease"></label>
        </span><br/>
        
        <span id="order_label"><strong>Drug Name</strong></span>
        <span id="order_label">
            <label id="plan_drug"></label>
        </span><br/><br/>

        <span id="order_label"><strong>Dose</strong></span>
        <span id="order_value">
            <label id="plan_dose"></label>
        </span>

        <span id="order_label"><strong>Dose units</strong></span>
        <span id="order_value">
            <label id="plan_dose_units"></label>
        </span>

        <span id="order_label"><strong>Route</strong></span>
        <span id="order_value">
            <label id="plan_route"></label>
        </span>

        <span id="order_label"><strong>Quantity</strong></span>
        <span id="order_value">
            <label id="plan_quantity"></label>
        </span>

        <span id="order_label"><strong>Qnty units</strong></span>
        <span id="order_value">
            <label id="plan_quantity_units"></label>
        </span>

        <span id="order_label"><strong>Duration</strong></span>
        <span id="order_value">
            <label id="plan_duration"></label>
        </span>

        <span id="order_label"><strong>Durn units</strong></span>
        <span id="order_value">
            <label id="plan_duration_units"></label>
        </span>

        <span id="order_label"><strong>Frequency</strong></span>
        <span id="order_value">
            <label id="plan_frequency"></label>
        </span><br/><br/>
        
        
        <div id="view_window_close_btn">
            <button class="cancel right" onclick="hideMedPlanWindow()">${ ui.message("Close") }</button>
        </div>
        
    </div>
</div>
  

<div id="createPlanWindow" class="dialog">
    <div class="dialog-header">
        <span id="dialog-heading"><h3 id="adminActionType"></h3></span>
    </div><br/>
    
    <div>
        <form method="post">
            <input type="hidden" id="planId" name="planId" />
            
            <div class="fields" id="disease_field">
                <label><strong>Enter Plan Name</strong></label>
                <input id="adminPlanName" name="diseaseName"/>
            </div><br/>
            
            <p class="fields"><strong>Specify Standard Formulation</strong></p>
            <span class="fields" id="asterisk">Note: All Fields are required to be filled/updated</span><br/>
            
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label id="label"><strong>Drug Name</strong></label>
                </div>
                <div id="order_value">
                    <input id="adminDrugName" type="text" name="drugName"/>
                </div>
            </div>
            
            <br/><br/>

            <div class="fields" id="view_order_detail">
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
            
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label><strong>Dose</strong></label>
                </div>
                <div id="order_value">
                    <input type="text" id="adminDose" name="drugDose" class="select_field" />
                </div>
            </div>

            <br/><br/>
            
            <div class="fields" id="view_order_detail">
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
            
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label><strong>Quantity</strong></label>
                </div>
                <div id="order_value">
                    <input type="text" id="adminQuantity" name="drugQuantity" class="select_field" />
                </div>
            </div>

            <br/><br/>
            
            <div class="fields" id="view_order_detail">
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
            
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label><strong>Duration</strong></label>
                </div>
                <div id="order_value">
                    <input type="text" id="adminDuration" name="drugDuration" class="select_field"/>
                </div>
            </div>

            <br/><br/>
            
            <div class="fields" id="view_order_detail">
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
            
            <div class="fields" id="view_order_detail">
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

            <input type="hidden" name="action" value="addPlanItem" />
            <button class="confirm right" id="adminSavePlan" type="submit" onclick="showMedPlanConfirmWindow()">${ ui.message("Save") }</button>
            <button class="cancel left" type="button" onclick="hideMedPlanCreateWindow()">${ ui.message("Cancel") }</button><br/><br/>
        </form>
    </div>
</div>


<div id="editPlanWindow" class="dialog">
    <div class="dialog-header">
        <h3 id="dialog-heading">${ ui.message("RENAME PLAN") }</h3>
    </div><br/>
    
    <div>
        <form method="post">
            
            <label class="fields"><strong>Given Plan Name</strong>
                <input id="disease_name" name="disease_name" readonly="true"/>
            </label><br/>
            
            <label class="fields"><strong>Enter Plan Name</strong>
                <input id="new_disease_name" name="new_disease_name" />
            </label>
            <br/><br/>
            
            <input type="hidden" name="action" value="editPlan" />
            <button class="confirm right" id="adminEditPlanName" name="editPlan" type="submit" onclick="">${ ui.message("Confirm") }</button>
            <button class="cancel left" type="button" onclick="hideMedPlanEditWindow()">${ ui.message("Cancel") }</button><br/><br/>
        </form>
    </div>
</div>


<% if(selectedPlan.size() > 0) { %>
    <div id="deletePlanWindow" class="dialog">
        <div class="dialog-header">
            <h3 id="dialog-heading">${ ui.message("DISCARD PLAN") }</h3>
        </div><br/>

        <div>
            <form method="post">
                
                <% selectedPlan.each { discardPlans -> %>
                    <% discardPlans.each { discardPlan -> %>
                        <div class="fields" id="view_order_detail">
                            <strong>${ discardPlan.key }</strong>
                        </div><br/>

                        <div class="fields" id="discardPlanBlock">
                            <% discardPlan.value.each { plan -> %>
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
                        <input id="discard_plan_name" name="discard_plan_name" value="${ discardPlan.key }" type="hidden" />
                    <% } %>                    
                <% } %>
                
                <input name="action" value="deletePlan" type="hidden" />                
                <button class="confirm right" id="btn-place" name="discardPlan" type="submit" onclick="">${ ui.message("Confirm") }</button>
                <button class="cancel" id="btn-place" type="button" onclick="hideMedPlanDeleteWindow()">${ ui.message("Cancel") }</button>
            </form>
        </div>
    </div>
<% } %>

<div id="deletePlanItemWindow" class="dialog">
    <div class="dialog-header">
        <h3 id="dialog-heading">${ ui.message("DISCARD PLAN DRUG") }</h3>
    </div><br/>
    
    <div>
        <form method="post">
            <input type="hidden" id="medPlan_id" name="medPlan_id" />
            <label class="fields" id="order_label"><strong>Plan Name</strong></label>
            <label class="fields" id="disease_value"></label>
            <label class="fields" id="order_label"><strong>Drug Name</strong></label>
            <label class="fields" id="drug_value"></label>
            <label class="fields" id="order_label"><strong>Dose</strong></label>
            <label class="fields" id="dose_value"></label>
            <label class="fields" id="order_label"><strong>Dose Units</strong></label>
            <label class="fields" id="dose_units_value"></label>
            <label class="fields" id="order_label"><strong>Route</strong></label>
            <label class="fields" id="route_value"></label>
            <label class="fields" id="order_label"><strong>Quantity</strong></label>
            <label class="fields" id="quantity_value"></label>
            <label class="fields" id="order_label"><strong>Qnty Units</strong></label>
            <label class="fields" id="quantity_units_value"></label>
            <label class="fields" id="order_label"><strong>Duration</strong></label>
            <label class="fields" id="duration_value"></label>
            <label class="fields" id="order_label"><strong>Durn Units</strong></label>
            <label class="fields" id="duration_units_value"></label>
            <label class="fields" id="order_label"><strong>Frequency</strong></label>
            <label class="fields" id="frequency_value"></label><br/>

            <input type="hidden" name="action" value="deletePlanItem" />
            <button class="confirm right" id="btn-place" name="deletePlanItem" type="submit" onclick="">${ ui.message("Discard") }</button>
            <button class="cancel" id="btn-place" type="button" onclick="hideMedPlanItemDeleteWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>


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
        
        jq( "#new_disease_name" ).autocomplete({
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