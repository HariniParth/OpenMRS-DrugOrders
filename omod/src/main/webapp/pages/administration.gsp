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
                        <p>
                            <span id="order_label">${med.drugid.getDisplayString()}</span>
                            <a href="#" class="detailsLink">Details</a>
                            
                            <span id="button">
                                <i class="icon-remove delete-action pull-right" title="${ ui.message("Delete") }" onclick="deleteMedPlanItem('${med.id}','${med.diseaseid.getDisplayString()}','${med.drugid.getDisplayString()}','${med.dose}','${med.doseunits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityunits.getDisplayString()}','${med.duration}','${med.durationunits.getDisplayString()}','${med.frequency}')"></i>
                                <i class="icon-pencil edit-action pull-right" title="${ ui.message("Edit") }" onclick="editPlanItemDetails('${med.id}','${med.diseaseid.getDisplayString()}','${med.drugid.getDisplayString()}','${med.dose}','${med.doseunits.getDisplayString()}','${med.route.getDisplayString()}','${med.quantity}','${med.quantityunits.getDisplayString()}','${med.duration}','${med.durationunits.getDisplayString()}','${med.frequency}')"></i>
                            </span><br/><br/>
                            
                            <span class="planItemDetails">
                                <span id="order_label">Dose:</span>
                                <span id="order_value">${med.dose}</span>
                                <span id="order_label">Dose units:</span>
                                <span id="order_value">${med.doseunits.getDisplayString()}</span>
                                <span id="order_label">Route:</span>
                                <span id="order_value">${med.route.getDisplayString()}</span>
                                <span id="order_label">Quantity:</span>
                                <span id="order_value">${med.quantity}</span>
                                <span id="order_label">Qnty units:</span>
                                <span id="order_value">${med.quantityunits.getDisplayString()}</span>
                                <span id="order_label">Duration:</span>
                                <span id="order_value">${med.duration}</span>
                                <span id="order_label">Durn units:</span>
                                <span id="order_value">${med.durationunits.getDisplayString()}</span>
                                <span id="order_label">Frequency:</span>
                                <span id="order_value">${med.frequency}</span>
                            </span><br/>
                        </p>
                    <% } %> 
                <% } %>
            <% } %>
            
            <script type="text/javascript">
                jq(".detailsLink").click(function(){
                    jq(this).nextAll(".planItemDetails").toggle();
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