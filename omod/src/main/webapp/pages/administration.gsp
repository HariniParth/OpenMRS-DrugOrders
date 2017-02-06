<%
    ui.decorateWith("appui", "standardEmrPage");
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "drugorders.js")
    ui.includeJavascript("drugorders", "dataTables.js")
%>

<script type="text/javascript">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.message("drugorders.administration") }", link: '/' + OPENMRS_CONTEXT_PATH + '/admin/index.htm' },
        { label: "${ ui.message("drugorders.administrators") }" }
    ];

</script>

<br/>

<div class="info-body">
    
    <div id="selectionWindow">
        <div id="line-break"></div>
        <h3>
            <i class="icon-medicine"></i>
            <strong>${ ui.message("AVAILABLE MEDICATION PLANS") }</strong>
            <i class="icon-plus edit-action right" title="${ ui.message("CREATE MEDICATION PLAN") }" onclick="displayPlanCreationWindow()"></i>
        </h3>
        <div id="line-break"></div>
        <br/><br/>

        <table id="MedPlansTable">
            <thead>
                <tr>
                    <th>Plan Name</th>
                    <th style="text-align: right">Action</th>
                </tr>
            </thead>
            <tbody>
                <% if(allMedicationPlans.size() == 0) { %>
                    <tr><td colspan="2" align="center">No Plans Found</td></tr>
                <% } %>
        
                <div id="existingMedPlansWindow">
                    <% allMedicationPlans.each { medPlan -> %>
                        <% if(medPlan.value.size() > 0) { %>
                            <tr>
                                <td class="planDetails">
                                    <div class="fields">
                                        <span class="viewDetails">
                                            <i class="icon-plus-sign edit-action" title="${ ui.message("View Details") }"></i>
                                            <i class="icon-minus-sign edit-action" title="${ ui.message("Hide Details") }"></i>
                                        </span>
                                        ${ medPlan.key.getDisplayString().toUpperCase() }
                                    </div><br/>
                                    
                                    <div class="existingMedPlansDetailsWindow">
                                        <% medPlan.value.each { med -> %>
                                        
                                            <div class="detailsLink">
                                                
                                                <div class="fields" id="order_value" onclick="viewMedPlanWindow('${medPlan.key.getDisplayString().toUpperCase()}','${med.drugId.getDisplayString()}','${med.dose}','${med.doseUnits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityUnits.getDisplayString()}','${med.duration}','${med.durationUnits.getDisplayString()}','${med.frequency}')">
                                                    <div>${med.drugId.getDisplayString()}</div>
                                                    <div><span class="itemSummary">${med.dose} ${med.doseUnits.getDisplayString()}, ${med.duration} ${med.durationUnits.getDisplayString()}</span></div>
                                                </div>
                                                
                                                <div id="button" class="pull-right">
                                                    <i class="icon-trash delete-action" title="${ ui.message("Discard") }" onclick="deleteMedPlanItem('${med.id}','${med.diseaseId.getDisplayString()}','${med.drugId.getDisplayString()}','${med.dose}','${med.doseUnits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityUnits.getDisplayString()}','${med.duration}','${med.durationUnits.getDisplayString()}','${med.frequency}')"></i>
                                                    <i class="icon-edit edit-action" title="${ ui.message("Edit") }" onclick="editPlanItemDetails('${med.id}','${med.diseaseId.getDisplayString()}','${med.drugId.getDisplayString()}','${med.dose}','${med.doseUnits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityUnits.getDisplayString()}','${med.duration}','${med.durationUnits.getDisplayString()}','${med.frequency}')"></i>
                                                </div><br/>
                                                
                                            </div>
                                            
                                        <% } %> 
                                    </div>
                                </td>
                                <td class="planButtons">
                                    <span id="button">
                                        <i class="icon-trash delete-action pull-right" title="${ ui.message("Discard Med Plan") }" onclick="deleteMedPlan('${medPlan.key.getDisplayString()}')"></i>
                                        <i class="icon-edit edit-action pull-right" title="${ ui.message("Rename Plan Name") }" onclick="editPlanDetails('${medPlan.key.getDisplayString()}')"></i>
                                        <i class="icon-plus edit-action pull-right" title="${ ui.message("Add Drug To Plan") }" onclick="addPlanItemWindow('${medPlan.key.getDisplayString()}')"></i>
                                    </span>
                                </td>
                            </tr>
                        <% } %>
                    <% } %>            
                </div> 
            </tbody>
        </table>
    </div>

    <div id="creationWindow"> 
        <div id="newPlanWindow"> 
            ${ ui.includeFragment("drugorders", "administration") }
            
            <% if(diseasePlanName.size() > 0) { %>
                ${ ui.includeFragment("drugorders", "administrationAction") }
            <% } %>
        </div>
    </div>
    
</div>

<script>
    jq('#MedPlansTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": true,
        "bSort": true,
        "bJQueryUI": true,
        "bInfo": false

    });
</script>

<script type="text/javascript">
    jq(".icon-plus-sign").click(function(){
        jq(this).parent().parent().nextAll(".existingMedPlansDetailsWindow").first().show();
        jq(this).hide();
        jq(this).nextAll(".icon-minus-sign").show();
    });
</script>

<script type="text/javascript">
    jq(".icon-minus-sign").click(function(){
        jq(this).parent().parent().nextAll(".existingMedPlansDetailsWindow").first().hide();
        jq(this).hide();
        jq(this).prevAll(".icon-plus-sign").show();
    });
</script>

<script type="text/javascript">    
    jq(".detailsLink").click(function(){
        jq(this).children('div > *').slice(0, 1).css({"background": "#75b2f0","color": "white"});
    });
</script>

<script type="text/javascript">    
    jq(".planButtons").click(function(){
    
        jq(this).parent().children().slice(0, 1).children(".existingMedPlansDetailsWindow").show();
        jq(this).parent().children().children().children().children(".icon-plus-sign").hide();
        jq(this).parent().children().children().children().children(".icon-minus-sign").show();
        
    });
</script>