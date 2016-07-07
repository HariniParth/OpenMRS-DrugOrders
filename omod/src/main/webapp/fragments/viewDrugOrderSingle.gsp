<div id="showDrugOrderView">

    <h4 id="header">${ ui.message("View Order Details") }</h4>
        
    <div class="fields"><label class="col-lg-3">Order ID </label>
        <label id="order_id" value="order_id" class="col-lg-7"></label>
    </div>
        
    <div class="fields"><label class="col-lg-3">Patient ID</label>
        <label id="patient_id" value="patient_id"class="col-lg-7"></label>
    </div>
        
    <div class="fields"><label class="col-lg-3">Patient Name</label>
        <label id="patient_name" value="patient_name" class="col-lg-7"></label>
    </div>
        
    <div class="fields"><label class="col-lg-3">Start Date</label>
        <label id="start_date" value="start_date" class="col-lg-7"></label>
    </div>
        
    <div class="fields"><label class="col-lg-3">Order/s</label>
        <label id="order_details" value="order_details" class="col-lg-7 "></label>
    </div>
        
    <br/>
        
    <div class="fields"><label>Physician instructions for</label></div>
        
    <div class="fields"><label class="col-lg-3">Patient</label>
        <label id="patient_instructions" value="patient_instructions" class="col-lg-7"></label>
    </div>
        
    <div class="fields"><label class="col-lg-3">Pharmacist</label>
        <label id="pharmacist_instructions" value="pharmacist_instructions" class="col-lg-7"></label>
    </div>
        
    <br/>
    <button class="cancel pull-right" id="btn-place" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button></div>

</div>