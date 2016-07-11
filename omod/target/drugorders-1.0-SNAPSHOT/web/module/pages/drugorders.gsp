<%
    ui.decorateWith("appui", "standardEmrPage");
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "drugorders.js")
    def isAllergic = false;
    def editAction = false;
%>
        
<script type="text/javascript">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.format(patient.familyName) }, ${ ui.format(patient.givenName) }" , link: '${ui.pageLink("coreapps", "clinicianfacing/patient", [patientId: patient.id])}'},
        { label: "${ ui.message("drugorders.drugorders") }" }
    ];
     
    var patient = { id: ${ patient.id } };

</script>
 

<div class="info-body">

    <div id="orderSummaryBody">
        
        <div id="allergyList">
            Drug Allergies:
            <% if (allergies.allergyStatus != "See list") { %>
                ${ ui.message(allergies.allergyStatus) }
            <% } else { %>
                <% allergies.each { allergy -> %>
                    ${ allergy.allergen }
                <% } %>
            <% } %>
            
        </div>
        
        <div id="individualOrderWindow">
            <div>
                <h3>${ ui.message("ACTIVE INDIVIDUAL DRUG ORDERS") }
                    <input id="addSingleOrder" type="submit" value="ADD" onclick="showIndividualDrugOrderWindow()"/>
                </h3>
            </div>

            <a href="#"><span class="show">(Click to view discontinued/canceled/fulfilled orders)</span></a>
            <br/><br/>
            
        </div>
        
        <div id="currentDrugOrdersWindow">
            ${ ui.includeFragment("drugorders", "drugOrderSingle") }
        </div>
        
        <br/><br/>

        <div id="medicationPlanOrderWindow">
            <div>
                <h3>${ ui.message("ACTIVE MEDICATION PLAN ORDERS") }
                    <input id="addMedPlanOrder" type="submit" value="ADD" onclick="showMedicationPlanOrderWindow()"/>
                </h3>
            </div>

            <a href="#"><span class="show">(Click to view discontinued/canceled/fulfilled orders)</span></a>
            <br/><br/>
            
        </div>
        
    </div>
    
    <div id="orderWindowsBody">
    
        <div id="addSingleOrderWindow">
            ${ ui.includeFragment("drugorders", "addNewOrder") }
        </div>
        
        <div id="addSingleOrderDetailsWindow">
            <% if(drugname != "") { %>
                <% allergies.each { allergy -> %>
                    <% if(drugname == "${allergy.allergen}") { %>
                        <% isAllergic = true; %>
                    <% } %>
                <% } %>
                <% if(isAllergic && allergicOrderReason == "") { %>
                    ${ ui.includeFragment("drugorders", "allergicDrugOrderReasons") }
                    
                    <% if(allergicOrderReason != "") { %>
                        ${ ui.includeFragment("drugorders", "addDrugOrderSingleDetails") }
                    <% } %>
            
                <% } else { %>
                    ${ ui.includeFragment("drugorders", "addDrugOrderSingleDetails") }
                <% } %>
            <% } %>

        </div>

        <div id="drugOrderView">
            ${ ui.includeFragment("drugorders", "viewDrugOrderSingle") }
        </div>
        
        <div id="editOrderWindow">
            ${ ui.includeFragment("drugorders", "editDrugOrder") }
        </div>
        
    </div>
</div>
