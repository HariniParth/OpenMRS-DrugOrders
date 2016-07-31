<%
    ui.decorateWith("appui", "standardEmrPage");
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "drugorders.js")
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
        
        <br/><br/>

        <div id="individualOrderWindow"> 
            <div>
                <h3>${ ui.message("ACTIVE INDIVIDUAL DRUG ORDERS") }
                    <input id="button" type="submit" value="ADD" onclick="showIndividualOrderDetailsWindow()"/>
                </h3>
            </div>

            <a href="#" id="nonActiveOrdersLinkView" onclick="showDiscontinuedFulfilledOrders()">(Click to view discontinued/canceled/fulfilled orders)</a>
            <a href="#" id="nonActiveOrdersLinkHide" onclick="hideDiscontinuedFulfilledOrders()">(Click to hide discontinued/canceled/fulfilled orders)</a>
            <br/><br/>
            
        </div>
        
        <div id="currentDrugOrdersWindow">
            ${ ui.includeFragment("drugorders", "drugOrderSingle") }
        </div>
        
        <br/><br/>

        <div id="medicationPlanOrderWindow">
            <div>
                <h3>${ ui.message("ACTIVE MEDICATION PLAN ORDERS") }
                    <input id="button" type="submit" value="ADD" onclick="showMedicationPlanOrderWindow()"/>
                </h3>
            </div>

            <a href="#"><span class="show">(Click to view discontinued/canceled/fulfilled orders)</span></a>
            <br/><br/>
            
        </div>
        
    </div>
    
    <div id="orderWindowsBody">
        
        <div id="addMedicationPlanWindow">
            ${ ui.includeFragment("drugorders", "addNewOrder") }
        </div>
        
        <div id="addSingleOrderDetailsWindow">
            ${ ui.includeFragment("drugorders", "addDrugOrderSingleDetails") }  
        </div>
        
        <div id="confirmOrderView">
            ${ ui.includeFragment("drugorders", "confirmOrder") }
        </div>

        <div id="showEditOrderView">
            ${ ui.includeFragment("drugorders", "editDrugOrder") }
        </div>
               
    </div>
</div>