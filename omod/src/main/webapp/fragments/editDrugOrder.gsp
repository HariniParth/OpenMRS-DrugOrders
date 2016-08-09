<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="showDrugOrderView">

    <h4 id="header">${ ui.message("View Order") }</h4>
        
    <div class="fields" id="view_order_detail">
        <div id="order_label">
            <label>Start Date</label>
        </div>
        <div id="order_value">
            <label id="start_date"></label>
        </div>
    </div>
    
    <br/><br/>
        
    <div class="fields" id="view_order_detail">
        <div id="order_label">
            <label>Order Details</label>
        </div>
        <div id="order_value">
            <label id="order_details"></label>
        </div>
    </div>

    <br/><br/><br/>
        
    <div class="fields" id="view_order_detail">
        <label>Instructions from Physician for</label>
    </div>
    
    <br/>
    
    <div class="fields" id="view_order_detail">
        <div id="order_label">
            <label>Patient</label>
        </div>
        <div id="order_value">
            <label id="patient_instructions"></label>
        </div>
    </div>

    <br/><br/>

    <div class="fields" id="view_order_detail">
        <div id="order_label">
            <label>Pharmacist</label>
        </div>
        <div id="order_value">
            <label id="pharmacist_instructions"></label>
        </div>
    </div>
        
    <br/><br/>
    
    <div id="showDiscontinueOrderView">
        <form method="post">
            <h4 id="header">${ ui.message("Discontinue Order") }</h4>
            
            <label class="fields">Select the reason to discontinue </label>

            <div class="fields">
                <select id="discontinueOrderReasonCoded" name="discontinueOrderReasonCoded">
                    <option value="">Choose option</option>
                </select>
            </div>

            <label class="fields">Enter the reason to discontinue </label>
            
            <div class="fields" id="view_order_detail">
                <input class="fields" type="textarea" maxlength="30" id="discontinueOrderReasonNonCoded" name="discontinueOrderReasonNonCoded"/>
            </div>

            <input type="hidden" id="dis_order_id" name="dis_order_id"/>
            <input type="hidden" name="action" value="discontinueDrugOrder"/>
            <br/>
            <button class="confirm pull-right" id="btn-place" name="discontinueOrder" type="submit" onclick="discontinueOrderWindow()">${ ui.message("Discontinue") }</button>
            <button class="cancel pull-left" id="btn-place" type="button" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button>
        </form>
    </div>
    
    <div id="view_window_close_btn">
        <button class="cancel pull-right" id="btn-place" type="button" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button>
    </div>

</div>

<div id="editOrderWindow">
    <form method="post">
        <h4 id="header">${ ui.message("Edit Order") }</h4>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label id="label">Drug Name</label>
            </div>
            <div id="order_value">
                <label id="drug_name" value="drug_name"></label>
            </div>
        </div>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label id="label">Start Date</label>
            </div>
            <div id="order_value">
                <label id="SelectedOrderDate" value="SelectedOrderDate"></label>
            </div>
        </div>
        
        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label id="label">New Date</label>
            </div>
            <div id="order_value">
                ${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDateNew', label: '', formFieldName: 'startDateNew', useTime: '']) }
            </div>
        </div>
        
        <br/><br/><br/><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Route</label>
            </div>
            <div id="order_value">
                <select id="editDrugRoute" name="editDrugRoute" class="select_field">
                    <option id="SelectedDrugRoute" name="SelectedDrugRoute"></option>
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
                <input type="text" id="editDrugDose" name="editDrugDose" class="select_field" />
            </div>
        </div>
        
        <br/><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Dose units</label>
            </div>
            <div id="order_value">
                <select id="editDrugDoseUnits" name="editDrugDoseUnits" class="select_field">
                    <option id="SelectedDrugDoseUnits" name="SelectedDrugDoseUnits"></option>
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
                <input type="text" id="editDrugQuantity" name="editDrugQuantity" class="select_field" />
            </div>
        </div>
        
        <br/><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Quantity units</label>
            </div>
            <div id="order_value">
                <select id="editQuantityUnits" name="editQuantityUnits" class="select_field">
                    <option id="SelectedDrugQuantityUnits" name="SelectedDrugQuantityUnits"></option>
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
                <input type="text" id="editDrugDuration" name="editDrugDuration" class="select_field"/>
            </div>
        </div>
        
        <br/><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Duration units</label>
            </div>
            <div id="order_value">
                <select id="editDurationUnits" name="editDurationUnits" class="select_field">
                    <option id="SelectedDrugDurationUnits" name="SelectedDrugDurationUnits"></option>
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
                <select id="editDrugFrequency" name="editDrugFrequency" class="select_field">
                    <option id="SelectedDrugFrequency" name="SelectedDrugFrequency"></option>
                    <option value="">Choose option</option>
                    <% frequencies.each { frequency -> %>
                        <option value="${ frequency.getDisplayString() }">${ frequency.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <label>Instructions from Physician for -</label>
        </div> 
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Patient</label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="50" id="editPatientInstructions" name="editPatientInstructions" class="select_field" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Pharmacist</label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="50" id="editPharmacistInstructions" name="editPharmacistInstructions" class="select_field" />
            </div>
        </div>

        <br/><br/>
        
        <input type="hidden" id="edit_order_id" name="edit_order_id"/>
        <input type="hidden" name="action" value="editDrugOrder"/>
        <button class="confirm pull-right" id="btn-place" name="editOrder" type="submit" onclick="editOrderWindow()">${ ui.message("Submit") }</button>
        <button class="cancel pull-left" id="btn-place" type="button" onclick="hideEditOrderWindow()">${ ui.message("Close") }</button></div>
    </form>
</div>


<div id="renewOrderWindow">
    <form method="post">
        <h4 id="header">${ ui.message("Renew Order") }</h4>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label id="label">Drug Name</label>
            </div>
            <div id="order_value">
                <label id="renew_drug_name" value="renew_drug_name"></label>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label id="label">Start Date</label>
            </div>
            <div id="order_value">
                ${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDateRenew', label: '', formFieldName: 'startDateRenew', useTime: '']) }
            </div>
        </div>
        
        <br/><br/><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Route</label>
            </div>
            <div id="order_value">
                <select id="renewDrugRoute" name="renewDrugRoute" class="select_field">
                    <option id="renew_DrugRoute" name="renew_DrugRoute"></option>
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
                <input type="text" id="renewDrugDose" name="renewDrugDose" class="select_field" />
            </div>
        </div>
        
        <br/><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Dose units</label>
            </div>
            <div id="order_value">
                <select id="renewDrugDoseUnits" name="renewDrugDoseUnits" class="select_field">
                    <option id="renew_DrugDoseUnits" name="renew_DrugDoseUnits"></option>
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
                <input type="text" id="renewDrugQuantity" name="renewDrugQuantity" class="select_field" />
            </div>
        </div>
        
        <br/><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Quantity units</label>
            </div>
            <div id="order_value">
                <select id="renewQuantityUnits" name="renewQuantityUnits" class="select_field">
                    <option id="renew_DrugQuantityUnits" name="renew_DrugQuantityUnits"></option>
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
                <input type="text" id="renewDrugDuration" name="renewDrugDuration" class="select_field"/>
            </div>
        </div>
        
        <br/><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Duration units</label>
            </div>
            <div id="order_value">
                <select id="renewDurationUnits" name="renewDurationUnits" class="select_field">
                    <option id="renew_DrugDurationUnits" name="renew_DrugDurationUnits"></option>
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
                <select id="renewDrugFrequency" name="renewDrugFrequency" class="select_field">
                    <option id="renew_DrugFrequency" name="renew_DrugFrequency"></option>
                    <option value="">Choose option</option>
                    <% frequencies.each { frequency -> %>
                        <option value="${ frequency.getDisplayString() }">${ frequency.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Diagnosis</label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="50" id="renewDiagnosis" name="renewDiagnosis" class="select_field" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <label>Instructions from Physician for -</label>
        </div> 
        
        <br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Patient</label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="50" id="renewPatientInstructions" name="renewPatientInstructions" class="select_field" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Pharmacist</label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="50" id="renewPharmacistInstructions" name="renewPharmacistInstructions" class="select_field" />
            </div>
        </div>

        <br/><br/>
        
        <input type="hidden" id="renew_order_id" name="renew_order_id"/>
        <input type="hidden" name="action" value="renewDrugOrder"/>
        <br/>
        <button class="confirm pull-right" id="btn-place" name="renewOrder" type="submit" onclick="renewOrderWindow()">${ ui.message("Submit") }</button>
        <button class="cancel pull-left" id="btn-place" type="button" onclick="hideRenewOrderWindow()">${ ui.message("Close") }</button></div>
    </form>
</div>