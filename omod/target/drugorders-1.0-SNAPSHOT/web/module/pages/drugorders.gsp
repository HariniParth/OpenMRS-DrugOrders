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
                    <input id="addSingleOrder" type="button" value="ADD" onclick="showIndividualDrugOrderWindow()"/>
                </h3>
            </div>

            ${ ui.includeFragment("drugorders", "drugOrderSingle") }
            <br/><br/>
            
        </div>

        <div id="currentDrugOrdersWindow">
            <% existingDrugOrdersExtension.each { existingDrugOrderExtension -> %>
                <% existingDrugOrdersMain.each { existingDrugOrderMain -> %>
                    <% if(existingDrugOrderMain.orderId == existingDrugOrderExtension.orderId) { %>
                        <span id="entries">
                            <a href="#" id="existingDrugOrdersID" onclick="showDrugOrderViewWindow('${ existingDrugOrderExtension.orderId }','${ existingDrugOrderExtension.patientid }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrderExtension.startdate }','${ existingDrugOrderExtension.drugname }','${ existingDrugOrderExtension.patientinstructions }','${ existingDrugOrderExtension.pharmacistinstructions }')">
                                ${ existingDrugOrderMain.orderId } 
                                ${ existingDrugOrderExtension.drugname } ${ existingDrugOrderExtension.startdate } 
                            </a>    
                        </span>

                        <span id="button">
                            <input id="editOrder" type="submit" value="Edit" onclick="editIndividualDrugOrderWindow('${ existingDrugOrderMain.orderId }')"/>
                            <input id="deleteOrder" type="submit" value="Discontinue" onclick="showDiscontinueIndividualDrugOrderWindow('${ existingDrugOrderMain.orderId }')"/>
                        </span>
                    <% } %>
                <% } %>
                <br/><br/>
            <% } %>
        </div>    
        
    </div>
    
    <div id="orderWindowsBody">
    
        <div id="addSingleOrderWindow">
            ${ ui.includeFragment("drugorders", "addDrugOrderSingle") }
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

        <div id="discontinueOrderWindow">
            ${ ui.includeFragment("drugorders", "discontinueDrugOrder") }
        </div>
    
    </div>
</div>
