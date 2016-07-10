<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="showDrugOrderView">

    <h4 id="header">${ ui.message("View Order Details") }</h4>
        
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
    
    <button class="cancel pull-right" id="btn-place" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button></div>

</div>