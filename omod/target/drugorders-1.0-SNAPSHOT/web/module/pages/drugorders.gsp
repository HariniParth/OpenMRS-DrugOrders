<%
    ui.decorateWith("appui", "standardEmrPage");
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "drugorders.js")
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
    Drug Allergies: 
    <% if (allergies.allergyStatus != "See list") { %>
        ${ ui.message(allergies.allergyStatus) }
    <% } else { %>
        <% allergies.each { allergy -> %>
            ${ allergy.allergen }
        <% } %>
    <% } %>
    
    

    <div id="individualOrderBody">
        <span id="individualOrderBody"></span>
        <div id="individualOrderWindow">
            <div>
                <h3>${ ui.message("ACTIVE INDIVIDUAL DRUG ORDERS") }
                    <input id="addSingleOrder" type="button" value="ADD" onclick="showIndividualDrugOrderWindow()"/>
                </h3>
            </div>

            ${ ui.includeFragment("drugorders", "drugOrderSingle") }
        </div>

        <div id="addSingleOrderWindow">
            ${ ui.includeFragment("drugorders", "addDrugOrderSingle") }
        </div>
        
        <div id="addSingleOrderDetailsWindow">
            <% if(drugname != "") { %>
                ${ ui.includeFragment("drugorders", "addDrugOrderSingleDetails") }
            <% } %>
        </div>
        
    </div>
    
</div>

