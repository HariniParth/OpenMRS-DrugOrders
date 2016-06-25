<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="allergicOrderWindow">
    <div class="dialog-header">
        <h3 id="text_heading">${ ui.message("Create Individual Drug Order") }</h3>
    </div>
    <div class="addAllergicOrderWindow">
        <label id="alert">Note!!! This is an allergic drug!</label>
        <form method="post">
            <div class="fields">
                <div class="fields"><label>Drug name </label>
                    <input type="text" id="drugname" name="drugname" value="${drugname}"/>
                    <div class="fields">${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDateSet', label: 'Start Date ', formFieldName: 'startDate', useTime: '', defaultDate: startDate]) }</div> 
                </div>
            </div>
            <div class="fields">
                <label>Enter the reasons for ordering an allergic drug - </label>
                <input id="allergicOrderReason" type="text" name="allergicOrderReason"/>
            </div>
            <button class="confirm right" id="btn-place" name="confirmDrug" type="submit" onclick="showAllergicDrugOrderDetailsWindow()">${ ui.message("Next") }</button>
            <button class="cancel" id="btn-place" onclick="hideAllergicDrugOrderWindow()">${ ui.message("Back") }</button>
        </form>
    </div>
</div>

