<%
    ui.decorateWith("appui", "standardEmrPage");
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "drugorders.js")
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
        <div>
            <h3 id="header">${ ui.message("AVAILABLE MEDICATION PLANS") }
                <span id="button" class="pull-right"><i class="icon-plus edit-action" title="${ ui.message("CREATE MEDICATION PLAN") }" onclick="displayPlanCreationWindow()"></i></span>
            </h3>
        </div>
        
        <br/><br/>

        <div id="existingMedPlansWindow">
            <% allMedicationPlans.each { medPlan -> %>
                <% if(medPlan.value.size() > 0) { %>
                
                    <span id="order_label">${ medPlan.key.getDisplayString().toUpperCase() }</span>
                    <a href="#" class="detailsLink">Details</a>
                    <span id="button">
                        <i class="icon-remove delete-action pull-right" title="${ ui.message("Delete") }" onclick="deleteMedPlan('${medPlan.key.getDisplayString()}')"></i>
                        <i class="icon-pencil edit-action pull-right" title="${ ui.message("Edit") }" onclick="editPlanDetails('${medPlan.key.getDisplayString()}')"></i>
                        <i class="icon-plus edit-action pull-right" title="${ ui.message("Add Another Drug") }" onclick="addPlanItemWindow('${medPlan.key.getDisplayString()}')"></i>
                    </span><br/><br/>
                    
                    <div class="existingMedPlansDetailsWindow">
                        <% medPlan.value.each { med -> %>
                            <p>
                                <a href="#" onclick="viewMedPlanWindow('${medPlan.key.getDisplayString().toUpperCase()}','${med.drugid.getDisplayString()}','${med.dose}','${med.doseunits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityunits.getDisplayString()}','${med.duration}','${med.durationunits.getDisplayString()}','${med.frequency}')">${med.drugid.getDisplayString()}</a>

                                <span id="button">
                                    <i class="icon-remove delete-action pull-right" title="${ ui.message("Delete") }" onclick="deleteMedPlanItem('${med.id}','${med.diseaseid.getDisplayString()}','${med.drugid.getDisplayString()}','${med.dose}','${med.doseunits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityunits.getDisplayString()}','${med.duration}','${med.durationunits.getDisplayString()}','${med.frequency}')"></i>
                                    <i class="icon-pencil edit-action pull-right" title="${ ui.message("Edit") }" onclick="editPlanItemDetails('${med.id}','${med.diseaseid.getDisplayString()}','${med.drugid.getDisplayString()}','${med.dose}','${med.doseunits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityunits.getDisplayString()}','${med.duration}','${med.durationunits.getDisplayString()}','${med.frequency}')"></i>
                                </span><br/>
                            </p><br/>
                        <% } %> 
                    </div>
                <% } %>
            <% } %>
            
            <script type="text/javascript">
                jq(".detailsLink").click(function(){
                    jq(this).nextAll(".existingMedPlansDetailsWindow").toggle();
                });
            </script>
            
        </div>
        
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
