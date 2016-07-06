<div id="showDrugOrderView">
    <form method="post">
        <h4>${ ui.message("View Order Details") }</h4>
        
        <div class="fields"><label>Order ID </label>
            <input type="text" id="order_id" readonly="true"/>
        </div>
        
        <div class="fields"><label>Patient ID</label>
            <input type="text" id="patient_id" readonly="true"/>
        </div>
        
        <div class="fields"><label>Patient Name</label>
            <input type="text" id="patient_name" readonly="true"/>
        </div>
        
        <div class="fields"><label>Start Date</label>
            <input type="text" id="start_date" readonly="true"/>
        </div>
        
        <div class="fields"><label>Order/s</label>
            <input type="text" id="order_details" readonly="true"/>
        </div>
        
        <br/>
        
        <div class="fields"><label>Physician instructions for</label></div>
        
        <div class="fields"><label>Patient</label>
            <input type="text" id="patient_instructions" readonly="true"/>
        </div>
        
        <div class="fields"><label>Pharmacist</label>
            <input type="text" id="pharmacist_instructions" readonly="true"/>
        </div>
        
        <br/>
        <button class="cancel pull-right" id="btn-place" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button></div>
    </form>
</div>