<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="viewPlanWindow">
    <div class="dialog-header">
        <h4 id="text_heading">${ ui.message("VIEW PLAN") }</h4>
    </div><br/><br/>
    
    <div id="viewMedPlanWindow">
        <span id="order_label">Plan Name:</span>
        <span id="order_label">
            <label id="plan_disease"></label>
        </span><br/>
        
        <span id="order_label">Drug Name:</span>
        <span id="order_label">
            <label id="plan_drug"></label>
        </span><br/><br/>

        <span id="order_label">Dose:</span>
        <span id="order_value">
            <label id="plan_dose"></label>
        </span>

        <span id="order_label">Dose units:</span>
        <span id="order_value">
            <label id="plan_dose_units"></label>
        </span>

        <span id="order_label">Route:</span>
        <span id="order_value">
            <label id="plan_route"></label>
        </span>

        <span id="order_label">Quantity:</span>
        <span id="order_value">
            <label id="plan_quantity"></label>
        </span>

        <span id="order_label">Qnty units:</span>
        <span id="order_value">
            <label id="plan_quantity_units"></label>
        </span>

        <span id="order_label">Duration:</span>
        <span id="order_value">
            <label id="plan_duration"></label>
        </span>

        <span id="order_label">Durn units:</span>
        <span id="order_value">
            <label id="plan_duration_units"></label>
        </span>

        <span id="order_label">Frequency:</span>
        <span id="order_value">
            <label id="plan_frequency"></label>
        </span>
    </div><br/><br/><br/>
    
    <div id="view_window_close_btn">
        <button class="cancel pull-right" id="btn-place" type="button" onclick="hideMedPlanWindow()">${ ui.message("Close") }</button>
    </div>
</div>

<div id="createNewPlanWindow">
    <div class="dialog-header">
        <span id="text_heading"><h4 id="adminActionType"></h4></span>
    </div><br/>
    <div class="createMedicationPlanWindow">
        <form method="post">
            
            <input type="hidden" id="planId" name="planId" />
            
            <div class="fields" id="disease_field">
                <label>Enter Plan Name </label>
                <input id="diseaseName" type="text" autocomplete="on" oninput="autoCompleteDisease('${diseaseNames}')" name="diseaseName"/>
            </div><br/>
            
            <p class="fields">Specify Standard Formulation</p>
            <span class="fields" id="asterisk">Note: All Fields are required to be filled/updated</span><br/>
            
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label id="label">Drug Name</label>
                </div>
                <div id="order_value">
                    <input id="drug_name" type="text" autocomplete="on" oninput="autoCompletePlanItem('${drugsNames}')" name="drugName"/>
                </div>
            </div>
            
            <br/><br/>

            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label>Route</label>
                </div>
                <div id="order_value">
                    <select id="drugRoute" name="drugRoute" class="select_field">
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
                    <label>Dose</label>
                </div>
                <div id="order_value">
                    <input type="text" id="drugDose" name="drugDose" class="select_field" />
                </div>
            </div>

            <br/><br/>
            
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label>Dose Units</label>
                </div>
                <div id="order_value">
                    <select id="drugDoseUnits" name="drugDoseUnits" class="select_field">
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
                    <label>Quantity</label>
                </div>
                <div id="order_value">
                    <input type="text" id="drugQuantity" name="drugQuantity" class="select_field" />
                </div>
            </div>

            <br/><br/>
            
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label>Quantity Units</label>
                </div>
                <div id="order_value">
                    <select id="quantityUnits" name="quantityUnits" class="select_field">
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
                    <label>Duration</label>
                </div>
                <div id="order_value">
                    <input type="text" id="drugDuration" name="drugDuration" class="select_field"/>
                </div>
            </div>

            <br/><br/>
            
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label>Duration Units</label>
                </div>
                <div id="order_value">
                    <select id="durationUnits" name="durationUnits" class="select_field">
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
                    <label>Frequency</label>
                </div>
                <div id="order_value">
                    <select id="drugFrequency" name="drugFrequency" class="select_field">
                        <option value="">Choose option</option>
                        <% frequencies.each { frequency -> %>
                            <option value="${ frequency.getDisplayString() }">${ frequency.getDisplayString() }</option>
                        <% } %>
                    </select>
                </div>
            </div>

            <br/><br/><br/>

            <input type="hidden" name="action" value="addPlanItem" />
            <button class="confirm right" id="btn-place" name="saveDrug" type="submit" onclick="showMedPlanConfirmWindow()">${ ui.message("Save") }</button>
            <button class="cancel" id="btn-place" type="button" onclick="hideMedPlanCreateWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>

<div id="editMedPlanWindow">
    <div class="dialog-header">
        <h4 id="text_heading">${ ui.message("CHANGE PLAN NAME") }</h4>
    </div><br/>
    
    <div id="editMedicationPlanWindow">
        <form method="post">
            
            <label class="fields">Given Plan Name
                <input id="disease_name" name="disease_name" readonly="true"/>
            </label><br/>
            
            <label class="fields">Enter Plan Name
                <input id="new_disease_name" name="new_disease_name" autocomplete="on" oninput="autoCompleteDisease('${diseaseNames}')" />
            </label>
            <br/><br/>
            
            <input type="hidden" name="action" value="editPlan" />
            <button class="confirm right" id="btn-place" name="editPlan" type="submit" onclick="">${ ui.message("Confirm") }</button>
            <button class="cancel" id="btn-place" type="button" onclick="hideMedPlanEditWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>

<div id="deleteMedPlanWindow">
    <div class="dialog-header">
        <h4 id="text_heading">${ ui.message("DISCARD PLAN") }</h4>
    </div><br/>
    
    <div id="deleteMedicationPlanWindow">
        <form method="post">
            
            <label class="fields">Discard Medication Plan 
                <input id="plan_name" name="plan_name" readonly="true"/>
            </label><br/><br/>
            
            <input type="hidden" name="action" value="deletePlan" />
            <button class="confirm right" id="btn-place" name="discardPlan" type="submit" onclick="">${ ui.message("Confirm") }</button>
            <button class="cancel" id="btn-place" type="button" onclick="hideMedPlanDeleteWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>

<div id="deleteMedPlanItemWindow">
    <div class="dialog-header">
        <h4 id="text_heading">${ ui.message("DISCARD PLAN ITEM") }</h4>
    </div><br/>
    
    <div id="deleteMedicationPlanItemWindow">
        <form method="post">
            <input type="hidden" id="medPlan_id" name="medPlan_id" />
            <label class="fields" id="order_label">Plan Name:</label>
            <label class="fields" id="disease_value"></label>
            <label class="fields" id="order_label">Drug Name:</label>
            <label class="fields" id="drug_value"></label>
            <label class="fields" id="order_label">Dose:</label>
            <label class="fields" id="dose_value"></label>
            <label class="fields" id="order_label">Dose Units:</label>
            <label class="fields" id="dose_units_value"></label>
            <label class="fields" id="order_label">Route:</label>
            <label class="fields" id="route_value"></label>
            <label class="fields" id="order_label">Quantity:</label>
            <label class="fields" id="quantity_value"></label>
            <label class="fields" id="order_label">Qnty Units:</label>
            <label class="fields" id="quantity_units_value"></label>
            <label class="fields" id="order_label">Duration:</label>
            <label class="fields" id="duration_value"></label>
            <label class="fields" id="order_label">Durn Units:</label>
            <label class="fields" id="duration_units_value"></label>
            <label class="fields" id="order_label">Frequency:</label>
            <label class="fields" id="frequency_value"></label><br/>

            <input type="hidden" name="action" value="deletePlanItem" />
            <button class="confirm right" id="btn-place" name="deletePlanItem" type="submit" onclick="">${ ui.message("Discard") }</button>
            <button class="cancel" id="btn-place" type="button" onclick="hideMedPlanItemDeleteWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>