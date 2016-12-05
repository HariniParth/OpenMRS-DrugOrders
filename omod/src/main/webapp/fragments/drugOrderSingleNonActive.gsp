<%
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "dataTables.js")
%>

<div id="nonActiveOrdersWindow">
    <strong>Non-Active Single Orders</strong><br/><br/>
    <table id="oldDrugOrdersTable">
        <thead>
            <tr>
                <th>Drug Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% if(oldDrugOrdersExtension.size() == 0) { %>
                <tr><td colspan="2" align="center">No Orders Found</td></tr>
            <% } %>

            <% oldDrugOrdersExtension.each { oldDrugOrderExtension -> %>

                <tr class="oldOrderRow">
                    <td class="oldDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ oldDrugOrderExtension.startdate.format('yyyy-MM-dd') }','${ oldDrugOrderExtension.drugname.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).dose }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).route.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).duration }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).quantity }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).frequency }','${ oldDrugOrderExtension.refill }','${ oldDrugOrderExtension.isallergicorderreasons }','${ oldDrugOrderExtension.priority.getDisplayString() }','${ oldDrugOrderExtension.patientinstructions }','${ oldDrugOrderExtension.pharmacistinstructions }','${ oldDrugOrderExtension.comments }')">
                        <div>${ oldDrugOrderExtension.drugname.getDisplayString().toUpperCase() }</div>
                        <div><span class="itemSummary">${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).dose } ${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).doseUnits.getDisplayString() }, ${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).duration } ${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).durationUnits.getDisplayString() }</span></div>
                    </td>
                    <td>
                        <span id="button">
                            <i class="icon-edit edit-action" title="${ ui.message("Renew") }" onclick="showRenewIndividualDrugOrderWindow('RENEW DRUG ORDER','${ oldDrugOrderExtension.orderId }','${ oldDrugOrderExtension.drugname.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).dose }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).route.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).duration }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).quantity }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).frequency }','${ oldDrugOrderExtension.refill }','${ oldDrugOrderExtension.refillinterval }','${ oldDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ oldDrugOrderExtension.priority.getDisplayString() }','${ oldDrugOrderExtension.patientinstructions }','${ oldDrugOrderExtension.pharmacistinstructions }')"></i>
                        </span>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <br/><br/>
    
    <strong>Non-Active Group Orders</strong><br/><br/>
    <table id="oldGroupOrdersTable">
        <thead>
            <tr>
                <th>Drug Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% if(oldDrugOrderGroups.size() == 0) { %>
                <tr><td colspan="2" align="center">No Orders Found</td></tr>
            <% } %>
    
            <% oldDrugOrderGroups.each { oldDrugOrder -> %>
                <% def orderList = "" %>
                
                <tr class="oldGroupRow">
                    <td>
                        <% oldDrugOrder.value.each { oldOrder -> %>

                            <div class="oldDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ oldOrder.startdate.format('yyyy-MM-dd') }','${ oldOrder.drugname.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).dose }','${ oldDrugOrdersMain.get(oldOrder.orderId).doseUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).route.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).duration }','${ oldDrugOrdersMain.get(oldOrder.orderId).durationUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).quantity }','${ oldDrugOrdersMain.get(oldOrder.orderId).quantityUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).frequency }','${ oldOrder.refill }','${ oldOrder.isallergicorderreasons }','${ oldOrder.priority.getDisplayString() }','${ oldOrder.patientinstructions }','${ oldOrder.pharmacistinstructions }','${ oldOrder.comments }')">
                                <div>${ oldOrder.drugname.getDisplayString().toUpperCase() }</div>
                                <div><span class="itemSummary">${ oldDrugOrdersMain.get(oldOrder.orderId).dose } ${ oldDrugOrdersMain.get(oldOrder.orderId).doseUnits.getDisplayString() }, ${ oldDrugOrdersMain.get(oldOrder.orderId).duration } ${ oldDrugOrdersMain.get(oldOrder.orderId).durationUnits.getDisplayString() }</span></div>
                            </div>
                            <% orderList = orderList + oldOrder.drugname.getDisplayString() + "," %>
                        <% } %>
                    </td>
                    <td class="renewGroupButton">
                        <span id="button">
                            <i class="icon-edit edit-action" title="${ ui.message("Renew") }" onclick="showRenewGroupOrderWindow('RENEW ORDER GROUP','${oldDrugOrder.key}','${orderList}')"></i>
                        </span>
                    </td>
                </tr>
                
            <% } %>
        </tbody>
    </table>
</div>

<script>
    jq('#oldDrugOrdersTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": false,
        "bSort": true,
        "bJQueryUI": true,
        "bInfo": false,
        "bFilter": false

    });
</script>

<script>
    jq('#oldGroupOrdersTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": false,
        "ordering": false,
        "bJQueryUI": true,
        "bInfo": false,
        "bFilter": false

    });
</script>

<script type="text/javascript">    
    jq(".oldOrderRow").click(function(){
        jq(this).children('td').slice(0, 1).css({"background": "#75b2f0","color": "white"});
    });
</script>

<script type="text/javascript">    
    jq(".renewGroupButton").click(function(){
        jq(this).parent().children('td').slice(0, 1).css({"background": "#75b2f0","color": "white"});
    });
</script>

<script type="text/javascript">    
    jq(".oldDrugOrdersID").click(function(){
        jq(this).children('*').css({"background": "#75b2f0","color": "white"});
    });
</script>

<script type="text/javascript">    
    jq(".renewGroupButton").hover(function(event){
        if(event.type == 'mouseenter'){
            jq(this).parent().children('td').slice(0, 1).children('.oldDrugOrdersID').css({"background": "#75b2f0","color": "white"});
        } else {
            jq(this).parent().children('td').slice(0, 1).children('.oldDrugOrdersID').css({"background": "","color": ""});
        }
    });
    
</script>