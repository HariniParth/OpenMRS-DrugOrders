<%
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "dataTables.js")
%>

<div id="currentDrugOrdersTableWrapper">
    <form method="post" name="activeGroupForm" id="activeGroupForm">
        <input type="hidden" id="selectedActiveGroup" name="selectedActiveGroup" />
        <input type="hidden" id="selectedActiveOrder" name="selectedActiveOrder" />
        
        <table id="currentDrugOrdersTable">
            <thead>
                <tr>
                    <th>Group</th>
                    <th>Drug Name</th>
                    <th>Start Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% if(existingDrugOrdersExtension.size() == 0 && existingDrugOrderGroups.size() == 0) { %>
                    <tr>
                        <td colspan="4" align="center">No Orders Found</td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                    </tr>
                <% } %>

                <% existingDrugOrdersExtension.each { existingDrugOrderExtension -> %>
                    <tr class="orderRow <% if(existingDrugOrderExtension.fordiscard == 1) { %> discontinued <% } %> <% if(existingDrugOrderExtension.onhold == 1) { %> onhold <% } %>" title="${ ui.message(existingDrugOrderExtension.comments) }">

                        <td><span><input type="checkbox" name="groupCheckBox" value="${ existingDrugOrderExtension.orderid }" ng-model="groupCheckBox" /></span></td>

                        <td class="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate.format('yyyy-MM-dd') }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).dose }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).duration }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).quantity }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).frequency }','${ existingDrugOrderExtension.refill }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }','${ existingDrugOrderExtension.comments }')">
                            <div>${ existingDrugOrderExtension.drugname.getDisplayString().toUpperCase() }</div>
                            <div><span class="itemSummary">${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).dose } ${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).doseUnits.getDisplayString() }, ${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).duration } ${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).durationUnits.getDisplayString() }</span></div>
                        </td>

                        <td class="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate.format('yyyy-MM-dd') }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).dose }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).duration }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).quantity }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).frequency }','${ existingDrugOrderExtension.refill }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }','${ existingDrugOrderExtension.comments }')">${ existingDrugOrderExtension.startdate.format('yyyy-MM-dd') }</td>

                        <td>
                            <span id="button">
                                <i class="icon-edit edit-action" title="${ ui.message("Edit") }" onclick="showEditSingleOrderWindow('EDIT DRUG ORDER','SINGLE','${ existingDrugOrderExtension.orderid }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).dose }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).duration }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).quantity }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderid).frequency }','${ existingDrugOrderExtension.refill }','${ existingDrugOrderExtension.refillinterval }','${ existingDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
                                <i class="icon-trash delete-action" title="${ ui.message("Delete") }" onclick="discardSingleOrder('${ existingDrugOrderExtension.orderid }')"></i>
                            </span>
                        </td>

                    </tr>
                <% } %>

                <% existingDrugOrderGroups.each { existingDrugOrder -> %>
                    <% def orderList = "" %>
                    <tr class="groupRow">
    
                        <td></td>
                        <td colspan="3" class="groupDetails">
                            <% existingDrugOrder.value.each { existingOrder -> %>
                                <% if(existingOrder.orderstatus == "Active-Group") { %>

                                    <div class="groupSingles <% if(existingOrder.fordiscard == 1) { %> discontinued <% } %> <% if(existingOrder.onhold == 1) { %> onhold <% } %>" title="${ ui.message(existingOrder.comments) }">
                                        
                                        <div class="groupDrugDetails" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingOrder.startdate.format('yyyy-MM-dd') }','${ existingOrder.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderid).dose }','${ existingDrugOrdersMain.get(existingOrder.orderid).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderid).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderid).duration }','${ existingDrugOrdersMain.get(existingOrder.orderid).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderid).quantity }','${ existingDrugOrdersMain.get(existingOrder.orderid).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderid).frequency }','${ existingOrder.refill }','${ existingOrder.isallergicorderreasons }','${ existingOrder.priority.getDisplayString() }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }','${ existingOrder.comments }')">
                                            
                                            <div class="existingDrugOrdersID" id="groupDrugName">
                                                <div>${ existingOrder.drugname.getDisplayString().toUpperCase() }</div>
                                                <div><span class="itemSummary">${ existingDrugOrdersMain.get(existingOrder.orderid).dose } ${ existingDrugOrdersMain.get(existingOrder.orderid).doseUnits.getDisplayString() }, ${ existingDrugOrdersMain.get(existingOrder.orderid).duration } ${ existingDrugOrdersMain.get(existingOrder.orderid).durationUnits.getDisplayString() }</span></div>
                                            </div>
                                            <% orderList = orderList + existingOrder.drugname.getDisplayString() + "," %>

                                            <div class="existingDrugOrdersID" id="groupDrugDate">${ existingOrder.startdate.format('yyyy-MM-dd') }</div>
                                        </div>

                                        <div class="groupDrugButton">
                                            <span id="button">
                                                <i class="icon-edit edit-action" title="${ ui.message("Edit") }" onclick="showEditSingleOrderWindow('EDIT DRUG ORDER','GROUP','${ existingOrder.orderid }','${ existingOrder.drugname.getDisplayString() }','${ existingOrder.startdate }','${ existingDrugOrdersMain.get(existingOrder.orderid).dose }','${ existingDrugOrdersMain.get(existingOrder.orderid).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderid).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderid).duration }','${ existingDrugOrdersMain.get(existingOrder.orderid).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderid).quantity }','${ existingDrugOrdersMain.get(existingOrder.orderid).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderid).frequency }','${ existingOrder.refill }','${ existingOrder.refillinterval }','${ existingOrder.associateddiagnosis.getDisplayString() }','${ existingOrder.isallergicorderreasons }','${ existingOrder.priority.getDisplayString() }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }')"></i>
                                                <i class="icon-trash delete-action" title="${ ui.message("Delete") }" onclick="discardSingleOrder('${ existingOrder.orderid }')"></i>
                                            </span>
                                        </div>
                                    </div>

                                <% } %>
                            <% } %><br/>
                            
                            <div class="groupButton">
                                <span id="button">
                                    <i class="icon-plus edit-action" title="${ ui.message("ADD DRUG ORDER") }" onclick="showAddOrderToGroupWindow('CREATE DRUG ORDER','${existingDrugOrder.key}')"></i>
                                    <i class="icon-trash delete-action" title="${ ui.message("Discard") }" onclick="showDiscardGroupOrderWindow('${existingDrugOrder.key}')"></i>
                                </span>
                            </div>
                        </td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                    </tr>
                <% } %>
            </tbody>
        </table><br/>

        <% if(existingDrugOrdersExtension.size() > 0) { %>
            <div class="pull-left">
                <button type="submit" id="confirmOrderGroup" name="action" value="GroupOrder" ng-disabled="!groupCheckBox">Group Selected</button>
            </div>
        <% } %>
    </form>
</div>

<script>
    jq('#currentDrugOrdersTable').dataTable({
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
    jq(".orderRow td:not(:first-child)").click(function(){
        jq(this).parent().children('td').slice(1, 3).css({"background": "#75b2f0","color": "white"});
    });
</script>
    
<script type="text/javascript">    
    jq(".groupDrugDetails").click(function(){
        jq(this).css({"background": "#75b2f0","color": "white"});
    });
</script>
    
<script type="text/javascript">    
    jq(".groupDrugButton").click(function(){
        jq(this).parent().children('.groupDrugDetails').css({"background": "#75b2f0","color": "white"});
    });
</script>
    
<script type="text/javascript">    
    jq(".groupButton").hover(function(event){
        if(event.type == 'mouseenter'){
            jq(this).parent().children('.groupSingles').children('.groupDrugDetails').css({"background": "#75b2f0","color": "white"});
        } else {
            jq(this).parent().children('.groupSingles').children('.groupDrugDetails').css({"background": "","color": ""});
        }
    });
    
</script>