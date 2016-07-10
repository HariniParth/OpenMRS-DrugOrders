<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="showDrugOrderView">

    <h4 id="header">${ ui.message("Order Details") }</h4>
        
    <div class="fields" id="view_order_detail">
        <div id="order_label"><label>Order ID </label></div>
        <div id="order_value"><label id="order_id" value="order_id"></label></div>
    </div>
        
    <div class="fields" id="view_order_detail">
        <div id="order_label"><label id="label">Patient ID</label></div>
        <div id="order_value"><label id="patient_id" value="patient_id"></label></div>
    </div>
        
    <div class="fields" id="view_order_detail">
        <div id="order_label"><label id="label">Patient Name</label></div>
        <div id="order_value"><label id="patient_name" value="patient_name"></label></div>
    </div>
        
    <div class="fields" id="view_order_detail">
        <div id="order_label"><label id="label">Start Date</label></div>
        <div id="order_value"><label id="start_date" value="start_date"></label></div>
    </div>
        
    <div class="fields" id="view_order_detail">
        <div id="order_label"><label id="label">Order Details</label></div>
        <br/><br/><br/>
        <div id="order_value"><label id="order_details" value="order_details"></label></div>
    </div>
        
    <br/><br/>
        
    <div class="fields" id="view_order_detail"><label>Physician instructions for</label></div>
        
    <div class="fields" id="view_order_detail">
        <div id="order_label"><label id="label">Patient</label></div>
        <div id="order_value"><label id="patient_instructions" value="patient_instructions"></label></div>
    </div>

    <br/><br/>

    <div class="fields" id="view_order_detail">
        <div id="order_label"><label id="label">Pharmacist</label></div>
        <div id="order_value"><label id="pharmacist_instructions" value="pharmacist_instructions"></label></div>
    </div>
        
    <br/><br/>
    
    <div id="showDiscontinueOrderView">
        <form method="post">
            <h4 id="header">${ ui.message("Discontinue Order") }</h4>

            <div class="fields" id="view_order_detail">
                <div id="order_label"><label class="col-lg-3">Order ID </label></div>
                <div id="order_value"><label id="dis_order_id" value="dis_order_id" class="col-lg-7"></label></div>
            </div>   

            <label class="fields">Select the reason to discontinue </label>

            <div class="fields">
                <select id="discontinueOrderReasonCoded" name="discontinueOrderReasonCoded">
                    <option value="">Choose option</option>
                </select>
            </div>

            <label class="fields">Enter the reason to discontinue </label>
            <input class="fields" type="textarea" maxlength="30" id="discontinueOrderReasonNonCoded" name="discontinueOrderReasonNonCoded"/>

            <button class="confirm right" id="btn-place" name="discontinueOrder" type="submit" onclick="discontinueOrderWindow()">${ ui.message("Discontinue") }</button>

        </form>
    </div>
    
    <button class="cancel pull-right" id="btn-place" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button></div>

</div>

