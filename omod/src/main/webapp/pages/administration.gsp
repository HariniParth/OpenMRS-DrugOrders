<%
    ui.decorateWith("appui", "standardEmrPage");
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "drugorders.js")
%>

<a href="/openmrs-standalone/admin/index.htm" id="adminLink">Administration</a>
<h3>${ ui.message("DRUG ORDERS ADMINISTRATION") }</h3>

<br/>

<div class="info-body">
    
    <div id="selectionWindow"> 
        <div>
            <h4>${ ui.message("Create New Medication Plan") }
                <input id="button" type="submit" value="ADD" onclick="displayPlanCreationWindow()"/>
            </h4>
        </div>
        
        <a href="#" id="existingPlansLinkView" onclick="showExistingMedicationPlans()">(Click to view existing medication plans)</a>
        <a href="#" id="existingPlansLinkHide" onclick="hideExistingMedicationPlans()">(Click to hide existing medication plans)</a>
         
        <br/><br/>

        <div id="existingMedPlansWindow">
            <% allMedicationPlans.each { medPlan -> %>
                <% if(medPlan.value.size() > 0) { %>
                
                    <p>${medPlan.key.getDisplayString()}</p> <br/>
                    
                    <% medPlan.value.each { med -> %>
                        <p>${med.drugid.getDisplayString()} ${med.dose} ${med.doseunits.getDisplayString()} ${med.route.getDisplayString()} ${med.quantity} ${med.quantityunits.getDisplayString()} ${med.duration} ${med.durationunits.getDisplayString()} ${med.frequency}
                            <span id="button">
                                <i class="icon-remove delete-action pull-right" title="${ ui.message("Delete") }" onclick="deleteMedPlanItem('${med.id}','${med.diseaseid.getDisplayString()}','${med.drugid.getDisplayString()}','${med.dose}','${med.doseunits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityunits.getDisplayString()}','${med.duration}','${med.durationunits.getDisplayString()}','${med.frequency}')"></i>
                                <i class="icon-pencil edit-action pull-right" title="${ ui.message("Edit") }" onclick="editPlanItemDetails('${med.id}','${med.diseaseid.getDisplayString()}','${med.drugid.getDisplayString()}','${med.dose}','${med.doseunits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityunits.getDisplayString()}','${med.duration}','${med.durationunits.getDisplayString()}','${med.frequency}')"></i>
                            </span> <br/>
                        </p> <br/>
                    <% } %> <br/>
                <% } %>
            <% } %>
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