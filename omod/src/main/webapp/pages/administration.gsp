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
        <h3 id="header">${ ui.message("AVAILABLE MEDICATION PLANS") }
            <span id="button" class="pull-right"><i class="icon-plus edit-action" title="${ ui.message("CREATE MEDICATION PLAN") }" onclick="displayPlanCreationWindow()"></i></span>
        </h3><br/><br/>

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
                                <td class="fields">
                                    <span class="viewDetails">
                                        <i class="icon-plus-sign edit-action" title="${ ui.message("View Details") }"></i>
                                        <i class="icon-minus-sign edit-action" title="${ ui.message("Hide Details") }"></i>
                                    </span>
                                    ${ medPlan.key.getDisplayString().toUpperCase() }

                                    <div class="existingMedPlansDetailsWindow">
                                        <% medPlan.value.each { med -> %>
                                            <p class="fields">
                                                <a href="#" onclick="viewMedPlanWindow('${medPlan.key.getDisplayString().toUpperCase()}','${med.drugid.getDisplayString()}','${med.dose}','${med.doseunits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityunits.getDisplayString()}','${med.duration}','${med.durationunits.getDisplayString()}','${med.frequency}')">${med.drugid.getDisplayString()}</a>

                                                <span id="button" class="pull-right">
                                                    <i class="icon-trash delete-action" title="${ ui.message("Delete") }" onclick="deleteMedPlanItem('${med.id}','${med.diseaseid.getDisplayString()}','${med.drugid.getDisplayString()}','${med.dose}','${med.doseunits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityunits.getDisplayString()}','${med.duration}','${med.durationunits.getDisplayString()}','${med.frequency}')"></i>
                                                    <i class="icon-edit edit-action" title="${ ui.message("Edit") }" onclick="editPlanItemDetails('${med.id}','${med.diseaseid.getDisplayString()}','${med.drugid.getDisplayString()}','${med.dose}','${med.doseunits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityunits.getDisplayString()}','${med.duration}','${med.durationunits.getDisplayString()}','${med.frequency}')"></i>
                                                </span><br/>
                                            </p>
                                        <% } %> 
                                    </div>
                                </td>
                                <td>
                                    <span id="button">
                                        <i class="icon-trash delete-action pull-right" title="${ ui.message("Discard Med Plan") }" onclick="deleteMedPlan('${medPlan.key.getDisplayString()}')"></i>
                                        <i class="icon-edit edit-action pull-right" title="${ ui.message("Change Plan Name") }" onclick="editPlanDetails('${medPlan.key.getDisplayString()}')"></i>
                                        <i class="icon-plus edit-action pull-right" title="${ ui.message("Add Another Drug") }" onclick="addPlanItemWindow('${medPlan.key.getDisplayString()}')"></i>
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

<script type="text/javascript">
    jq('#MedPlansTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": true,
        "bSort": true,
        "bJQueryUI": true,
        "bInfo": false

    });
    
    jq(".icon-plus-sign").click(function(){
        jq(this).parent().nextAll(".existingMedPlansDetailsWindow").first().show();
        jq(this).hide();
        jq(this).nextAll(".icon-minus-sign").show();
    });
    
    jq(".icon-minus-sign").click(function(){
        jq(this).parent().nextAll(".existingMedPlansDetailsWindow").first().hide();
        jq(this).hide();
        jq(this).prevAll(".icon-plus-sign").show();
    });
</script>