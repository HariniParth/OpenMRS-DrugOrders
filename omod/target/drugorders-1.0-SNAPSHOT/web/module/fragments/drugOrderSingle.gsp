<%
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "dataTables.js")
%>

<div id="currentDrugOrdersTableWrapper">
    <form method="post" name="groupForm">
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
                    <tr class="orderRow <% if(existingDrugOrderExtension.discontinued == 1) { %> discontinued <% } %> <% if(existingDrugOrderExtension.onHold == 1) { %> onhold <% } %>" title="${ ui.message(existingDrugOrderExtension.comments) }">

                        <td><span><input type="checkbox" name="groupCheckBox" value="${ existingDrugOrderExtension.orderId }" ng-model="groupCheckBox" /></span></td>

                        <td class="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate.format('yyyy-MM-dd') }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).dose }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).duration }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantity }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).frequency }','${ existingDrugOrderExtension.refill }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }','${ existingDrugOrderExtension.comments }')">
                            <div>${ existingDrugOrderExtension.drugname.getDisplayString().toUpperCase() }</div>
                            <div><span class="itemSummary">${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).dose } ${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).doseUnits.getDisplayString() }, ${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).duration } ${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).durationUnits.getDisplayString() }</span></div>
                        </td>

                        <td class="existingDrugOrdersID" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate.format('yyyy-MM-dd') }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).dose }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).duration }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantity }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).frequency }','${ existingDrugOrderExtension.refill }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }','${ existingDrugOrderExtension.comments }')">${ existingDrugOrderExtension.startdate.format('yyyy-MM-dd') }</td>

                        <td>
                            <span id="button">
                                <i class="icon-edit edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','SINGLE','${ existingDrugOrderExtension.orderId }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).dose }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).duration }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantity }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).frequency }','${ existingDrugOrderExtension.refill }','${ existingDrugOrderExtension.refillinterval }','${ existingDrugOrderExtension.associateddiagnosis.getDisplayString() }','${ existingDrugOrderExtension.isallergicorderreasons }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
                                <i class="icon-trash delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ existingDrugOrderExtension.orderId }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate.format('yyyy-MM-dd') }','${ existingDrugOrderExtension.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).dose }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).duration }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantity }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingDrugOrderExtension.orderId).frequency }','${ existingDrugOrderExtension.priority.getDisplayString() }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')"></i>
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

                                    <div class="groupSingles <% if(existingOrder.discontinued == 1) { %> discontinued <% } %> <% if(existingOrder.onHold == 1) { %> onhold <% } %>" title="${ ui.message(existingOrder.comments) }">
                                        
                                        <div class="groupDrugDetails" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingOrder.startdate.format('yyyy-MM-dd') }','${ existingOrder.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).dose }','${ existingDrugOrdersMain.get(existingOrder.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).duration }','${ existingDrugOrdersMain.get(existingOrder.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantity }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).frequency }','${ existingOrder.refill }','${ existingOrder.isallergicorderreasons }','${ existingOrder.priority.getDisplayString() }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }','${ existingOrder.comments }')">
                                            
                                            <div class="existingDrugOrdersID" id="groupDrugName">
                                                <div>${ existingOrder.drugname.getDisplayString().toUpperCase() }</div>
                                                <div><span class="itemSummary">${ existingDrugOrdersMain.get(existingOrder.orderId).dose } ${ existingDrugOrdersMain.get(existingOrder.orderId).doseUnits.getDisplayString() }, ${ existingDrugOrdersMain.get(existingOrder.orderId).duration } ${ existingDrugOrdersMain.get(existingOrder.orderId).durationUnits.getDisplayString() }</span></div>
                                            </div>
                                            <% orderList = orderList + existingOrder.drugname.getDisplayString() + "," %>

                                            <div class="existingDrugOrdersID" id="groupDrugDate">${ existingOrder.startdate.format('yyyy-MM-dd') }</div>
                                        </div>

                                        <div class="groupDrugButton">
                                            <span id="button">
                                                <i class="icon-edit edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','GROUP','${ existingOrder.orderId }','${ existingOrder.drugname.getDisplayString() }','${ existingOrder.startdate }','${ existingDrugOrdersMain.get(existingOrder.orderId).dose }','${ existingDrugOrdersMain.get(existingOrder.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).duration }','${ existingDrugOrdersMain.get(existingOrder.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantity }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).frequency }','${ existingOrder.refill }','${ existingOrder.refillinterval }','${ existingOrder.associateddiagnosis.getDisplayString() }','${ existingOrder.isallergicorderreasons }','${ existingOrder.priority.getDisplayString() }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }')"></i>
                                                <i class="icon-trash delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ existingOrder.orderId }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingOrder.startdate.format('yyyy-MM-dd') }','${ existingOrder.drugname.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).dose }','${ existingDrugOrdersMain.get(existingOrder.orderId).doseUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).route.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).duration }','${ existingDrugOrdersMain.get(existingOrder.orderId).durationUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantity }','${ existingDrugOrdersMain.get(existingOrder.orderId).quantityUnits.getDisplayString() }','${ existingDrugOrdersMain.get(existingOrder.orderId).frequency }','${ existingOrder.priority.getDisplayString() }','${ existingOrder.patientinstructions }','${ existingOrder.pharmacistinstructions }')"></i>
                                            </span>
                                        </div>
                                    </div>

                                <% } %>
                            <% } %><br/>
                            
                            <div class="groupButton">
                                <span id="button">
                                    <i class="icon-plus edit-action" title="${ ui.message("ADD DRUG ORDER") }" onclick="showAddOrderToGroupWindow('CREATE DRUG ORDER','${existingDrugOrder.key}')"></i>
                                    <i class="icon-trash delete-action" title="${ ui.message("Discard") }" onclick="showDiscardGroupOrderWindow('DISCARD ORDER GROUP','${existingDrugOrder.key}','${orderList}')"></i>
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