<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="showDrugOrderView">

    <h4 id="header">${ ui.message("Order Details") }</h4>
        
    <div class="fields" id="view_order_detail">
        <div id="order_label">
            <label>Patient ID</label>
        </div>
        <div id="order_value">
            <label id="patient_id">${ patientIdentifier }</label>
        </div>
    </div>
    
    <br/><br/>
        
    <div class="fields" id="view_order_detail">
        <div id="order_label">
            <label>Patient Name</label>
        </div>
        <div id="order_value">
            <label id="patient_name"></label>
        </div>
    </div>
        
    <br/><br/>
    
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
        <label>Physician instructions for</label>
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
            
            <div class="fields" id="view_order_detail"><input class="fields" type="textarea" maxlength="30" id="discontinueOrderReasonNonCoded" name="discontinueOrderReasonNonCoded"/></div>

            <button class="confirm right" id="btn-place" name="discontinueOrder" type="submit" onclick="discontinueOrderWindow()">${ ui.message("Discontinue") }</button>

        </form>
    </div>
    
    <button class="cancel pull-right" id="btn-place" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button></div>

</div>

