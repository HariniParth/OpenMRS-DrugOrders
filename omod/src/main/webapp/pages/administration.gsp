<%
    ui.decorateWith("appui", "standardEmrPage");
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "drugorders.js")
%>

<a href="/openmrs-standalone/admin/index.htm" id="adminLink">Administration</a>
<h3>${ ui.message("DRUG ORDERS ADMINISTRATION") }</h3>

<br/><br/>

<div class="info-body">
    
    <div id="selectionWindow"> 
        <div>
            <h4>${ ui.message("Create New Medication Plan") }
                <input id="button" type="submit" value="ADD" onclick="displayPlanCreationWindow()"/>
            </h4>
        </div>
        
        <a href="#" id="existingPlansLinkView" onclick="showExistingMedicationPlans()">(Click to view existing medication plans)</a>
        <a href="#" id="existingPlansLinkHide" onclick="hideExistingMedicationPlans()">(Click to hide existing medication plans)</a>
            
    </div>

    <div id="creationWindow"> 
        <div id="newPlanWindow"> 
            ${ ui.includeFragment("drugorders", "administration") }
        </div>
    </div>
    
</div>