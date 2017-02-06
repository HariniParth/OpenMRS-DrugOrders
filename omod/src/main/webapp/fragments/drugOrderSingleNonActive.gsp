<%
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "dataTables.js")
%>

<div id="nonActiveOrdersWindow">
    <form method="post" name="nonActiveGroupForm" id="nonActiveGroupForm">
        <input type="hidden" id="selectedNonActiveGroup" name="selectedNonActiveGroup" />
        
        <table id="oldDrugOrdersTable">
            <thead>
                <tr>
                    <th>Drug Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% if(oldDrugOrdersExtension.size() == 0 && oldDrugOrderGroups.size() == 0) { %>
                    <tr>
                        <td colspan="2" align="center">No Orders Found</td>
                        <td style="display: none;"></td>
                    </tr>
                <% } %>

                <% oldDrugOrderGroups.each { oldDrugOrder -> %>

                    <tr class="oldGroupRow">
                        <td>
                            <% oldDrugOrder.value.each { oldOrder -> %>

                                <div class="oldDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ oldOrder.startDate.format('yyyy-MM-dd') }','${ oldOrder.drugName.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).dose }','${ oldDrugOrdersMain.get(oldOrder.orderId).doseUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).route.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).duration }','${ oldDrugOrdersMain.get(oldOrder.orderId).durationUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).quantity }','${ oldDrugOrdersMain.get(oldOrder.orderId).quantityUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldOrder.orderId).frequency }','${ oldOrder.refill }','${ oldOrder.isAllergicOrderReasons }','${ oldOrder.priority.getDisplayString() }','${ oldOrder.patientInstructions }','${ oldOrder.pharmacistInstructions }','${ oldOrder.commentForOrderer }')">
                                    <div>${ oldOrder.drugName.getDisplayString().toUpperCase() }</div>
                                    <div><span class="itemSummary">${ oldDrugOrdersMain.get(oldOrder.orderId).dose } ${ oldDrugOrdersMain.get(oldOrder.orderId).doseUnits.getDisplayString() }, ${ oldDrugOrdersMain.get(oldOrder.orderId).duration } ${ oldDrugOrdersMain.get(oldOrder.orderId).durationUnits.getDisplayString() }</span></div>
                                </div>
                                
                            <% } %>
                        </td>
                        <td class="renewGroupButton">
                            <span id="button">
                                <i class="icon-edit edit-action" title="${ ui.message("Renew") }" onclick="showRenewGroupOrderWindow('${oldDrugOrder.key}')"></i>
                            </span>
                        </td>
                    </tr>

                <% } %>

                <% oldDrugOrdersExtension.each { oldDrugOrderExtension -> %>

                    <tr class="oldOrderRow">
                        <td class="oldDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ oldDrugOrderExtension.startDate.format('yyyy-MM-dd') }','${ oldDrugOrderExtension.drugName.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).dose }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).route.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).duration }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).quantity }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).frequency }','${ oldDrugOrderExtension.refill }','${ oldDrugOrderExtension.isAllergicOrderReasons }','${ oldDrugOrderExtension.priority.getDisplayString() }','${ oldDrugOrderExtension.patientInstructions }','${ oldDrugOrderExtension.pharmacistInstructions }','${ oldDrugOrderExtension.commentForOrderer }')">
                            <div>${ oldDrugOrderExtension.drugName.getDisplayString().toUpperCase() }</div>
                            <div><span class="itemSummary">${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).dose } ${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).doseUnits.getDisplayString() }, ${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).duration } ${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).durationUnits.getDisplayString() }</span></div>
                        </td>
                        <td>
                            <span id="button">
                                <i class="icon-edit edit-action" title="${ ui.message("Renew") }" onclick="showRenewOrderWindow('RENEW DRUG ORDER','${ oldDrugOrderExtension.orderId }','${ oldDrugOrderExtension.drugName.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).dose }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).route.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).duration }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).quantity }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ oldDrugOrdersMain.get(oldDrugOrderExtension.orderId).frequency }','${ oldDrugOrderExtension.refill }','${ oldDrugOrderExtension.refillInterval }','${ oldDrugOrderExtension.associatedDiagnosis.getDisplayString() }','${ oldDrugOrderExtension.priority.getDisplayString() }','${ oldDrugOrderExtension.patientInstructions }','${ oldDrugOrderExtension.pharmacistInstructions }')"></i>
                            </span>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table> <br/><br/>
    </form>
</div>

<script>
    jq('#oldDrugOrdersTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": true,
        "bSort": true,
        "bJQueryUI": true,
        "bInfo": true,
        "bFilter": true

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