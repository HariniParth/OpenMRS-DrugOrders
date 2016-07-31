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
        
        <br/><br/><br/><br/>
        
        <a href="#" onclick="showIndividualOrderDetailsWindow()">Add another order</a>
        
        <br/><br/>

        <button class="confirm right" id="btn-place" type="submit" name="action" value="confirmOrder">${ ui.message("Submit") }</button>
        <button class="cancel" id="btn-place" type="submit" name="action" value="cancelOrder">${ ui.message("Cancel") }</button>
        
    </form>
    
</div>