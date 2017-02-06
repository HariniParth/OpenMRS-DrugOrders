<div class="info-section">
    <div class="info-header">
        <i class="icon-medicine"></i>
        <h3>${ ui.message("drugorders.drugorders").toUpperCase() }</h3>
        <i class="icon-pencil edit-action right" title="${ ui.message("Add") }" onclick="location.href='${ui.pageLink("drugorders", "drugorders", [patientId: patient.patient.id])}';"></i>
    </div>
    <div class="info-body">
        <% drugorders.each { order -> %>
            <% if(order.orderStatus == "Active" || order.orderStatus == "Active-Group" || order.orderStatus == "Active-Plan") { %>
                ${ order.drugName.getDisplayString().toUpperCase() }
                <br/>
            <% } %>
        <% } %>
    </div>
</div>