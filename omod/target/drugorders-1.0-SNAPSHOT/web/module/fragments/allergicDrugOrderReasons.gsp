<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="allergicOrderWindow">
    
    <div class="dialog-header">
        <h3 id="header">${ ui.message("Create Individual Drug Order") }</h3>
    </div>
    
    <div class="addAllergicOrderWindow">
        <br/>
        <label id="alert">Note!!! Patient is allergic to this drug!</label>
        <br/><br/>
        
        <form method="post">
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label>Drug name</label>
                </div>
                <div id="order_value" class="select_field">
                    <input type="text" id="drugname" name="drugname" value="${drugname}"/>
                </div>
            </div>
                  
            <br/><br/>
            
            <div class="fields" id="view_order_detail">
                <div id="order_label">
                    <label>Start Date</label>
                </div>
                <div id="order_value" class="select_field">
                    ${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDateSet', label: '', formFieldName: 'startDate', useTime: '', defaultDate: startDate]) }
                </div>
            </div> 
            
            <br/><br/><br/>

            <div class="fields" id="view_order_detail">
                <label>Enter the reasons for ordering an allergic drug - </label>
            </div>
            
            <div class="fields" id="view_order_detail">
                <input id="allergicOrderReason" type="text" name="allergicOrderReason"/>
            </div>
            
            <button class="confirm right" id="btn-place" name="confirmDrug" type="submit" onclick="showAllergicDrugOrderDetailsWindow()">${ ui.message("Next") }</button>
            <button class="cancel" id="btn-place" onclick="hideAllergicDrugOrderWindow()">${ ui.message("Back") }</button>
        </form>
    </div>
</div>

