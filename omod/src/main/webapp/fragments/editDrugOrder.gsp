<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="showEditOrderView">
    <form method="post">
        <h4 id="header">${ ui.message("Edit Order") }</h4>

        <div class="fields" id="view_order_detail">
            <div id="order_label"><label class="col-lg-3">Order ID </label></div>
            <div id="order_value"><label id="edit_order_id" value="edit_order_id" class="col-lg-7"></label></div>
        </div>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label"><label id="label">Drug Name</label></div>
            <div id="order_value"><label id="drug_name" value="drug_name"></label></div>
        </div>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label"><label id="label">Start Date</label></div>
            <div id="order_value"><label id="SelectedOrderDate" value="SelectedOrderDate"></label></div>
        </div>
        
        <br/><br/>
        
        <div class="fields">
            ${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDateNew', label: 'New Start Date (optional)', formFieldName: 'startDateNew', useTime: '']) }
        </div>

        <div class="fields"><label>Route </label>
            <select id="editDrugRoute" name="editDrugRoute">
                <option id="SelectedDrugRoute" name="SelectedDrugRoute"></option>
                <option value="">Choose option</option>
                <% routes.each { route -> %>
                    <option value="${ route.getDisplayString() }">${ route.getDisplayString() }</option>
                <% } %>
            </select>
        </div>
            
        <div class="fields"><label>Dose </label>
            <input type="text" id="editDrugDose" name="editDrugDose"/>
        </div>

        <div class="fields"><label>Dose units </label>
            <select id="editDrugDoseUnits" name="editDrugDoseUnits">
                <option id="SelectedDrugDoseUnits" name="SelectedDrugDoseUnits"></option>
                <option value="">Choose option</option>
                <% doses.each { dose -> %>
                    <option value="${ dose.getDisplayString() }">${ dose.getDisplayString() }</option>
                <% } %>
            </select>
        </div>

        <div class="fields"><label>Quantity </label>
            <input type="text" id="editDrugQuantity" name="editDrugQuantity"/>
        </div>

        <div class="fields"><label>Quantity units </label>
            <select id="editQuantityUnits" name="editQuantityUnits">
                <option id="SelectedDrugQuantityUnits" name="SelectedDrugQuantityUnits"></option>
                <option value="">Choose option</option>
                <% quantities.each { quantity -> %>
                    <option value="${ quantity.getDisplayString() }">${ quantity.getDisplayString() }</option>
                <% } %>
            </select>
        </div>

        <div class="fields"><label>Duration </label>
            <input type="text" id="editDrugDuration" name="editDrugDuration"/>
        </div>

        <div class="fields"><label>Duration units </label>
            <select id="editDurationUnits" name="editDurationUnits">
                <option id="SelectedDrugDurationUnits" name="SelectedDrugDurationUnits"></option>
                <option value="">Choose option</option>
                <% durations.each { duration -> %>
                    <option value="${ duration.getDisplayString() }">${ duration.getDisplayString() }</option>
                <% } %>
            </select>
        </div>

        <div class="fields"><label>Frequency </label>
            <select id="editDrugFrequency" name="editDrugFrequency">
                <option id="SelectedDrugFrequency" name="SelectedDrugFrequency"></option>
                <option value="">Choose option</option>
                <% frequencies.each { frequency -> %>
                    <option value="${ frequency.getDisplayString() }">${ frequency.getDisplayString() }</option>
                <% } %>
            </select>
        </div>

        <div class="fields"><label>Patient Instructions </label>
            <input type="textarea" maxlength="30" id="editPatientInstructions" name="editPatientInstructions"/>
        </div>

        <div class="fields"><label>Pharmacist Instructions </label>
            <input type="textarea" maxlength="30" id="editPharmacistInstructions" name="editPharmacistInstructions"/>
        </div>

        <button class="confirm right" id="btn-place" name="editOrder" type="submit" onclick="editOrderWindow()">${ ui.message("Submit") }</button>
        <button class="cancel " id="btn-place" onclick="hideEditOrderWindow()">${ ui.message("Close") }</button></div>
    </form>
</div>