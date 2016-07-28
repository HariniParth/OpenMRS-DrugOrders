<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="confirmDrugOrderView">
        
    <form method="post">
        <h4 id="header">${ ui.message("Confirm Order") }</h4>

        <br/><br/>

        <% if(drugOrderExtension != null) { %>
            <% drugOrderExtension.each { dorderExtension -> %>
                <a href="#" class="fields">${dorderExtension.drugname} ${dorderExtension.startdate}</a>
                <span id="button">
                    <i class="icon-pencil edit-action" title="${ ui.message("Edit") }"></i>
                    <i class="icon-remove delete-action" title="${ ui.message("Delete") }"></i>
                </span>
                <br/><br/>
            <% } %>
        <% } %>
        
        <% if(disease_name != null) { %>
            ${ disease_name } ${ medPlanStartDate }
        <% } %>
        
        <br/><br/><br/><br/>
        
        <a href="#" onclick="addAnotherOrderWindow()">Add another order</a>
        
        <br/><br/>
        
        <input type="hidden" name="action" value="confirmOrder" />
        <button class="confirm right" id="btn-place" type="submit">${ ui.message("Submit") }</button>
        <button class="cancel" id="btn-place" onclick="hideConfirmOrderWindow()" type="button">${ ui.message("Cancel") }</button>
    </form>
    
</div>