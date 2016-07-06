<div id="showDrugOrderView">
    <form method="post">
        <h4>${ ui.message("View Order Details") }</h4>
        <div class="fields"><label>Order ID </label>
            <input type="text" id="order_id" />
        </div>
        <div class="fields"><label>Patient ID</label></div>
        <div class="fields"><label>Patient Name</label></div>
        <div class="fields"><label>Start Date</label></div>
        <div class="fields"><label>Order/s</label></div>
        <br/>
        <div class="fields"><label>Physician instructions for</label></div>
        <div class="fields"><label>Patient</label></div>
        <div class="fields"><label>Pharmacist</label></div>
        <br/>
        <button class="cancel" id="btn-place" onclick="hideDrugOrderViewWindow()">${ ui.message("Close") }</button></div>
    </form>
</div>