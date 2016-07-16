<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="showEditOrderView">
    <form method="post">
        <h4 id="header">${ ui.message("Edit Order") }</h4>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Order ID</label>
            </div>
            <div id="order_value">
                <label id="edit_order_id" value="edit_order_id"></label>
            </div>
        </div>
        
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
        
        <button class="confirm right" id="btn-place" name="editOrder" type="submit" onclick="editOrderWindow()">${ ui.message("Submit") }</button>
        <button class="cancel " id="btn-place" onclick="hideEditOrderWindow()">${ ui.message("Close") }</button></div>
    </form>
</div>