<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="showDrugOrderView">

    <h4 id="header">${ ui.message("View Order Details") }</h4>
        
    <div class="fields"><label id="order_label">Order ID </label>
        <label id="order_id" value="order_id" class="col-lg-7"></label>
    </div>
        
    <div class="fields"><label id="label">Patient ID</label>
        <label id="patient_id" value="patient_id"class="col-lg-7"></label>
    </div>
        
    <div class="fields"><label id="label">Patient Name</label>
        <label id="patient_name" value="patient_name" class="col-lg-7"></label>
    </div>
        
    <div class="fields"><label id="label">Start Date</label>
        <label id="start_date" value="start_date" class="col-lg-7"></label>
    </div>
        
    <div class="fields"><label id="label">Order Details</label>
        <label id="order_details" value="order_details" class="col-lg-7 "></label>
    </div>
        
    <br/>
        
    <div class="fields"><label>Physician instructions for</label></div>
        
    <div class="fields"><label id="label">Patient</label>
        <label id="patient_instructions" value="patient_instructions" class="col-lg-7"></label>
    </div>
        
    <div class="fields"><label id="label">Pharmacist</label>
        <label id="pharmacist_instructions" value="pharmacist_instructions" class="col-lg-7"></label>
    </div>
        
    <br/>
    <button class="cancel pull-right" id="btn-place" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button></div>

</div>